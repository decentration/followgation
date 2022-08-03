# The Lazy Gator (Polkadot Blockchain Academy)

The Lazy Gator is a pallet Limited Delegated Proof of Stake pallet forked from Kilt, but it also allows users to be a "Lazy Gator" and follow other delegators actions in a passive way. ("LLDPoS" if you like). Customised by Ramsey(Decentration).


This repo customises a Kilt Node, specifically their parachain-staking Limited Delegated Proof-of-Stake (LDPoS) `pallets/parachain-staking` pallet to have the added feature of a user being able to follow a delegator of their, choice so that the selected delegator can select the candidate on their behalf. 

You can see the explanation of my approach to delivering a "production ready" product in the [`pallets/parachain-staking`](./pallets/parachain-staking/README.md) pallet README.

_Forked from [Kilt](https://github.com/KILTprotocol/kilt-node/)_

## Quick start to test the perigrine parachain on Pop-Art live test net

First you need to have a local compile of the Pop-Art relay chain

`git clone https://github.com/kabocha-network/relay-chain.git`

`cd relay-chain`

`git checkout v0.9.26-1`

`cargo build --release`





