pragma solidity ^0.8.0;

contract YieldFarm {
    address owner;
    uint256 poolAmount;
    uint256 poolRate;
    uint256 poolLockDuration;

    mapping (address => uint256) deposits;

    constructor() public {
        owner = msg.sender;
        poolAmount = 0;
        poolRate = 10;
        poolLockDuration = 30;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        poolAmount += msg.value;
        deposits[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 withdrawalAmount = deposits[msg.sender] * poolRate / 100;
        require(withdrawalAmount > 0, "No funds available to withdraw.");
        require(block.timestamp > poolLockDuration, "Pool is locked. Please wait.");
        msg.sender.transfer(withdrawalAmount);
        poolAmount -= withdrawalAmount;
        deposits[msg.sender] = 0;
    }

    function getPoolAmount() public view returns (uint256) {
        return poolAmount;
    }

    function getPoolRate() public view returns (uint256) {
        return poolRate;
    }

    function getPoolLockDuration() public view returns (uint256) {
        return poolLockDuration;
    }

    function changePoolRate(uint256 newRate) public {
        require(msg.sender == owner, "Only owner can change pool rate.");
        poolRate = newRate;
    }

    function changePoolLockDuration(uint256 newDuration) public {
        require(msg.sender == owner, "Only owner can change pool lock duration.");
        poolLockDuration = newDuration;
    }
}