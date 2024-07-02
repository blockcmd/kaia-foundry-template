// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { LuckyDraw } from "src/LuckyDraw.sol";
import { IPrepayment } from "@bisonai/orakl-contracts/v0.1/src/interfaces/IPrepayment.sol";

contract DrawLuckyDraw is Script {
  
  IPrepayment prepayment = IPrepayment(0x8d3A1663d10eEb0bC9C9e537e1BBeA69383194e7);
  address luckyDrawDeployedAddress;
  address moneeTokenDeployedAddress;

  function run() external {
    vm.startBroadcast();
    prepayment.addConsumer(777, luckyDrawDeployedAddress);
    console.log("Added consumer");
    LuckyDraw luckyDraw = LuckyDraw(luckyDrawDeployedAddress);
    luckyDraw.setMoneeToken(moneeTokenDeployedAddress);
    console.log("Set Monee Token");
    luckyDraw.requestRandomWords();
    vm.stopBroadcast();
    console.log("Drawn LuckyDraw");
  }
}