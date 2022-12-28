// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {console2} from "forge-std/console2.sol";
import "../../src/patterns/immutable-args/CloneWithImmutableArgs.sol";
import "../TestEnvironment.sol";
import "../mocks/MockERC20.sol";

contract ClonesTest is TestEnvironment {
    function setUp() public {}

    function testEIP1167Deploy() external {
        address clone = cloneFactory.createClone(address(0), 1, 2);

        console2.log("clone: %s", clone);
    }

    function testGas_cloneWithImmutableArgs() external {
        Clone clone = immutableArgsCloneFactory.createClone(address(1), 1, 2);
    }

    function testCreate3DeployCosts() external {
        /// @notice trying to use the clone's creation code. Should switch to ERC20 soon
        bytes32 salt = keccak256(bytes("A salt!"));

        MockERC20 deployed = MockERC20(create3Factory.deploy(salt, abi.encodePacked(type(MockERC20).creationCode)));
    }
}
