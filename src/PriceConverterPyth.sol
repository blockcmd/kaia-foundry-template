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
    /// @param feedId The strcut wrapper for the feedId to get price of the price feed contract
    /// @param priceFeed The address of the price feed contract
    /// @param priceUpdate The new price update
    /// @return price The KLAY/USD exchange rate in 18 digit
    function getPrice(bytes32 feedId, address priceFeed, bytes[] calldata priceUpdate) internal returns (uint256) {
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
        // priceFeed.id = ; // KLAY/USD
        // priceFeedId = 0xde5e6ef09931fecc7fdd8aaa97844e981f3e7bb1c86a6ffc68e9166bb0db3743;
        PythStructs.Price memory Newprice = pyth.getPrice(feedId);
        return (uint256(uint64(Newprice.price)) * 10 ** 10);
    }

    /// @notice Convert the KLAY amount to USD amount
    /// @param klayAmount The amount of KLAY to convert
    /// @param feedId The address of the price feed contract
    /// @return klayAmountInUsd The amount of KLAY in USD
    function getConversionRate(bytes32 feedId, uint klayAmount, address priceFeed, bytes[] calldata priceUpdate) internal returns (uint256 klayAmountInUsd) {
        uint256 klayPrice = getPrice(feedId, priceFeed, priceUpdate);
        klayAmountInUsd = (klayPrice * klayAmount) / 1e18;
        // the actual KLAY/USD conversation rate, after adjusting the extra 0s to be in wei unit.
        return klayAmountInUsd;
    }
}
