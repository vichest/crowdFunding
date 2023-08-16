// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Funding is ERC20, Ownable,ERC20Burnable {
    address bank = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;  

    constructor() ERC20("FUNDING", "FND") {}

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }
        function decimals() override public pure returns (uint8) {
            return 0;
        }
        function getBalance() external view returns (uint256) {
            return this.balanceOf (msg. sender);
        }
        function transferTokens(address _receiver, uint256 _value) public  {
            require(msg.sender!=bank);
            require(balanceOf(msg .sender)>=_value,"You do not have enough Tokens");
            approve(msg. sender,_value);
            transferFrom(msg.sender,_receiver,_value);
        }
        
}
