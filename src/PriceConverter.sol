// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.19;
import { IFeedProxy } from "@bisonai/orakl-contracts/v0.2/src/interfaces/IFeedProxy.sol";

library PriceConverter {
    function getPrice(IFeedProxy priceFeed) internal view returns (uint256) {
        (, int256 answer,) = priceFeed.latestRoundData();
        // ETH/USD rate in 18 digit
        return uint256(answer * 10 ** 10);
    }

    // 1000000000
    // call it get fiatConversionRate, since it assumes something about decimals
    // It wouldn't work for every aggregator
    function getConversionRate(uint256 klayAmount, IFeedProxy priceFeed) internal view returns (uint256) {
        uint256 klayPrice = getPrice(priceFeed);
        uint256 klayAmountInUsd = (klayPrice * klayAmount) / 10 ** 18;
        // the actual ETH/USD conversation rate, after adjusting the extra 0s.
        return klayAmountInUsd;
    }
}