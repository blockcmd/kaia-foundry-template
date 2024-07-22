# Deployments

## Introduction to solidity scripting
Quoted from the [Foundry book](https://book.getfoundry.sh/tutorials/solidity-scripting)

> Solidity scripting is a way to declaratively deploy contracts using Solidity, instead of using the more limiting and less user friendly forge create.
> 
> Solidity scripts are like the scripts you write when working with tools like Hardhat; what makes Solidity scripting different is that they are written in Solidity instead of JavaScript, and they are run on the fast Foundry EVM backend, which provides dry-run capabilities.

## Usage of solidity scripting
To make deployment easy on mainnet, testnet and anvil (local), you can leverage Solidity scripting in Foundry to inject variables based on the environment for deployment.

This template includes `Deploy.s.sol` and `DeployHelper.s.sol` for your review. The `DeployHelper.s.sol` file contains the constructor configuration for Orakl Network VRF and price feed proxy on Kaia Mainnet, Kairos testnet and mock for Anvil (local).

When you run `make deploy-kairos` or `make deploy-kaia`, Foundry will execute the script `Deploy.s.sol` which takes in the correct configuration parameters from `DeployHelper.s.sol` and pass into the constructor arguments. This reduces human error during deployment process, especially if your contracts have to interact with external contracts with different addresses for mainnet and testnet.

## CREATE3 deployment
### About CREATE3

Quoted from [Zefram's CREATE3 repo](https://github.com/ZeframLou/create3-factory):  
> Deploying a contract to multiple chains with the same address is annoying. One usually would create a new Ethereum account, seed it with enough tokens to pay for gas on every chain, and then deploy the contract naively. This relies on the fact that the new account's nonce is synced on all the chains, therefore resulting in the same contract address. However, deployment is often a complex process that involves several transactions (e.g. for initialization), which means it's easy for nonces to fall out of sync and make it forever impossible to deploy the contract at the desired address.
>
> One could use a `CREATE2` factory that deterministically deploys contracts to an address that's unrelated to the deployer's nonce, but the address is still related to the hash of the contract's creation code. This means if you wanted to use different constructor parameters on different chains, the deployed contracts will have different addresses.
>
> A `CREATE3` factory offers the best solution: the address of the deployed contract is determined by only the deployer address and the salt. This makes it far easier to deploy contracts to multiple chains at the same addresses.

CREATE3Factory address: `0x6aA3D87e99286946161dCA02B97C5806fC5eD46F`
- [Mainnet](https://klaytnfinder.io/account/0x6aA3D87e99286946161dCA02B97C5806fC5eD46F)
- [Kairos testnet](https://baobab.klaytnfinder.io/account/0x6aA3D87e99286946161dCA02B97C5806fC5eD46F)

### Usage

We have included 2 files `CREATE3Deploy.s.sol` and `CREATE3Guess.s.sol` for you to understand how to interact with the `CREATE3Factory`.

Additionally, in the `makefile`, you can run the following 3 commands to test deploying the `Counter.sol` contract.
1. First, change the `DEPLOYER` address in `CREATE3Guess.s.sol` to your address then run `make create3-address` to predict the deployment address.
2. Second, run `make create3-deploy-kairos` to deploy on testnet Kairos.
3. Third, run `make create3-deploy-kaia` to deploy on mainnet Kaia.

Below are the logs:

Logs of running `make create3-address`
```bash
Traces:
  [7610] CREATE3Guess::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← [Return]
    ├─ [1026] 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F::getDeployed(0x6FaFF29226219756aa40CE648dbc65FB41DE5F72, 0x636f756e74657200000000000000000000000000000000000000000000000000) [staticcall]
    │   └─ ← [Return] 0x83877DB58294552a5ddFE5E957f89a329f0b6938
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return]
    └─ ← [Return] 0x83877DB58294552a5ddFE5E957f89a329f0b6938

Script ran successfully.

== Return ==
predictedDeploymentAddress: address 0x83877DB58294552a5ddFE5E957f89a329f0b6938
```

Logs of running `make create3-deploy-kaia`

```bash
Traces:
  [126324] CREATE3Deploy::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← [Return]
    ├─ [118684] 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F::deploy(0x636f756e74657200000000000000000000000000000000000000000000000000, 0x6080604052348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   ├─ [1617] → new <unknown>@0x658f787aba03A5d64D5c115E6032B6e0A310d9F6
    │   │   └─ ← [Return] 8 bytes of code
    │   ├─ [82384] 0x658f787aba03A5d64D5c115E6032B6e0A310d9F6::60806040(52348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   │   ├─ [50297] → new Counter@0x83877DB58294552a5ddFE5E957f89a329f0b6938
    │   │   │   └─ ← [Return] 251 bytes of code
    │   │   └─ ← [Stop]
    │   └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return]
    └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]


Script ran successfully.

== Return ==
counterAddress: address 0x83877DB58294552a5ddFE5E957f89a329f0b6938

## Setting up 1 EVM.
==========================
Simulated On-chain Traces:

  [118684] 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F::deploy(0x636f756e74657200000000000000000000000000000000000000000000000000, 0x6080604052348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    ├─ [1617] → new <unknown>@0x658f787aba03A5d64D5c115E6032B6e0A310d9F6
    │   └─ ← [Return] 8 bytes of code
    ├─ [82384] 0x658f787aba03A5d64D5c115E6032B6e0A310d9F6::60806040(52348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   ├─ [50297] → new Counter@0x83877DB58294552a5ddFE5E957f89a329f0b6938
    │   │   └─ ← [Return] 251 bytes of code
    │   └─ ← [Stop]
    └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]


==========================

Chain 1001

Estimated gas price: 50.000000001 gwei

Estimated total gas used for script: 307470

Estimated amount required: 0.01537350000030747 ETH

==========================

##### 1001
✅  [Success]Hash: 0x7def4bce59eae116493b48027fa322ff7b4c427cebcb813f77cf97491963ddf7
Block: 160040972
Paid: 0.004462100000178484 ETH (178484 gas * 25.000000001 gwei)

✅ Sequence #1 on 1001 | Total Paid: 0.004462100000178484 ETH (178484 gas * avg 25.000000001 gwei)
```

Logs of running `make create3-deploy-kaia`

```bash
Traces:
  [126324] CREATE3Deploy::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← [Return]
    ├─ [118684] 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F::deploy(0x636f756e74657200000000000000000000000000000000000000000000000000, 0x6080604052348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   ├─ [1617] → new <unknown>@0x658f787aba03A5d64D5c115E6032B6e0A310d9F6
    │   │   └─ ← [Return] 8 bytes of code
    │   ├─ [82384] 0x658f787aba03A5d64D5c115E6032B6e0A310d9F6::60806040(52348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   │   ├─ [50297] → new Counter@0x83877DB58294552a5ddFE5E957f89a329f0b6938
    │   │   │   └─ ← [Return] 251 bytes of code
    │   │   └─ ← [Stop]
    │   └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return]
    └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]


Script ran successfully.

== Return ==
counterAddress: address 0x83877DB58294552a5ddFE5E957f89a329f0b6938

## Setting up 1 EVM.
==========================
Simulated On-chain Traces:

  [118684] 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F::deploy(0x636f756e74657200000000000000000000000000000000000000000000000000, 0x6080604052348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    ├─ [1617] → new <unknown>@0x658f787aba03A5d64D5c115E6032B6e0A310d9F6
    │   └─ ← [Return] 8 bytes of code
    ├─ [82384] 0x658f787aba03A5d64D5c115E6032B6e0A310d9F6::60806040(52348015600e575f80fd5b5060fb8061001b5f395ff3fe6080604052348015600e575f80fd5b50600436106044575f3560e01c80632baeceb71460485780633fb5c1cb1460505780638381f58a14605f578063d09de08a146078575b5f80fd5b604e607e565b005b604e605b366004609d565b5f55565b60665f5481565b60405190815260200160405180910390f35b604e6091565b5f80549080608a8360c7565b9190505550565b5f80549080608a8360d9565b5f6020828403121560ac575f80fd5b5035919050565b634e487b7160e01b5f52601160045260245ffd5b5f8160d25760d260b3565b505f190190565b5f6001820160e75760e760b3565b506001019056fea164736f6c6343000819000a)
    │   ├─ [50297] → new Counter@0x83877DB58294552a5ddFE5E957f89a329f0b6938
    │   │   └─ ← [Return] 251 bytes of code
    │   └─ ← [Stop]
    └─ ← [Return] Counter: [0x83877DB58294552a5ddFE5E957f89a329f0b6938]


==========================

Chain 8217

Estimated gas price: 75 gwei

Estimated total gas used for script: 307470

Estimated amount required: 0.02306025 ETH

==========================

##### 8217
✅  [Success]Hash: 0xe3210693a8e834f56508d59a43f03923dc25c846e7af790373bcc0104410d4d9
Block: 159630522
Paid: 0.0044621 ETH (178484 gas * 25 gwei)

✅ Sequence #1 on 8217 | Total Paid: 0.0044621 ETH (178484 gas * avg 25 gwei)
```


You can check the deployed Counter contract which has the same address on both Kaia mainnet and testnet.

`0x83877DB58294552a5ddFE5E957f89a329f0b6938`
- [Mainnet](https://klaytnfinder.io/account/0x83877DB58294552a5ddFE5E957f89a329f0b6938)
- [Kairos testnet](https://baobab.klaytnfinder.io/account/0x83877DB58294552a5ddFE5E957f89a329f0b6938)