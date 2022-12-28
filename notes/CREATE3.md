## Create3

Using the `CREATE3` lib from solmate to create a factory contract.

```
| src/patterns/Clone.sol:Clone contract |                 |       |        |       |         |
|---------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                       | Deployment Size |       |        |       |         |
| 110396                                | 726             |       |        |       |         |
| Function Name                         | min             | avg   | median | max   | # calls |
| initialize                            | 46818           | 46818 | 46818  | 46818 | 1       |


| src/patterns/EIP1167Factory.sol:EIP1167Factory contract |                 |       |        |       |         |
|---------------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                         | Deployment Size |       |        |       |         |
| 362135                                                  | 1928            |       |        |       |         |
| Function Name                                           | min             | avg   | median | max   | # calls |
| createClone                                             | 93084           | 93084 | 93084  | 93084 | 1       |


| src/patterns/create3/Create3Factory.sol:Create3Factory contract |                 |        |        |        |         |
|-----------------------------------------------------------------|-----------------|--------|--------|--------|---------|
| Deployment Cost                                                 | Deployment Size |        |        |        |         |
| 414095                                                          | 2170            |        |        |        |         |
| Function Name                                                   | min             | avg    | median | max    | # calls |
| deploy                                                          | 836067          | 836067 | 836067 | 836067 | 1       |


| src/patterns/immutable-args/ImmutableArgsCloneFactory.sol:ImmutableArgsCloneFactory contract |                 |       |        |       |         |
|----------------------------------------------------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                                                              | Deployment Size |       |        |       |         |
| 242379                                                                                       | 1090            |       |        |       |         |
| Function Name                                                                                | min             | avg   | median | max   | # calls |
| createClone                                                                                  | 63750           | 63750 | 63750  | 63750 | 1       |
```
