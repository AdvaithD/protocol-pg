// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Clones} from "../lib/Clones.sol";
import {Clone} from "./Clone.sol";

interface IEIP1167FactoryEvents {
    /// @notice New clone deployed
    /// @param sender deploy txn sender
    /// @param clone new clone address
    event CloneDeployed(address sender, address clone);
}

interface IClone {
    function initialize(address _wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (address);
}

contract EIP1167Factory is IEIP1167FactoryEvents {
    /// @notice implementation contract address
    address public immutable implementation;

    /// @notice deploy the factory
    /// and along with it, a new Clone and pass in factory address to the implementation
    /// NOTE: We only need this deployed once
    constructor() {
        implementation = address(new Clone(address(this)));
    }

    /// @notice Deploys a new clone
    /// @param wethAddress for contract storage
    /// @param _uintOne Storage variable param (as an example to generate salt)
    /// @param _uintTwo Storage variable param (as an example to generate salt)
    function createClone(address wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (address clone) {
        clone = Clones.cloneDeterministic(implementation, keccak256(abi.encode(wethAddress, _uintOne, _uintTwo)));

        IClone(clone).initialize(wethAddress, _uintOne, _uintTwo);

        emit CloneDeployed(msg.sender, clone);
    }

    function predict(address implementation, bytes32 salt) external view returns (address) {
        return Clones.predictDeterministicAddress(implementation, salt, address(this));
    }
}
