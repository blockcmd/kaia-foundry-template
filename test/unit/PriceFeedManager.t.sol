// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import 'forge-std/Test.sol';
import '../../src/PriceFeedManager.sol';

contract PriceFeedManagerTest is Test {
    PriceFeedManager priceFeedManager;
    address WAVES = 0xc367A319b3A87b5006838A9C7f06e99fF2a0F1B8;
    address WAVES_CYPRESS = 0xD74E8DF81873f11CE1A43688A608Aae7CEE07002;

    function setup() public returns (PriceFeedManager) {
        vm.startBroadcast();
        priceFeedManager = new PriceFeedManager();
        vm.stopBroadcast();

        return priceFeedManager;
    }

    function getTestNetFeedAddress() public view {
        address feedAddress = priceFeedManager.getBaobabFeedAddress("WAVES-KRW");
        assertEq(feedAddress, WAVES);
    }

    function getCypressFeedAddress() public view {
        address feedAddress = priceFeedManager.getCypressFeedAddress("WAVES-KRW");
        assertEq(feedAddress, WAVES_CYPRESS);
    }

}