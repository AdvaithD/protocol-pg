// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.15;

import {Reentrancy} from "../lib/Reentrancy.sol";

/// @title Clone
/// @notice Sample Clone contract that uses EIP1167 factory pattern
contract Clone is Reentrancy {
    /// @notice Factory that deploys clones (set only once)
    address public immutable factory;

    /// @notice Wrapped ether address (example variable to show how initialize works)
    address internal wethAddress;

    /// @notice Another state variable
    uint256 public uintOne;

    /// @notice Another state variable
    uint256 public uintTwo;

    /// @notice Used when initially deployed the implementation
    /// @param factory_ EIP1167Factory address
    constructor(address factory_) {
        factory = factory_;
    }

    /// @notice Initializes the clone
    /// @param _wethAddress Wrapped ether address
    /// @param _uintOne Storage variable param (as an example to generate salt)
    /// @param _uintTwo Storage variable param (as an example to generate salt)
    function initialize(address _wethAddress, uint256 _uintOne, uint256 _uintTwo) external returns (address) {
        // only factory can call this
        require(msg.sender == factory, "unauthorized caller");

        wethAddress = _wethAddress;
        uintOne = _uintOne;
        uintTwo = _uintTwo;
        return address(this);
    }
}
