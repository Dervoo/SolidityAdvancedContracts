pragma solidity ^0.8.0;

contract WETH {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint value);

    constructor() public {
        totalSupply = 0;
        balanceOf[msg.sender] = msg.value;
        totalSupply += msg.value;
        emit Transfer(address(0), msg.sender, msg.value);
    }

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        emit Transfer(address(0), msg.sender, msg.value);
    }

    function withdraw(uint _value) public {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        msg.sender.transfer(_value);
        emit Transfer(msg.sender, address(0), _value);
    }
}
