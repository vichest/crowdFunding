// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public raisedAmount = 0;
    mapping(address => uint) public contributions;
    bool public closed = false;

    event ContributionReceived(address contributor, uint amount);

    constructor(uint _goal, uint _durationInDays) {
        owner = msg.sender;
        goal = _goal * 1 ether; // Convert to wei (Ether's smallest unit)
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier notClosed() {
        require(!closed, "The campaign is closed");
        _;
    }

    function contribute(uint contributionAmount) external notClosed {
    require(block.timestamp < deadline, "The campaign has ended");
    require(contributionAmount > 0, "Contribution amount must be greater than zero");

    // Update the contributor's contribution amount
    contributions[msg.sender] += contributionAmount;

    // Update the total raised amount
    raisedAmount += contributionAmount;

    // Emit an event to log the contribution
    emit ContributionReceived(msg.sender, contributionAmount);
}


    function closeCampaign() external onlyOwner {
        require(block.timestamp >= deadline || raisedAmount >= goal, "The campaign is still active");
        closed = true;
    }

    function withdrawFunds() external onlyOwner {
        require(raisedAmount >= goal, "The goal has not been reached");
        payable(owner).transfer(raisedAmount);
    }
}
