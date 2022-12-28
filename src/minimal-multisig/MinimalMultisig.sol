/// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "openzeppelin-contracts/utils/cryptography/ECDSA.sol";
import "openzeppelin-contracts/utils/cryptography/draft-EIP712.sol";
import "openzeppelin-contracts/security/ReentrancyGuard.sol";

contract MinimalMultisig is EIP712, ReentrancyGuard {
    using ECDSA for bytes32;

    event NewSigner(address signer, uint256 threshold);
    event Execution(address destination, bool success, bytes returndata);

    /// @notice Multisig transaction payload
    struct TxnRequest {
        address to;
        uint256 value;
        bytes data;
    }

    /// @notice State Variables
    address public owner;
    address[] public signers;
    mapping(address => bool) isSigner;
    uint256 public threshold;

    constructor() EIP712("MinimalMultisig", "1.0.0") {
        threshold = 1;
        owner = msg.sender;
        signers.push(msg.sender);
        isSigner[msg.sender] = true;
    }

    receive() external payable {}

    /// @notice - returns hash of data to be signed
    /// @param params - struct containing transaction data
    /// @return - packed hash that is to be signed
    function typedDataHash(TxnRequest memory params) public view returns (bytes32) {
        bytes32 digest = _hashTypedDataV4(
            keccak256(
                abi.encode(
                    keccak256("TxnRequest(address to,uint256 value,bytes data)"),
                    params.to,
                    params.value,
                    keccak256(params.data)
                )
            )
        );
        return digest;
    }

    /// @notice - util function to recover a signer given a signatures
    /// @param _to - to address of the transaction
    /// @param _value - transaction value
    /// @param _data - transaction calldata
    function recoverSigner(address _to, uint256 _value, bytes memory _data, bytes memory userSignature)
        external
        view
        returns (address)
    {
        TxnRequest memory params = TxnRequest({to: _to, value: _value, data: _data});
        bytes32 digest = typedDataHash(params);
        return ECDSA.recover(digest, userSignature);
    }

    /// @notice - addAdditionalOwners adds additional owners to the multisig
    /// @param _signer - address to be added to the signers list
    /// @param _threshold - new signature threshold (inclusive of new signer)
    function addAdditionalOwners(address _signer, uint256 _threshold) external onlyOwner {
        require(!isSigner[_signer], "Address is already a signer.");
        require(_threshold <= signers.length + 1, "Threshold cannot exceed number of signers.");
        require(_threshold >= 1, "Threshold cannot be < 1.");
        signers.push(_signer);
        threshold = _threshold;
        isSigner[_signer] = true;

        emit NewSigner(_signer, _threshold);
    }

    /// @notice - Execute a multisig transaction given an array of signatures, and TxnRequest params
    /// @param signatures - array of signatures from multisig holders
    /// @param _to - address a transaction should be sent to
    /// @param _value - transaction value
    /// @param _data - data to be sent with the transaction (e.g: to call a contract function)
    function executeTransaction(bytes[] memory signatures, address _to, uint256 _value, bytes memory _data)
        external
        onlySigner
        nonReentrant
    {
        /// require minimum # of signatures (m-of-n)
        require(signatures.length >= threshold, "Invalid number of signatures");
        require(_to != address(0), "Cannot send to zero address.");
        /// construct transaction
        TxnRequest memory txn = TxnRequest({to: _to, value: _value, data: _data});
        /// create typed hash
        bytes32 digest = typedDataHash(txn);
        /// get the signer of the message
        for (uint256 i = 0; i < threshold; i++) {
            /// recover signer address
            address signer = ECDSA.recover(digest, signatures[i]);
            /// verify that signer is owner (any signer can execute the transaction given a set of off-chain signatures)
            require(isSigner[signer], "Invalid signer");
        }

        /// execute transaction
        (bool success, bytes memory returndata) = txn.to.call{value: txn.value}(_data);
        require(success, "Failed transaction");
        emit Execution(txn.to, success, returndata);
    }

    function getOwnerCount() external view returns (uint256) {
        return signers.length;
    }

    modifier onlySigner() {
        require(isSigner[msg.sender], "Unauthorized signer.");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized. Owner only.");
        _;
    }
}
