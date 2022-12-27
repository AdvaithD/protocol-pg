// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.15;

import "forge-std/Test.sol";

import {EIP1167Factory} from "../src/patterns/EIP1167Factory.sol";
import {ImmutableArgsCloneFactory} from "../src/patterns/immutable-args/ImmutableArgsCloneFactory.sol";

contract TestEnvironment is Test {
    /// @notice EIP1167 factory
    EIP1167Factory public cloneFactory;

    /// @notice Clones w/ immutable args factory
    ImmutableArgsCloneFactory public immutableArgsCloneFactory;

    uint256 public constant privateKey = 11111111111;

    /// @notice deployer nonce (test setup deplyoer)
    uint256 public nonce;

    /// @notice stand in owner for all contracts (address(this.))
    address public owner;

    constructor() {
        owner = vm.addr(privateKey);

        cloneFactory = new EIP1167Factory();

        immutableArgsCloneFactory = new ImmutableArgsCloneFactory();
    }
}
