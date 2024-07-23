// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.19;

import "@pythnetwork/pyth-sdk-solidity/IPyth.sol";
import "@pythnetwork/pyth-sdk-solidity/PythStructs.sol";

/// @title LuckyDraw
/// @author BlockCMD
/// @notice A price converter library that convert KLAY to USD amount using Pyth Network
library PriceConverter {
    /// @notice Fetch the price of KLAY in USD from Pyth Network price feed
    /// @param priceFeed The address of the price feed contract
    /// @return price The KLAY/USD exchange rate in 18 digit
    function getPrice(address priceFeed) internal view returns (uint256 price) {
        // Submit a priceUpdate to the Pyth contract to update the on-chain price.
        // Updating the price requires paying the fee returned by getUpdateFee.
        // WARNING: These lines are required to ensure the getPrice call below succeeds. If you remove them,
        // transactions may fail with "0x19abf40e" error.
        IPyth pyth = IPyth(priceFeed);
        uint256 fee = pyth.getUpdateFee(priceUpdate);
        pyth.updatePriceFeeds{ value: fee }(priceUpdate);

        // Read the current price from a price feed.
        // Each price feed (e.g., ETH/USD) is identified by a price feed ID.
        // The complete list of feed IDs is available at https://pyth.network/developers/price-feed-ids
        bytes32 priceFeedId = 0xde5e6ef09931fecc7fdd8aaa97844e981f3e7bb1c86a6ffc68e9166bb0db3743; // KLAY/USD
        PythStructs.Price memory price = pyth.getPrice(priceFeedId);
        return price;
    }

    /// @notice Convert the KLAY amount to USD amount
    /// @param klayAmount The amount of KLAY to convert
    /// @param priceFeed The address of the price feed contract
    /// @return klayAmountInUsd The amount of KLAY in USD
    function getConversionRate(uint256 klayAmount, address priceFeed) internal view returns (uint256 klayAmountInUsd) {
        uint256 klayPrice = getPrice(priceFeed);
        klayAmountInUsd = (klayPrice * klayAmount) / 10 ** 18;
        // the actual KLAY/USD conversation rate, after adjusting the extra 0s to be in wei unit.
        return klayAmountInUsd;
    }
}
