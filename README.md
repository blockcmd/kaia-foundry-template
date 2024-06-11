# Kaia Foundry Kit
> Quickly bootstrap your development on Kaia

## DevOps
Various utilities to help with your testing and deployment pipelines
### Anvil


### Kaia testnet


### Kaia mainnet


## Useful library


## Useful commands

```
forge script script/DeployFundMe.s.sol --rpc-url $BAOBAB_RPC_URL --account $WALLET_NAME --sender $SENDER_ADDRESS --broadcast --gas-estimate-multiplier 200
```

## Contract verification


## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

### Foundry official documentation

https://book.getfoundry.sh/

### Usage

#### Build

```shell
$ forge build
```

#### Test

```shell
$ forge test
```

#### Format

```shell
$ forge fmt
```

#### Gas Snapshots

```shell
$ forge snapshot
```

#### Anvil

```shell
$ anvil
```

#### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

#### Cast

```shell
$ cast <subcommand>
```

#### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
