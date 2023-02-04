How AAVE works???

Flash Loan uses Kyber & Uniswap services. First we call initFlashLoan() passing assets & amount, it gets LendingPool, checks profit and initiates before execution. The last one is executeOperation() where we execute prepared flash loan. It's conditions are getting assets and setting asets depending on chosen exchange.  