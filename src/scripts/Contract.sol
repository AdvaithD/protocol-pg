// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console} from "forge-std/console.sol";
import {Vm} from "forge-std/Vm.sol";

import {Encoder} from "../Encoder.sol";

contract Contract {
    address constant HEVM_ADDRESS = address(bytes20(uint160(uint256(keccak256("hevm cheat code")))));
    Vm public constant vm = Vm(HEVM_ADDRESS);

    function run() external {
        Encoder encoder = new Encoder();

        vm.prank(address(this));
        // address editionsCloneAddress = writingEditionsFactory.create(editionData);

        // purchase
        // IWritingEditions(editionsCloneAddress).purchase{value: 0.01 ether}(address(this), "love");
        bytes memory encodedMessage = Encoder.encode(100, 200, 300);

        console.logString();
    }

    receive() external payable {}
}
