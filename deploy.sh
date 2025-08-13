#!/bin/bash
source .env
forge script script/Paylancer.s.sol:PaylancerScript --rpc-url morph_holesky --private-key $PRIVATE_KEY --broadcast