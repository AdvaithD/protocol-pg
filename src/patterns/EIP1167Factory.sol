// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Clones} from "../lib/Clones.sol";

interface IEIP1167FactoryEvents {
    /// @notice New clone deployed
    /// @param sender deploy txn sender
    /// @param clone new clone address
    event CloneDeployed(address sender, address clone);
}

interface IClone {
    function initialize(address _wethAddress) external returns (address);
}

contract EIP1167Factory is IEIP1167FactoryEvents {
    /// @notice implementation contract address
    address public immutable implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    /// @notice Deploys a new clone
    /// @param TODO
    function createClone() external returns (address clone) {
        clone = Clones.cloneDeterministic(implementation, keccak256(abi.encode( /* */ )));

        IClone(clone).initialize( /* */ );

        emit CloneDeployed(msg.sender, clone);
    }

    function preictAddress(address implementation, bytes32 salt) external view returns (address) {
        return Clones.predictDeterministicAddress(implementation, salt, address(this));
    }
}
