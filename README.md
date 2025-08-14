## Paylancer Smart Contract (Morph Holesky)

- **Contract Address:** `0x75a0d486ce7730fA3752f91D3101997ABc942297`
- **Chain:** Morph Holesky
- **Chain ID:** 2810
- **Block Explorer:** [explorer-holesky.morphl2.io](https://explorer-holesky.morphl2.io/address/0x75a0d486ce7730fA3752f91D3101997ABc942297)
- **ABI:** See `src/integrations/morph/PaylancerABI.json` in main repo

### Quick Usage (ethers.js)
```js
import { ethers } from 'ethers';
const provider = new ethers.JsonRpcProvider('https://rpc-quicknode-holesky.morphl2.io');
const abi = require('src/integrations/morph/PaylancerABI.json');
const contract = new ethers.Contract('0x75a0d486ce7730fA3752f91D3101997ABc942297', abi, provider);
```

---

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```bash
export RPC_URL="https://rpc-quicknode-holesky.morphl2.io"
export PRIVATE_KEY="your_private_key"
forge script script/Paylancer.s.sol:PaylancerScript --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
