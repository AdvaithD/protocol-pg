// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import {TestEnvironment} from "../TestEnvironment.sol";
import {console2} from "forge-std/console2.sol";

contract RegistryTest is TestEnvironment {
    function testRegistry() external {
        address _admin = vm.addr(1600);
        RegistryItem memory item = RegistryItem({admin: _admin, contractType: "test", chainId: 1600});

        vm.startPrank(_admin);
        registry.addToRegistry(item);
        vm.stopPrank();
    }
}
