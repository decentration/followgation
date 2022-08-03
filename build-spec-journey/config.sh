#!/bin/bash/env


#VARIABLES
export CHAIN_TYPE=parachain
export RELAY_CHAIN_SPEC="../dev-specs/relay-specs/pop-art-new.json"
export CHAIN_NAME="kilt-parachain"
export PROTOCOL_ID=lazy-gator
export SPEC_NAME="lazy-gator.json"
export RAWSPEC_NAME="lazy-gator-raw.json"

export PARA_ID=2010

export GENESIS_HEAD='../specs/genesiswasm/'"$PROTOCOL_ID"'-'"$PARA_ID"'-genesis'
export GENESIS_WASM='../specs/genesiswasm/'"$PROTOCOL_ID"'-'"$PARA_ID"'-wasm'
export BASE_PATH="/home/$USERNAME/$CHAIN_TYPE"


export PORT=30333
export WS_PORT=9944
export RPC_PORT=9933
export RELAY_PORT=40333
export RELAY_WS_PORT=8844
export USERNAME=decentration