# Funding Smart Contract

## Overview

The Funding smart contract is a Solidity-based Ethereum contract that implements a basic ERC20 token with additional functionalities. The contract is designed to facilitate the management and distribution of a custom token named "FUNDING" (FND). The contract inherits from OpenZeppelin's ERC20, Ownable, and ERC20Burnable contracts, which provide standard ERC20 token features, ownership control, and burnable capabilities, respectively.

## Features

- Token Name: FUNDING
- Symbol: FND

The contract introduces the following functions:

- `mint(address to, uint256 amount)`: Allows the contract owner to mint new FND tokens and send them to a specified address.
- `decimals()`: Overrides the ERC20 function to return a fixed value of 0 as the token's decimal places.
- `getBalance()`: Returns the balance of FND tokens held by the calling address.
- `transferTokens(address _receiver, uint256 _value)`: Allows users to transfer FND tokens to a specified receiver address. This function enforces a check to prevent transfers from the designated `bank` address.

## Prerequisites

- Solidity compiler version ^0.8.18
- OpenZeppelin library: ERC20, Ownable, and ERC20Burnable

## Installation

1. Clone this repository: `git clone https://github.com/your-username/your-repo.git`
2. Navigate to the contract directory: `cd your-repo/contracts`
3. Install dependencies: Make sure you have OpenZeppelin installed, or run `npm install @openzeppelin/contracts`
4. Compile the smart contract: Use your preferred Solidity compiler to compile the `Funding.sol` file.

## Usage

1. Deploy the `Funding` smart contract to an Ethereum network.
2. Interact with the contract using the available functions to manage and transfer FND tokens.

## Examples

### Minting New Tokens

To mint new FND tokens, call the `mint` function, providing the recipient's address and the amount of tokens to mint.

```solidity
function mintTokens(address recipient, uint256 amount) public onlyOwner {
    mint(recipient, amount);
}
```

### Transferring Tokens

Users can transfer FND tokens to another address using the `transferTokens` function. Ensure you have enough tokens and execute the function as follows:

```solidity
function transferTo(address recipient, uint256 amount) public {
    transferTokens(recipient, amount);
}
```

## License

This smart contract is released under the MIT License. See [LICENSE](./LICENSE) for more information.

---

Remember to replace `"your-username/your-repo"` with your actual GitHub username and repository name. Additionally, ensure that the `LICENSE` file is present in your repository root directory and contains the appropriate MIT License text.

Feel free to customize the README according to your needs and preferences.
