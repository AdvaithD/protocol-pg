### Basic Gas Optimizations


1. Order storage variables such that the least number of storage slots are used: This allows multiple variables to use the same storage slot.

For example, the contract `FourSlots` occupies 4 storage slots (considering each slot is 256 bits / 32 bytes in the evm)

```
contract FourSlots {
    uint256 a;
    uint256 b;
    bool c;
    bool d;
}
```

On the other hand, the contract `ThreeSlots` only occupies 3 slots. `a` and `b` are packed into storage slot `0', whereas `c` and `d` take up slots `1` and `2`.

```
contract FourSlots {
    bool a;
    bool b;
    uint256 c;
    uint256 d;
}
```

A good example of this out in the wild can be found in UniswapV2 [here](https://github.com/wighawag/clones-with-immutable-args). The `.getReserves()` call is used a lot, and all three variables below are storage on one storage slot `8`.

```
uint112 private reserve0;           // uses single storage slot, accessible via getReserves
uint112 private reserve1;           // uses single storage slot, accessible via getReserves
uint32  private blockTimestampLast; // uses single storage slot, accessible via getReserves
```
If you add the size of each variable (112 + 112 + 32), you get 256 bits. Thats the maximum capacity of one storage slot.

