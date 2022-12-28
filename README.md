# Protocol Playground• [![CI](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml/badge.svg)](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml)

Playground exploring solidity patterns, gas optimizations and compilations of notes.

Doing this for fun, but also to build a personal resource, and share it with others.

### Notes

1. [State Variable Notes](./notes/state-variable.md)
2. [Gas benchmark of EIP1167 Clones vs. Clones with immutable Args](./notes/clones-benchmark.md)
3. [Basic Gas Optimizations](./notes/basic-gas-optimizations.md)
4. [CREATE3 Factory (WIP)](./notes/CREATE3.md)

### Contracts
1. [EIP1167 Clones](./src/patterns/EIP1167Factory.sol)
2. [Clones with Immutable Args](./src/patterns/immutable-args/)
3. [ERC721 Merkle Drop](./src/erc721-merkle-drop/ERC721MerkleDrop.sol)
4. [Minimal Multisig with EIP712](./src/minimal-multisig/MinimalMultisig.sol)
5. [Utility Contract for Type Conversions (for solidity tests etc)](./src/utils/TypeConverts.sol)
6. [Generic User - Use in tests to execute virtually any operation as a user](./src/utils/GenericUser.sol)
7. [Create3 Factory](./src/patterns/create3/Create3Factory.sol)

## Contributing

You will need a copy of [Foundry](https://github.com/foundry-rs/foundry) installed before proceeding. See the [installation guide](https://github.com/foundry-rs/foundry#installation) for details.

### Setup

```sh
git clone https://github.com/transmissions11/foundry-template.git
cd foundry-template
forge install
```

### Run Tests

```sh
forge test

# Run a specific test
forge test --match-contract "ContractName"
```

### Update Gas Snapshots

```sh
forge snapshot
```

### REPL
Run `make repl`

Example:
```
➜ uint256 a = 200;
➜ a
Type: uint
├ Hex: 0xc8
└ Decimal: 20

➜ abi.encode(100,100,100)
Type: dynamic bytes
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000060
├─ Contents ([0x20:..]): 0x000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000640000000000000000000000000000000000000000000000000000000000000064
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000060
└─ Contents ([0x40:..]): 0x000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000640000000000000000000000000000000000000000000000000000000000000064
```

