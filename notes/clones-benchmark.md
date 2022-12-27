### Clones Benchmark

Worked on setting up a simple Clone contract that is used by the EIP1167 factory, which uses openzeppelin's clones library. This was compared with 
[clones with immutable arguments](https://github.com/wighawag/clones-with-immutable-args) which reduces gas drastically. Note the difference in the clone used by the immutable args factory [here](../src/patterns/immutable-args/CloneWithImmutableArgs.sol)


The one disadvantage here is that etherscan still doesn't display a read/write UI for clones with immutable args. I hope this changes soon.

Gas savings turn out to be about ~31%.


#### Results

```
| src/patterns/EIP1167Factory.sol:EIP1167Factory contract |                 |       |        |       |         |
|---------------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                         | Deployment Size |       |        |       |         |
| 362135                                                  | 1928            |       |        |       |         |
| Function Name                                           | min             | avg   | median | max   | # calls |
| createClone                                             | 93084           | 93084 | 93084  | 93084 | 1       |


| src/patterns/immutable-args/ImmutableArgsCloneFactory.sol:ImmutableArgsCloneFactory contract |                 |       |        |       |         |
|----------------------------------------------------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                                                              | Deployment Size |       |        |       |         |
| 242379                                                                                       | 1090            |       |        |       |         |
| Function Name                                                                                | min             | avg   | median | max   | # calls |
| createClone                                                                                  | 63750           | 63750 | 63750  | 63750 | 1       |
```
