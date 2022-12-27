// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Clone} from "./CloneWithImmutableArgs.sol";
import {ClonesWithImmutableArgs} from "clones-with-immutable-args/ClonesWithImmutableArgs.sol";

interface IClonesWithImmutableArgsEvents {
    /// @notice New clone deployed
    /// @param sender deploy txn sender
    /// @param clone new clone address
    event CloneDeployed(address sender, address clone);
}

interface ICloneWithImmutableArgs {
    function initialize(address _wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (address);
}

contract ImmutableArgsCloneFactory is IClonesWithImmutableArgsEvents {
    using ClonesWithImmutableArgs for address;

    /// @notice implementation contract address
    Clone public implementation;

    /// @notice deploy the factory
    /// and along with it, a new Clone and pass in factory address to the implementation
    /// NOTE: We only need this deployed once
    constructor() {
        implementation = new Clone();
    }

    /// @notice Deploys a new clone
    /// @param wethAddress for contract storage
    /// @param _uintOne Storage variable param (as an example to generate salt)
    /// @param _uintTwo Storage variable param (as an example to generate salt)
    function createClone(address wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (Clone clone) {
        bytes memory data = abi.encodePacked(wethAddress, _uintOne, _uintTwo);

        clone = Clone(address(implementation).clone(data));
    }
}
