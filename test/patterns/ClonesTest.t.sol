// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {console2} from "forge-std/console2.sol";
import "../../src/patterns/immutable-args/CloneWithImmutableArgs.sol";
import "../TestEnvironment.sol";

contract ClonesTest is TestEnvironment {
    function setUp() public {}

    function testEIP1167Deploy() external {
        address clone = cloneFactory.createClone(address(0), 1, 2);

        console2.log("clone: %s", clone);
    }

    function testGas_cloneWithImmutableArgs() external {
        Clone clone = immutableArgsCloneFactory.createClone(address(1), 1, 2);
    }
}
