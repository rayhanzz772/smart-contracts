# web3-voting — Smart Contracts

This repository contains a simple Voting smart contract (Solidity) and Hardhat scripts to compile and deploy it.

## What you'll find

- `contracts/Voting.sol` — the Voting contract.
- `scripts/deploy.js` — deployment script that deploys `Voting` with a sample list of candidates.
- `hardhat.config.cjs` — Hardhat configuration (Solidity version, network settings).
- `package.json` — useful npm scripts: `compile` and `deploy`.

## Prerequisites

- Node.js (18+ recommended) and npm or yarn.
- Git (optional).
- For deploying to Sepolia: an RPC URL (from Alchemy/Infura/etc.) and a private key with testnet ETH.

## Environment variables

Create a `.env` file in the project root with the following values when deploying to Sepolia:

```
RPC_URL="https://sepolia.infura.io/v3/YOUR_INFURA_KEY"
PRIVATE_KEY="0xYOUR_PRIVATE_KEY"
```

The `hardhat.config.cjs` reads `RPC_URL` and `PRIVATE_KEY` from `process.env`.

## Install

Install dependencies:

```bash
npm install
```

(or `yarn` if you prefer)

## Compile

Compile the contracts:

```bash
npm run compile
# which runs: npx hardhat compile
```

## Run a local Hardhat node (recommended for testing / quick iteration)

Start a local node in one terminal:

```bash
npx hardhat node
```

Deploy to that local node from another terminal:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

The `deploy.js` script deploys the `Voting` contract with an example list of candidates:

- `Prabowo Subianto`
- `Anies Baswedan`
- `Ganjar Pranowo`

It will log the deployed contract address after deployment.

## Deploy to Sepolia (testnet)

The project already ships with an npm script configured to deploy to Sepolia:

```bash
npm run deploy
# which runs: npx hardhat run scripts/deploy.js --network sepolia
```

Make sure your `.env` is populated with `RPC_URL` and `PRIVATE_KEY` before running the above command.

## Interacting with the contract

- After deployment you can use the Hardhat console or write simple scripts that use `ethers` to attach to the contract address and call read/write functions.
- The `artifacts/` directory contains the compiled ABI/bytecode if you want to integrate with frontend code.

Example using the Hardhat console to attach to a deployed contract:

```bash
npx hardhat console --network localhost
# inside the console
const Voting = await ethers.getContractFactory('Voting')
const voting = await Voting.attach('0x<DEPLOYED_ADDRESS>')
await voting.getCandidates()
```

## Notes & troubleshooting

- If you see `Invalid or missing RPC URL` errors when deploying to Sepolia, confirm `RPC_URL` in `.env` and that your provider supports Sepolia.
- If transactions fail due to insufficient funds, make sure the PRIVATE_KEY account has testnet ETH (Sepolia faucets).
- The `deploy` npm script targets `sepolia` per `package.json`. To change networks, edit `hardhat.config.cjs` and/or use the `--network` flag.

## Files of interest

- `contracts/Voting.sol` — contract source
- `scripts/deploy.js` — deployment script
- `hardhat.config.cjs` — network and compiler config
- `package.json` — install/build/deploy scripts

## Next steps / suggestions

- Add tests under `test/` (Hardhat + mocha + chai) to validate contract behavior.
- Add a simple frontend that reads the ABI from `artifacts/` and interacts with the contract.
- Add verification steps (Hardhat Etherscan plugin) and supply an `ETHERSCAN_API_KEY` for contract verification.

---

If you want, I can:

- Add a `.env.example` file.
- Add a small `test/` suite and run it.
- Add a Makefile or npm scripts for local deploy convenience.

Tell me which of these you'd like next.
