contract WbtcToBitconBridge {
    WBTC public wbtc;

    /// @dev for real usage you have to maintain real conversion rates
    /// @dev and secure holding of both currencies
    constructor(WBTC _wbtc) public {
        wbtc = _wbtc; 
        /// @dev you pass real wbtc address here 
    }

    function convertBtcToWbtc(uint _value) public {
        wbtc.deposit(_value);
    }

    function convertWbtcToBtc(uint _value) public {
        wbtc.withdraw(_value);
    }
}
