# Staking Contract

## Overview
Staking Contract is a **Foundry-based** smart contract project that allows users to **stake ETH and earn rewards over time**. Similar to how interest accumulates on a bank balance, users who stake ETH will receive **Orca tokens as staking rewards**.

## Features
- **Stake ETH** and earn rewards in **Orca tokens**.
- **Automated reward accumulation** over time.
- **Secure staking mechanism** implemented using smart contracts.

## Smart Contracts
The core contracts in the `src` directory include:

- **OrcaCoin.sol**: Contract defining the Orca token used as rewards.
- **StakingContract.sol**: Contract handling ETH staking and reward distribution.

## Getting Started

### Prerequisites
Make sure you have the following installed:
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Node.js & npm/yarn (for scripts & interactions)

### Setup & Installation
1. **Clone the repository**:
   ```sh
   git clone https://github.com/karthiksriramoju/staking-contract.git
   cd staking-contract
   ```
2. **Install Foundry** (if not installed):
   ```sh
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```
3. **Build the project**:
   ```sh
   forge build
   ```
4. **Run tests**:
   ```sh
   forge test
   ```

## Deployment
To deploy the contracts on a local or testnet environment:
```sh
forge script script/Deploy.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```
Replace `<RPC_URL>` and `<PRIVATE_KEY>` with your respective values.

## Contributing
Pull requests are welcome! Ensure your code follows best practices and includes test coverage.

## License
This project is licensed under the MIT License.
