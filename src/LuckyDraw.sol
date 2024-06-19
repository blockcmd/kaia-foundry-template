// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {IAggregator} from "@bisonai/orakl-contracts/src/v0.1/interfaces/IAggregator.sol";
import {PriceConverter} from "./PriceConverter.sol";

error LuckyDraw__InsufficientAmount();

contract LuckyDraw {
    uint256 public constant MINIMUM_USD = 1 * 10 ** 18;
    IAggregator private s_priceFeed;
    address private immutable i_owner;

    constructor(address priceFeed) {
        s_priceFeed = IAggregator(priceFeed);
        i_owner = msg.sender;
    }

    function draw() public payable {
        if (msg.value < MINIMUM_USD) {
            revert LuckyDraw__InsufficientAmount();
        }
    }

    function suggestedAmount() public view returns (uint256) {
        return PriceConverter.getConversionRate(MINIMUM_USD, s_priceFeed);
    }
}
