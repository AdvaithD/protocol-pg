/// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {ERC721} from "solmate/tokens/ERC721.sol";

error InvalidProof();

abstract contract ERC721MerkleDrop is ERC721 {
    /// @notice The merkle root, set during contract creation
    bytes32 public immutable root;

    constructor(string memory name, string memory symbol, bytes32 _root) ERC721(name, symbol) {
        root = _root;
    }

    /// @notice redeem an ERC721 token
    /// @param account - account thats part of the merkle tree
    /// @param tokenId - the token id being redeemed
    /// @param proof - generated merkle proof
    /// NOTE: You'll need to use ffi to generate proofs inside a solidity environment
    function redeem(address account, uint256 tokenId, bytes32[] calldata proof) external {
        bytes32 proofElement;
        bytes32 computedHash = keccak256(abi.encodePacked(tokenId, account));
        uint256 proofLength = proof.length;
        unchecked {
            for (uint256 i = 0; i < proofLength; i += 1) {
                proofElement = proof[i];
                assembly {
                    let a := 0x20
                    let b := 0x00
                    if lt(proofElement, computedHash) {
                        a := 0x00
                        b := 0x20
                    }
                    mstore(a, computedHash)
                    mstore(b, proofElement)
                    computedHash := keccak256(0x00, 0x40)
                }
            }
        }

        if (computedHash != root) {
            revert InvalidProof();
        }

        _mint(account, tokenId);
    }
}
