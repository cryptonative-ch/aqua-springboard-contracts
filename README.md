# Aqua Springboard Contracts

High-level contract to interact with the [Aqua Contracts](https://github.com/cryptonative-ch/mesa-smartcontracts)

# Architecture

The Springboard contract integrates the `AquaFactory`, `SaleLauncher` and `TemplateLauncher` to create new sales using multicalls. This usually involves no more than two calls.

## Methods (WIP)

# Deployment

Start with deploying the contract on desired network.

## Initialize the Contract

The contract is stateless initially. For it to work, it has to be initliazed. To initialize it, call
