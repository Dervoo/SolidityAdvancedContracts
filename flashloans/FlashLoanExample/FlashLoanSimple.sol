p
Copy code
pragma solidity ^0.8.0;

contract FlashLoanSimple {
    uint256 public borrowedAmount;
    uint256 public maxLoanSize;
    uint256 public interestRate;
    uint256 public loanDuration;
    uint256 public deadline;
    address payable public lender;
    
    constructor(uint256 _maxLoanSize, uint256 _interestRate, uint256 _loanDuration) public {
        maxLoanSize = _maxLoanSize;
        interestRate = _interestRate;
        loanDuration = _loanDuration;
    }
    
    function borrow(uint256 _amount) public payable {
        require(msg.value == _amount, "Loan amount and deposit must match");
        require(borrowedAmount == 0, "A loan is already outstanding");
        require(_amount <= maxLoanSize, "Loan amount exceeds maximum loan size");
        deadline = block.timestamp + loanDuration;
        borrowedAmount = _amount;
        lender = payable(msg.sender);
    }
    
    function repay(uint256 _repaymentAmount) public payable {
        require(msg.sender == lender, "Only the lender can repay the loan");
        require(block.timestamp >= deadline, "Loan has not yet reached the repayment deadline");
        require(_repaymentAmount == borrowedAmount + (borrowedAmount * interestRate) / 100,
                "Repayment amount does not match the expected amount");
        lender.transfer(borrowedAmount);
        borrowedAmount = 0;
    }
}