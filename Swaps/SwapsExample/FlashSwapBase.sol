pragma solidity ^0.8.0;

contract FlashSwapBase {
    // Define state variables
    uint256 public liquidity;
    address public owner;

    // Constructor function
    constructor() public {
        owner = msg.sender;
        liquidity = 0;
    }

    // Function to add liquidity
    function addLiquidity() public payable {
        require(msg.value > 0, "Amount should be greater than 0");
        liquidity += msg.value;
    }

    // Function to remove liquidity
    function removeLiquidity(uint256 _amount) public {
        require(liquidity >= _amount, "Not enough liquidity");
        liquidity -= _amount;
        msg.sender.transfer(_amount);
    }
}
