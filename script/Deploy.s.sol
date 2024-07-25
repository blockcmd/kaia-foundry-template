// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { DeployHelper } from "./DeployHelper.s.sol";
import { TokenERC20 } from "src/TokenERC20.sol";
import { LuckyDraw } from "../src/LuckyDraw.sol";
import '../src/PriceFeedManager.sol';
import 'forge-std/console.sol';

contract Deploy is Script {

    function run() external returns (LuckyDraw, TokenERC20, DeployHelper, PriceFeedManager) {
        /// @dev initialize the DeployHelper contract
        DeployHelper deployHelper = new DeployHelper();

        /// @dev get the active network configuration using the DeployHelper contract
        (address dataFeed, address coordinator, bytes32 keyHash, uint64 accountId, address pythDataFeed) =
            deployHelper.activeNetworkConfig();

        /// @dev start the broadcast
        vm.startBroadcast();

        LuckyDraw luckyDraw = new LuckyDraw(dataFeed, coordinator, keyHash, accountId);
        /// @dev create a new Monee contract with the active network configuration
        TokenERC20 tokenERC20 = new TokenERC20(address(luckyDraw));

        PriceFeedManager priceFeedManager = new PriceFeedManager();

        /// @dev stop the broadcast
        vm.stopBroadcast();

        address feedAddress = priceFeedManager.getCypressFeedAddress("WAVES-KRW");
        console.log(feedAddress);
        /// @dev return the Counter and DeployHelper contracts
        return (luckyDraw, tokenERC20, deployHelper, priceFeedManager);
    }
}
