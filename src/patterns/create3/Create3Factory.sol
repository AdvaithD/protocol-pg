// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "solmate/utils/CREATE3.sol";
import "solmate/auth/Owned.sol";

interface ICreate3Factory {
    function deploy(bytes32 salt, bytes memory creationCode) external payable returns (address deployed);

    function getAddress(address deployer, bytes32 salt) external view returns (address deployed);
}

interface IClone {
    function initialize(address _wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (address);
}

contract Create3Factory is Owned, ICreate3Factory {
    constructor(address owner) Owned(owner) {}

    function deploy(bytes32 salt, bytes memory creationCode) external payable override returns (address deployed) {
        // salt is combined with the msg sender
        salt = keccak256(abi.encodePacked(msg.sender, salt));
        return CREATE3.deploy(salt, creationCode, msg.value);
    }

    function getAddress(address deployer, bytes32 salt) external view override returns (address deployed) {
        // salt is combined with the msg sender
        salt = keccak256(abi.encodePacked(deployer, salt));
        return CREATE3.getDeployed(salt);
    }
}
