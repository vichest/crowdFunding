// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Funding is Ownable {
    using SafeMath for uint256;

    address payable public beneficiary;
    uint256 public fundingGoal;
    uint256 public totalFunds;

    mapping(address => uint256) public contributions;

    enum CampaignStatus { Ongoing, Failed, Successful }
    CampaignStatus public campaignStatus;

    constructor(address payable _beneficiary, uint256 _fundingGoal) {
        beneficiary = _beneficiary;
        fundingGoal = _fundingGoal;
        campaignStatus = CampaignStatus.Ongoing;
    }

    modifier onlyOngoingCampaign() {
        require(campaignStatus == CampaignStatus.Ongoing, "Campaign is not ongoing");
        _;
    }

    function contribute() external payable onlyOngoingCampaign {
        require(msg.value > 0, "Contribution amount must be greater than 0");
        contributions[msg.sender] = contributions[msg.sender].add(msg.value);
        totalFunds = totalFunds.add(msg.value);
    }

    function checkGoalReached() external onlyOngoingCampaign {
        if (totalFunds >= fundingGoal) {
            campaignStatus = CampaignStatus.Successful;
            emit CampaignSuccessful(totalFunds);
            // Transfer funds to the beneficiary
            beneficiary.transfer(totalFunds);
        } else {
            campaignStatus = CampaignStatus.Failed;
            emit CampaignFailed(totalFunds);
        }
    }

    event CampaignSuccessful(uint256 totalAmount);
    event CampaignFailed(uint256 totalAmount);
}
