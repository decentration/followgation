# Followgator Pallet (Polkadot Blockchain Academy)

This pallet enables users to follow delegators who stake their funds with collators. The followers can select how much they wish to stake, but the delegator that they follow selects the candidate. 

The pallet leverages Kilt's parachain-staking [pallet](https://github.com/KILTprotocol/kilt-node/tree/develop/pallets/parachain-staking), but with the added `follow` features.


## My Approach 
The key factor in this assignment is that we have only a few days to deliver something that is "as close to production ready as possible" and display a strong level of competence about Substrate and Rust. 

The idea is to add a "follow a delegator" feature. There are various ways I can approach this. One of them is by adding extra parameters to the current Storage Map for DelegatorState. But then i will have to update the code in various places to implement it. So I will be creating a new StorageMap called FollowerState, which keeps track of the 

I can make use of the current code by refactoring it. For example i can take the logic from the pub fn join_delegator() and move into a private function so that it can be used elsewhere. 

Secondly, I will create a StorageMap which stores a Vec of followers, so that there can be a public function to follow and unfollow from the delegator; and importantly, if the delegator unstakes from a collator then the followers will also be unstaked. 

## The Assignment 
This assignment completes this section:

_Basic Direct Delegation Proof of Stake system:_
- _A pallet which manages the DPoS System_
  - _Where one set of users can register to be a validator by providing a session key for Aura / BABE._
  - _Where any user can use their tokens to delegate (vote) for the set of validators._
  - _Where every N blocks, the current “winners” are selected, and Aura / BABE is updated._
  - **_As a bonus, try to support delegation chains, where you can back a delegator who themselves pick the validator._**

_"In all projects, you are free to use everything that you have learned from Substrate, including existing pallets. Feel free to use a pallet as-is, or tweak it slightly to fit your needs."_

_"To the contrary, when needed, make a Trait that is supposed to deliver some functionality, and do a mock implementation of it, to abstract away components that you want to interact with and are not readily available in FRAME."_


