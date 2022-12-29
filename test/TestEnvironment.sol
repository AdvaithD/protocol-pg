// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.15;

import "forge-std/Test.sol";

import {EIP1167Factory} from "../src/patterns/EIP1167Factory.sol";
import {ImmutableArgsCloneFactory} from "../src/patterns/immutable-args/ImmutableArgsCloneFactory.sol";
import {ImmutableArgsCloneFactory} from "../src/patterns/immutable-args/ImmutableArgsCloneFactory.sol";
import {Create3Factory} from "../src/patterns/create3/Create3Factory.sol";
import {Registry} from "../src/registry/Registry.sol";

contract TestEnvironment is Test {
    /// @notice EIP1167 factory
    EIP1167Factory public cloneFactory;

    /// @notice Clones w/ immutable args factory
    ImmutableArgsCloneFactory public immutableArgsCloneFactory;

    /// @notice Create3Factory
    Create3Factory public create3Factory;

    /// @notice vanilla registry
    Registry public registry;

    uint256 public constant privateKey = 11111111111;

    /// @notice deployer nonce (test setup deplyoer)
    uint256 public nonce;

    /// @notice stand in owner for all contracts (address(this.))
    address public owner;

    constructor() {
        owner = vm.addr(privateKey);

        cloneFactory = new EIP1167Factory();

        immutableArgsCloneFactory = new ImmutableArgsCloneFactory();

        create3Factory = new Create3Factory(address(this));

        registry = new Registry(owner);
    }
}
