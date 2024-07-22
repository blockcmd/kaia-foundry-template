# Using OpenZeppelin library

## Introduction
A library for secure smart contract development. Build on a solid foundation of community-vetted code.
- Implementations of standards like ERC20 and ERC721.
- Flexible role-based permissioning scheme.
- Reusable Solidity components to build custom contracts and complex decentralized systems.

## Use of interactive wizard
- [OpenZeppelin wizard](https://wizard.openzeppelin.com/?utm_campaign=Blog&utm_source=Blog%20-%20Wizard)
- [Kaiachain wizard](https://wizard.kaia.io/)
- Interactive widget to create popular standards like ERC20, ERC721, KIP7, KIP17, etc.

## Installation
### OpenZeppelin contracts
Use this command to install OpenZeppelin contracts
```bash
forge install OpenZeppelin/openzeppelin-contracts
```

Then add the following line to your `remappings.txt` file:
```
@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/
```

### Kaiachain contracts
Use this command to install Kaiachain contracts
```bash
forge install kaiachain/kaia-contracts
```

Then add the following line to your `remappings.txt` file:
```
kaia-contracts/=lib/kaia-contracts/
```
> [!WARNING]  
> KIP tokens have slightly different behaviours from ERC tokens. Please review the imported contracts.

### Troubleshooting
Very often your import paths will have issues. You can try using this command to troubleshoot.
```bash
forge remappings > remappings.txt
```

After running the command, check all your files, make changes in the `remappings.txt` or in your `.sol` files if necessary. 

If everything fails, just use absolute path, which is refering directly from `lib/path/to/file`
