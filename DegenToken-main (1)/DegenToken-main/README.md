# FoodToken Project

A blockchain-based token system for managing and redeeming food items using an ERC20 token called `FoodToken`. This smart contract is designed to be deployed and tested using the Remix IDE.

## Description

The `FoodToken` smart contract allows users to mint, transfer, and redeem tokens for various food items. Each food item has a unique ID, name, and cost in tokens. Users can burn their tokens or redeem them for food items, with ownership of redeemed items tracked on-chain.

## Getting Started

### Requirements

- Remix IDE: [https://remix.ethereum.org/](https://remix.ethereum.org/)
- MetaMask browser extension for wallet management.

### Installing

1. Open Remix IDE in your browser.
2. Create a new file in Remix and paste the `FoodToken` smart contract code into it.
3. Ensure you have a compatible Ethereum development environment or connect to a test network like Rinkeby, Goerli, or a local Ganache instance.

### Executing Program

1. Compile the smart contract:
   - In Remix, go to the **Solidity Compiler** tab.
   - Select the appropriate compiler version (e.g., `0.8.13`).
   - Click **Compile FoodToken.sol**.

2. Deploy the contract:
   - Go to the **Deploy & Run Transactions** tab.
   - Select the appropriate environment (e.g., **Injected Web3** for MetaMask or **Remix VM** for local testing).
   - Deploy the `FoodToken` contract.

3. Interact with the contract:
   - Use the deployed contract interface in Remix to call functions such as `mintTokens`, `redeemFood`, `getAvailableFood`, and `getOwnedFoodItems`.
   - Example:
     - Mint tokens to a user:
       ```javascript
       mintTokens("0xYourAddress", 100);
       ```
     - Redeem food item:
       ```javascript
       redeemFood(1); // Redeems "Banana Cake"
       ```

## Help

For common issues:
1. Ensure the correct Solidity compiler version (`^0.8.13`) is selected in Remix.
2. Make sure MetaMask is connected to the same network as Remix.
3. If the contract fails to deploy, check the console for errors and verify gas fees.

# Authors
Justin Bulot

Email - 202110965@fit.edu.ph

## License
This project is licensed under the MIT License - see the LICENSE.md file for details


This file can be directly used for GitHub, and it includes all the necessary information about the contract, its functionalities, and how to run the project locally. Simply copy this text into a `README.md` file in your project directory.
