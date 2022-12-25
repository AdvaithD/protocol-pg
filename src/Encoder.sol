pragma solidity ^0.8.15;

import {console} from "forge-std/console.sol";

contract Encoder {
    function encode(uint256 value1, uint256 value2, bool value3) public view returns (bytes memory) {
        // Encode the values using abi.encode
        return abi.encode(value1, value2, value3);
    }

    function encodePacked(uint256 value1, uint256 value2, bool value3) public view returns (bytes memory) {
        // Encode the values using abi.encodePacked
        return abi.encodePacked(value1, value2, value3);
    }
}
