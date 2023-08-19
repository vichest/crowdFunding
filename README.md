# Crowdfunding Smart Contract

This is a simple Ethereum smart contract written in Solidity for conducting crowdfunding campaigns. It allows contributors to send Ether to the contract and tracks the progress towards a funding goal.

## Features

- Accepts contributions from backers in the form of Ether.
- Monitors the campaign progress by tracking the total raised amount and individual contributions.
- Allows the contract owner to close the campaign when the goal is met or the deadline is reached.
- Enables the owner to withdraw the funds once the goal is met.

## Contract Details

- `owner`: The address of the account that deployed the contract.
- `goal`: The funding goal in Ether (wei) that needs to be reached.
- `deadline`: The timestamp representing the campaign deadline.
- `raisedAmount`: The total amount of Ether raised from contributors.
- `contributions`: A mapping that stores individual contributor addresses and their respective contribution amounts.
- `closed`: A boolean flag indicating whether the campaign is closed.

## Functions

### `constructor(uint _goal, uint _durationInDays)`

- Initializes the contract with the funding goal and campaign duration.
- Converts `_goal` to wei to set the goal in Ether's smallest unit.
- Sets the `deadline` as the current timestamp plus `_durationInDays`.

### `contribute(uint contributionAmount)`

- Allows backers to contribute to the campaign by specifying the `contributionAmount`.
- Checks that the campaign is not closed and the deadline has not passed.
- Updates the contributor's contribution amount and the total `raisedAmount`.
- Emits a `ContributionReceived` event to log the contribution.

### `closeCampaign()`

- Allows the contract owner to close the campaign.
- Checks whether the campaign deadline has passed or the goal has been met.
- Sets the `closed` flag to true, indicating that the campaign is closed.

### `withdrawFunds()`

- Allows the contract owner to withdraw the raised funds.
- Checks whether the goal has been met.
- Transfers the entire raised amount to the contract owner's address.

## Usage

1. Deploy the smart contract on the Ethereum blockchain.
2. Specify the funding goal and campaign duration when deploying.
3. Contributors can call the `contribute` function with their desired contribution amount.
4. Monitor the campaign progress by checking the `raisedAmount` and `contributions`.
5. Once the campaign deadline is reached or the goal is met, the owner can call `closeCampaign`.
6. If the goal is met, the owner can call `withdrawFunds` to receive the raised funds.

**Note**: Make sure to test the contract thoroughly on a test network before deploying it to the mainnet.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
