// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "solmate/auth/Owned.sol";

/// @notice Registry - Allows an admin to attest data on-chain
contract Registry is Owned {
    struct RegistryItem {
        address admin;
        string contractType;
        uint256 chainId;
    }

    mapping(address => RegistryItem) registry;

    constructor(address _owner) Owned(_owner) {}

    /// @notice add an item to the registy
    /// @dev Can only be called by the registry owner
    function addToRegistry(RegistryItem memory item) public onlyOwner {
        registry[item.admin] = item;
    }
}
