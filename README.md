# Protocol Playground• [![CI](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml/badge.svg)](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml)

Playground exploring solidity patterns, gas optimizations and compilations of notes.

Doing this for fun, but also to build a personal resource, and share it with others.

### Notes

1. [State Variable Notes](./notes/state-variable.md)
2. [Gas benchmark of EIP1167 Clones vs. Clones with immutable Args](./notes/clones-benchmark.md)

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

