# Pyth integration

## Installation

you will need to create an NPM project if you don't already have one. From the root directory of your project, run:

```bash
npm init -y
npm install @pythnetwork/pyth-sdk-solidity
```

Then add the following line to your `remappings.txt` file:
```
@pythnetwork/pyth-sdk-solidity/=node_modules/@pythnetwork/pyth-sdk-solidity
```