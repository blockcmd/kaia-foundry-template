// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import '../src/PriceFeedManager.sol';
import 'forge-std/console.sol';
import 'forge-std/Script.sol';

contract DeployPriceFeedManager is Script {
    PriceFeedManager priceFeedManager;

    function run() external returns (PriceFeedManager) {
        vm.startBroadcast();
        priceFeedManager = new PriceFeedManager();
        vm.stopBroadcast();

        address feedAddress = priceFeedManager.getBaobabFeedAddress("WAVES-KRW");
        address cypressFeedAddress = priceFeedManager.getCypressFeedAddress('WAVES-KRW');
        console.log(feedAddress, cypressFeedAddress);

        return priceFeedManager;
    }
}
