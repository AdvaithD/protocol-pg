# Protocol Playground• [![CI](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml/badge.svg)](https://github.com/transmissions11/foundry-template/actions/workflows/tests.yml)

Playground exploring solidity patterns, gas optimizations and compilations of notes.

Doing this for fun, but also to build a personal resource, and share it with others.

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

### Notes

1. [State Variable Notes](./notes/state-variable.md)
