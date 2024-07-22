// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { TokenERC20 } from "src/TokenERC20.sol";
import { ICREATE3Factory } from "lib/create3-factory/src/ICREATE3Factory.sol";

contract CREATE3Guess is Script {
    function run() external returns (address predictedDeploymentAddress) {
        /// @dev declare the address of the CREATE3Factory contract. The address is the same for Kaia mainnet and
        /// testnet
        address create3FactoryAddress = 0x6aA3D87e99286946161dCA02B97C5806fC5eD46F;
        address OWNER = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
        /// @dev initialize the ICREATE3Factory interface
        ICREATE3Factory create3Factory = ICREATE3Factory(create3FactoryAddress);

        /// @dev start the broadcast
        vm.startBroadcast();

        /// @dev create a new Monee contract with the active network configuration
        // bytes memory creationCode = type(TokenERC20).creationCode;

        bytes32 salt = bytes32(abi.encodePacked("token"));
        predictedDeploymentAddress = create3Factory.getDeployed(OWNER, salt);
        /// @dev stop the broadcast
        vm.stopBroadcast();
        /// @dev return the Counter and DeployHelper contracts
        return predictedDeploymentAddress;
    }
}
