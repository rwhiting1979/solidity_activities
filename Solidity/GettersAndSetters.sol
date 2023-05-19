pragma solidity ^0.5.0;

contract LatestTrade {
    string coin = "BTC";
    uint256 price;
    bool isBuyOrder;

    function setTrade(string memory newCoin, uint256 newPrice, bool isBuy) public {
        coin = newCoin;
        price = newPrice;
        isBuyOrder = isBuy; // Is this a buy or a sell order?
    }

    function getTrade() view public returns (string memory, uint, bool) {
        return(coin, price, isBuyOrder);
    }
}