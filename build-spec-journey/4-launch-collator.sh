#!/bin/bash

# Create raw file
# Example of workflow 
# ./target/release/parachain-collator build-spec --chain ./specs/kabocha-local-plain2.json --raw > ./specs/kabocha-soupcan-raw.json

# Create genesis head
# ./target/release/parachain-collator export-genesis-state  --chain ./specs/kabocha-soupcan-raw.json > ./genesiswasm/soupcan-2001-genesis

# Create genesis wasm
# ./target/release/parachain-collator export-genesis-wasm   --chain ./specs/kabocha-soupcan-raw.json > ./genesiswasm/soupcan-2001-wasm


# Submit parasudoinitialize

#PSEUDOCODE (IN DEVELOPMENT)

source "./config.sh"

#STEP 4
../target/release/$CHAIN_NAME --collator --force-authoring --chain ../specs/$RAWSPEC_NAME --base-path $BASE_PATH  --port $PORT --ws-port $WS_PORT --rpc-port $RPC_PORT --rpc-methods=Unsafe -- --execution wasm --chain ../specs/$RELAY_CHAIN_SPEC --port $RELAY_PORT --ws-port $RELAY_WS_PORT

echo "collator launched"
# Submit aura key (curl RPC call) check AURA in an ENV file


