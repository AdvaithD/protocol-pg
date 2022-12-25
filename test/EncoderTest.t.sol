// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";

import {Encoder} from "../src/Encoder.sol";

contract EncoderTest is Test {
    Encoder encoderContract;

    function setUp() public {
        encoderContract = new Encoder();
    }

    function testEncoder() external {
        bytes memory encodedMessagePacked = encoderContract.encodePacked(100, 200, false);
        console2.logBytes(encodedMessagePacked);
        // 0x000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000c800

        bytes memory encodedMessage = encoderContract.encode(100, 200, false);
        console2.logBytes(encodedMessage);
        // 0x000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000c80000000000000000000000000000000000000000000000000000000000000000
    }
}
