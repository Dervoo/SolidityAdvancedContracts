pragma solidity ^0.8.0;

contract EthereumToWethBridge {
    WETH public weth;

    constructor(WETH _weth) public {
        weth = _weth;
    }

    function convertEthToWeth() public payable {
        weth.deposit();
    }

    function convertWethToEth(uint _value) public {
        weth.withdraw(_value);
    }
}
