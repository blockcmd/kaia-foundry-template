// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { Counter } from "src/Counter.sol";
import { ICREATE3Factory } from "lib/create3-factory/src/ICREATE3Factory.sol";

contract CREATE3Deploy is Script {
    function run() external returns (address counterAddress) {
        /// @dev declare the address of the CREATE3Factory contract. The address is the same for Kaia mainnet and
        /// testnet
        address create3FactoryAddress = 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F;

        /// @dev initialize the ICREATE3Factory interface
        ICREATE3Factory create3Factory = ICREATE3Factory(create3FactoryAddress);

        /// @dev start the broadcast
        vm.startBroadcast();

        /// @dev get the creation code of the Counter contract
        bytes memory creationCode = type(Counter).creationCode;

        /// @dev the salt is the bytes32 of the string "counter"
        bytes32 salt = bytes32(abi.encodePacked("counter"));

        /// @dev call the deploy function of the CREATE3Factory contract to deploy the Counter contract with the salt
        counterAddress = create3Factory.deploy(salt, creationCode);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the counterAddress
        return counterAddress;
    }
}
