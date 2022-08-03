# The Lazy Gator 🐊 (Polkadot Blockchain Academy)

The Lazy Gator is a pallet Limited Delegated Proof of Stake pallet forked from Kilt, but it also allows users to be a "Lazy Gator" and follow other delegators actions in a passive way. ("LLDPoS" if you like). Customised by Ramsey(Decentration).


This repo customises a Kilt Node, specifically their parachain-staking Limited Delegated Proof-of-Stake (LDPoS) `pallets/parachain-staking` pallet to have the added feature of a user being able to follow a delegator of their, choice so that the selected delegator can select the candidate on their behalf. 

You can see the explanation of my approach to delivering a "production ready" product in the [`pallets/parachain-staking`](./pallets/parachain-staking/README.md) pallet README.

_Forked from [Kilt](https://github.com/KILTprotocol/kilt-node/)_

## Lazy Gator is running on a live relay testnet!

Currently Lazy Gator is a parathread/parachain on [Pop-Art](https://apps.decentration.org/?rpc=wss%3A%2F%2Fpopart1.jelliedowl.com#/parachains) with parachain-id 2010, check it out! :) 


## Quick Start

### Compile a parachain

`git checkout lazy-gator-v0.1.0`

`cargo build --release`

You can follow the guidelines from [Substrate](https://docs.substrate.io/tutorials/connect-other-chains/local-relay/) to launch a local network, or...

### Launch a node 

`./build-spec-journey/4-launch-collator.sh`


