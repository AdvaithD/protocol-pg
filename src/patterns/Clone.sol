// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.15;

import {Reentrancy} from "../lib/Reentrancy.sol";

/// @title Clone
/// @notice Sample Clone contract that uses EIP1167 factory pattern
contract Clone is Reentrancy {
    /// @notice Wrapped ether address (example variable to show how initialize works)
    address internal wethAddress;

    /// @notice Factory that deploys clones (set only once)
    address public immutable factory;

    /// @notice Used when initially deployed the implementation
    /// @param factory_ EIP1167Factory address
    constructor(address factory_) {
        factory = factory_;
    }

    /// @notice Initializes the clone
    /// @param _wethAddress Wrapped ether address
    function initialize(address _wethAddress) external returns (address) {
        // only factory can call this
        require(msg.sender == factory, "unauthorized caller");

        wethAddress = _wethAddress;
        return address(this);
    }
}
