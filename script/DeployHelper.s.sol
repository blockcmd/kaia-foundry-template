// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { MockDataFeedAggregator } from "test/mocks/MockDataFeedAggregator.t.sol";
import { Script } from "forge-std/Script.sol";

contract DeployHelper is Script {

    /// @dev declare a struct to store the network configuration
    struct NetworkConfig {
        uint16 startingNumber;
        address dataFeed;
    }

    /// @dev declare a variable to store the network configuration
    NetworkConfig public activeNetworkConfig;

    /// @dev declare the constant DECIMALS for Orakl data feed (8 decimals as per documentation)
    uint8 public constant DECIMALS = 8;

    /** @dev declare the constant INITIAL_PRICE for Orakl data feed 
     * keeping 8 decimals notation 
     * KLAY/USDT price equal to 0.15e8 at the time of writing */
    int256 public constant INITIAL_PRICE = 0.15e8;

    /// @dev declare an event to log the creation of the mock data feed
    event DeployHelper__CreatedMockDataFeed(address dataFeed);

    constructor() {
        if (block.chainid == 1001) {
            activeNetworkConfig = getKaiaKairosConfig();
        } else if (block.chainid == 8217) {
            activeNetworkConfig = getKaiaMainnetConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilConfig();
        }
    }

    function getKaiaKairosConfig() public pure returns (NetworkConfig memory kairosNetworkConfig) {
        kairosNetworkConfig = NetworkConfig({
            startingNumber: 1001,
            /// @dev KLAY-USDT data feed address by Orakl on Kaia Kairos
            dataFeed: 0x1408cb13D84bA8Cb533FdF332db5D78290B071C9 
        });
    }

    function getKaiaMainnetConfig() public pure returns (NetworkConfig memory kaiaNetworkConfig) {
        kaiaNetworkConfig = NetworkConfig({
            startingNumber: 8217,
            /// @dev KLAY-USDT data feed address by Orakl on Kaia Mainnet
            dataFeed: 0x6a08d36e8C10D5d89529c7443cEBF37EA2cd01D4 // KLAY-USDT
        });
    }

    function getOrCreateAnvilConfig() public returns (NetworkConfig memory anvilNetworkConfig) {
        
        /// @dev Check if the price feed is already set, then just return the config
        if (activeNetworkConfig.dataFeed != address(0)) {
            return activeNetworkConfig;
        }

        /// @dev if the price feed is not set, then create a mock price feed
        /// @dev use Foundry cheatcode vm.startBroadcast to start interacting with the anvil local network
        vm.startBroadcast();

        /// @dev create a mock price feed by initializing the MockDataFeedAggregator contract with the DECIMALS and INITIAL_PRICE
        MockDataFeedAggregator mockDataFeed = new MockDataFeedAggregator(
            DECIMALS,
            INITIAL_PRICE
        );

        /// @dev use Foundry cheatcode vm.stopBroadcast to stop interacting with the anvil local network
        vm.stopBroadcast();

        /// @dev emit an event to log the creation of the mock data feed
        emit DeployHelper__CreatedMockDataFeed(address(mockDataFeed));
        
        /// @dev return the network configuration with the mock data feed
        anvilNetworkConfig = NetworkConfig({startingNumber: 42, dataFeed: address(mockDataFeed)});
    }
}