// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Counter } from "src/Counter.sol";
import { ICREATE3Factory } from "lib/create3-factory/src/ICREATE3Factory.sol";

contract CREATE3Guess is Script {
    function run() external returns (address predictedDeploymentAddress) {
        /// @dev declare the address of the CREATE3Factory contract. The address is the same for Kaia mainnet and
        /// testnet
        address create3FactoryAddress = 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F;

        /// @dev declare the address of the deployer. Change this address to your address
        address DEPLOYER = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;

        /// @dev initialize the ICREATE3Factory interface
        ICREATE3Factory create3Factory = ICREATE3Factory(create3FactoryAddress);

        /// @dev start the broadcast
        vm.startBroadcast();

        /// @dev the salt is the bytes32 of the string "counter"
        bytes32 salt = bytes32(abi.encodePacked("counter"));

        /// @dev call the getDeployed function of the CREATE3Factory contract to get the predicted deployment address
        predictedDeploymentAddress = create3Factory.getDeployed(DEPLOYER, salt);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the predictedDeploymentAddress
        return predictedDeploymentAddress;
    }
}
