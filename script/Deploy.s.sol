// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { DeployHelper } from "./DeployHelper.s.sol";
import { Counter } from "../src/Counter.sol";
import { Monee } from "../src/MoneeToken.sol";

contract Deploy is Script {
    function run() external returns (Counter, Monee, DeployHelper) {
        /// @dev initialize the DeployHelper contract
        DeployHelper deployHelper = new DeployHelper();

        /// @dev get the active network configuration using the DeployHelper contract 
        (uint16 startingNumber,) = deployHelper.activeNetworkConfig();

        /// @dev start the broadcast
        vm.startBroadcast();

        /// @dev create a new Counter contract with the active network configuration
        Counter counter = new Counter(startingNumber);

        /// @dev create a new Monee contract with the active network configuration
        Monee monee = new Monee(0x6FaFF29226219756aa40CE648dbc65FB41DE5F72);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the Counter and DeployHelper contracts
        return (counter, monee, deployHelper);
    }
}