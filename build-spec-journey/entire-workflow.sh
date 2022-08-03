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

#VARIABLES
export CHAIN_TYPE=parachain
export RELAY_CHAIN_SPEC="../specs/pop-art-3-val.json"
export CHAIN_NAME="parachain-collator"
export PROTOCOL_ID=soupcan
export SPEC_NAME="kabocha-soupcan-dev-plain-new.json"
export PARA_ID=2007
export RAWSPEC_NAME='kabocha-'"$PARA_ID"'.json'
export PORT=30333
export WS_PORT=9944
export RPC_PORT=9933
export RELAY_PORT=40333
export RELAY_WS_PORT=8844
export USERNAME=decentration
export GENESIS_HEAD='../genesiswasm/'"$PROTOCOL_ID"'-'"$PARA_ID"'-genesis'
export GENESIS_WASM='../genesiswasm/'"$PROTOCOL_ID"'-'"$PARA_ID"'-wasm'
export BASE_PATH="/home/$USERNAME/$CHAIN_TYPE"

#ENV FILE
#AURA_KEY



#If $CHAINTYPE = parachain then;


#STEP 0  - build chain spec

../target/release/$CHAIN_NAME build-spec --chain dev > ../specs/$SPEC_NAME

echo "$SPEC_NAME created"


#STEP1   - raw chain spec
../target/release/$CHAIN_NAME build-spec --chain ../specs/$SPEC_NAME --raw > ../specs/$RAWSPEC_NAME

echo "$RAWSPEC_NAME created"

#STEP2   - Create genesis head
../target/release/$CHAIN_NAME export-genesis-state  --chain ../specs/$RAWSPEC_NAME > $GENESIS_HEAD

echo "$GENESIS_HEAD created"

#STEP3    - Create genesis wasm
../target/release/$CHAIN_NAME export-genesis-wasm  --chain ../specs/$RAWSPEC_NAME > $GENESIS_WASM

echo "$GENESIS_WASM created"
# Launch collator node as a systemd
#STEP 4
../target/release/$CHAIN_NAME --collator --force-authoring --chain ../specs/$RAWSPEC_NAME --base-path $BASE_PATH  --port $PORT --ws-port $WS_PORT --rpc-port $RPC_PORT --rpc-methods=Unsafe -- --execution wasm --chain ../specs/$RELAY_CHAIN_SPEC --port $RELAY_PORT --ws-port $RELAY_WS_PORT

echo "collator launched"
# Submit aura key (curl RPC call) check AURA in an ENV file


#


# Submit parasudoinitialize