// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.19;

import { IFeedProxy } from "lib/orakl/contracts/v0.2/src/interfaces/IFeedProxy.sol";
/// @title LuckyDraw
/// @author BlockCMD
/// @notice A price converter library that convert KLAY to USD amount
library PriceConverter {
    /// @notice Fetch the price of KLAY in USD from Orakl Network price feed
    /// @param priceFeed The address of the price feed contract
    /// @return price The KLAY/USD exchange rate in 18 digit
    function getPrice(IFeedProxy priceFeed) internal view returns (uint256 price) {
        (, int256 answer,) = priceFeed.latestRoundData(); // 8 digits
        price = uint256(answer * 10 ** 10); // 18 digits
        return price; // 18 digits
    }

    /// @notice Convert the KLAY amount to USD amount
    /// @param klayAmount The amount of KLAY to convert
    /// @param priceFeed The address of the price feed contract
    /// @return klayAmountInUsd The amount of KLAY in USD
    function getConversionRate(
        uint256 klayAmount,
        IFeedProxy priceFeed
    )
        internal
        view
        returns (uint256 klayAmountInUsd)
    {
        uint256 klayPrice = getPrice(priceFeed);
        klayAmountInUsd = (klayPrice * klayAmount) / 10 ** 18;
        // the actual KLAY/USD conversation rate, after adjusting the extra 0s to be in wei unit.
        return klayAmountInUsd;
    }
}
