# Lazy Gator Pallet 🐊 (Polkadot Blockchain Academy)

**Use at your own risk** and customise at will!

This pallet enables users to follow delegators who stake their funds with collators. The followers can select how much they wish to stake, but the delegator that they follow selects the candidate (collator) for them. Please be aware this is a first version, and there are a lot of improvements that can be made to the following concept. 

The pallet customises Kilt's parachain-staking [pallet](https://github.com/decentration/followgator/tree/followgation/pallets/parachain-staking), but with the added `follow` features.


## My Approach 
The key factor in this assignment is that we have only a few days to deliver something that is "as close to production ready as possible" and display as much competence as we can about Substrate and Rust. 

The idea is to add a "follow a delegator" feature (for the lazy folk) on top of Kilt's Limited Delegated Proof of Stake, which I am interested to implement for Kabocha parachain.

## Navigation for TA

### Events

```rust
    // The follower is no longer following the delegator
		// \[follower, delegator unfollowed\]
		Unfollowed(T::AccountId, T::AccountId),
		// The follower is added to the list 
		// \[follower, delegator, amount to stake \]
		Followed(T::AccountId, T::AccountId, BalanceOf<T>)
```

### Errors

```rust
    // Already following the delegator 
		AlreadyFollowing,
		// You can't unfollow() because you arent following the delegator.
		NotFollowing,
```

### Storage 
```Rust
	#[pallet::unbounded] // unbounded because there is no bound to our Vec and we arent bounding the vec. 
	#[pallet::getter(fn followers)]
	pub(crate) type Followers<T: Config> = StorageMap<
		_,
		Twox64Concat,
		T::AccountId,	
		Vec<(T::AccountId, BalanceOf<T>)>,
		ValueQuery, // Return the default value if there is nothing. This value will be an empty vector
	>;
```

### Public methods:

**Follow**
 
Users can make an extrinsic call to choose a delegator.
The follower's stake is distributed proportionally across the collator candidates that the delegator has chosen or will choose. 

Emits `Followed`
  
```Rust
pub fn follow(
			origin: OriginFor<T>,
			delegator: T::AccountId,
			amount: BalanceOf<T>,
		) -> DispatchResultWithPostInfo;
```

**Unfollow**
 


Emits `Unfollowed`
```Rust
// Users can make an extrinsic call to choose to unfollow delegator.
// That means the users is no longer changed the by their selected delegators decisions. 
pub fn unfollow(
			origin: OriginFor<T>,
			delegator: T::AccountId,
			amount: BalanceOf<T>
		) -> DispatchResult {...}
```

### Private Functions

```Rust
// Logic moved from public function of join_delegators
		fn internal_join_delegators(acc: T::AccountId, collator: T::AccountId, amount: BalanceOf<T>) -> DispatchResultWithPostInfo {...}

```

```Rust
// internal_leave_delegators taken from the public function and made as a private function to be accessible. 
		fn internal_revoke_delegation(delegator: T::AccountId, collator: T::AccountId) -> DispatchResultWithPostInfo { 
```

### Code Refactoring 

Refactored `pub fn join_delegators(...)`, `pub fn revoke_delegation(...)` and `pub fn leave_delegators(...)` moving the core logic into private functions so it can be called elsewhere. 


### Tests

```rust
#[test]
// follow a delegator 
fn follow()...
```

```rust
#[test]
// unfollow a delegator 
fn unfollow()...
```

```rust
#[test]
//follow with a delegator already delegating 
fn follow_with_delegation()...
```

```rust
#[test]
// check that not following is working when it should
fn not_following()... 
```

```rust
#[test]
//follow with a delegator already delegating 
fn follow_with_delegation()
```

```rust
#[test]
//follow with a delegator already delegating 
fn follow_with_undelegation()
```


## Test Results

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

- In this current version, we are `follow`ing in a very simple way, we could definitely enable features that follow better, and in a smarter way. The main features is that we are copying the current selection and unstaking when the delegator unstakes. But we can do more! Such as:
  - Logic to handle when the delegator changes their selections, i.e. 
    - staking with more collators; 
    - unstaking from current collators; 
    - increasing stake to current selection; 
    - decreasing stake. 
- Smarter proportional distribution of lazy stake. Currently we just distribute evenly, but we could look at the distribution the delegator we are following is making, and replicate how their distribute it proportionally. 
- Smarter ways to handle multiple multiple layers of follows. 
- If the delegator unstakes, then we also undelegate, but there is no logic to re-delgate that stake. This would be a improvement. 
- If the delegator we are following is already delegating to one or more collators, then all of our stake is distributed to those, then if the delegator adds a new stake, we can handle that in some way. 
- If the user unstakes manually he still follows and delegator and must also unfollow. We can automate this. Having said that this could be a feature, where the delegator does the initial work, and then the lazy follower sculpts away what they don't want. 

More improvements:
- Benchmarking 
- Unbounded `Followers` storage could be a risk, could add a limit. 
-  Alot more testing of edge cases. You can find the tests in [`parachain-staking/src/tests.rs](./src/tests.rs), at the end of the file. 


## The Assignment 

What stood out for me was `"As close to production ready as possible"`, and so I didn't believe I could build a production ready pallet in the short timeframe, so i opted to customise a pallet. Also for context, I have been considering Kilt's Limited Delegated Proof of Stake design for Kabocha parachain, so double-whammy i thought it fits right in to being used for Kabocha, after more testing and consideration.

This assignment completes this section:

_Basic Direct Delegation Proof of Stake system:_
- _A pallet which manages the DPoS System_
  - _Where one set of users can register to be a validator by providing a session key for Aura / BABE._
  - _Where any user can use their tokens to delegate (vote) for the set of validators._
  - _Where every N blocks, the current “winners” are selected, and Aura / BABE is updated._
  - **_As a bonus, try to support delegation chains, where you can back a delegator who themselves pick the validator._**

The bonus section looked, fun so i jumped straight to it!

_"In all projects, you are free to use everything that you have learned from Substrate, including existing pallets. Feel free to use a pallet as-is, or tweak it slightly to fit your needs."_

This was the justification enough for me to use Kilt's pallet. 



