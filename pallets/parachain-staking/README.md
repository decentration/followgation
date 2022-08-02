# Lazy Gator Pallet 🐊 (Polkadot Blockchain Academy)

This pallet enables users to follow delegators who stake their funds with collators. The followers can select how much they wish to stake, but the delegator that they follow selects the candidate (collator) for them. 

The pallet customises Kilt's parachain-staking [pallet](https://github.com/decentration/followgator/tree/followgation/pallets/parachain-staking), but with the added `follow` features.

Also can be found at `pallets/parachain-staking`.


## My Approach 
The key factor in this assignment is that we have only a few days to deliver something that is "as close to production ready as possible" and display a strong level of competence about Substrate and Rust. 

The idea is to add a "follow a delegator" feature, for the lazy folk, on top of Limited Delegated Proof of Stake, which I am interested to implement for Kabocha parachain. 

The public methods I have added are:

`pub fn follow()`

`pub fn unfollow()`



## The Assignment 

What stood out for me was `"As close to production ready as possible"`

This assignment completes this section:

_Basic Direct Delegation Proof of Stake system:_
- _A pallet which manages the DPoS System_
  - _Where one set of users can register to be a validator by providing a session key for Aura / BABE._
  - _Where any user can use their tokens to delegate (vote) for the set of validators._
  - _Where every N blocks, the current “winners” are selected, and Aura / BABE is updated._
  - **_As a bonus, try to support delegation chains, where you can back a delegator who themselves pick the validator._**

_"In all projects, you are free to use everything that you have learned from Substrate, including existing pallets. Feel free to use a pallet as-is, or tweak it slightly to fit your needs."_

_"To the contrary, when needed, make a Trait that is supposed to deliver some functionality, and do a mock implementation of it, to abstract away components that you want to interact with and are not readily available in FRAME."_


## Tests

```console
Running unittests src/lib.rs (target/debug/deps/parachain_staking-11563803aa3aa85d)

running 6 tests
test tests::follow ... ok
test tests::follow_with_delegation ... ok
test tests::follow_with_undelegation ... ok
test tests::not_following ... ok
test tests::already_following ... ok
test tests::unfollow ... ok

test result: ok. 6 passed; 0 failed; 0 ignored; 0 measured; 63 filtered out; finished in 0.02s
```

## Improvements

Given that this is a minimal viable product, there are many ways this can improve:

- Benchmarking 
- Benchmarking, and unbounded Followers of storage could be a risk, could add a limit. 
- More rigorous testing for edge cases. 


