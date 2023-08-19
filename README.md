# Crowdfunding Smart Contract

This repository contains a Solidity smart contract for implementing a crowdfunding campaign. The contract allows users to contribute funds to the campaign and monitors the progress towards the funding goal. If the goal is reached, the campaign is marked as successful, and the funds are transferred to the campaign beneficiary. Otherwise, the campaign is marked as failed.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contract Details](#contract-details)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

- [Solidity Compiler](https://soliditylang.org/docs/getting-started.html#installing-the-solidity-compiler)
- [Truffle](https://www.trufflesuite.com/docs/truffle/getting-started/installation)
- [Ganache](https://www.trufflesuite.com/docs/ganache/quickstart)

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/crowdfunding-smart-contract.git
   ```

2. Change to the project directory:

   ```bash
   cd crowdfunding-smart-contract
   ```

3. Compile the smart contract:

   ```bash
   truffle compile
   ```

4. Deploy the smart contract to your local Ganache network:

   ```bash
   truffle migrate
   ```

## Usage

1. Deploy the contract using the steps mentioned in the installation section.
2. Interact with the contract using a tool like [Remix](https://remix.ethereum.org/) or a custom dApp.
3. Users can contribute funds to the campaign by calling the `contribute` function with their desired contribution amount.
4. The campaign status can be checked using the `checkGoalReached` function.
5. If the funding goal is reached, the campaign status is marked as successful, and the funds are transferred to the beneficiary.

## Contract Details

### Constructor

The constructor accepts two parameters:
- `_beneficiary` (address): The address that will receive the funds if the campaign is successful.
- `_fundingGoal` (uint256): The target amount to be raised for the campaign.

### Functions

- `contribute`: Allows contributors to send Ether to the contract and make contributions to the campaign.

- `checkGoalReached`: Checks whether the funding goal has been reached. If the goal is reached, the campaign is marked as successful, and the funds are transferred to the beneficiary.

### Modifiers

- `onlyOngoingCampaign`: Ensures that certain functions can only be called when the campaign is ongoing.

### Events

- `CampaignSuccessful`: Emitted when the campaign reaches the funding goal and is marked as successful. Provides information about the total amount raised.

- `CampaignFailed`: Emitted when the campaign fails to reach the funding goal. Provides information about the total amount raised.

## Contributing

Contributions to this project are welcome. Feel free to open issues and pull requests if you have suggestions, bug fixes, or improvements.

## License

This project is licensed under the [MIT License](LICENSE).

---
