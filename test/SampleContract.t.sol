// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {Encoder} from "../src/Encoder.sol";

contract EncoderTest is Test {
    Encoder encoderContract;

    function setUp() public {
        encoderContract = new Encoder();
    }

    function testEncoder() external {
        bytes memory encodedMessage = encoderContract.encode(100, 200, 300);

        console.logBytes(encodedMessage);
    }
}
