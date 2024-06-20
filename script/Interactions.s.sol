// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { LuckyDraw } from "src/LuckyDraw.sol";
import { IPrepayment } from "@bisonai/orakl-contracts/v0.1/src/interfaces/IPrepayment.sol";
import { DevOpsTools } from "lib/foundry-devops/src/DevOpsTools.sol";

contract DrawLuckyDraw is Script {
  
  IPrepayment prepayment = IPrepayment(0x8d3A1663d10eEb0bC9C9e537e1BBeA69383194e7);

  function run() external {
    address mostRecentlyDeployedLuckyDrawContract = DevOpsTools.get_most_recent_deployment("LuckyDraw", block.chainid);
    console.log("Address of LuckyDraw: ", mostRecentlyDeployedLuckyDrawContract);
    address mostRecentlyDeployedMoneeTokenContract = DevOpsTools.get_most_recent_deployment("Monee", block.chainid);
    console.log("Address of Monee Token: ", mostRecentlyDeployedMoneeTokenContract);
    vm.startBroadcast();
    prepayment.addConsumer(777, 0xc793328d20A95Ff8A6bd96D0B8B0acd039e3d64c);
    console.log("Added consumer");
    LuckyDraw luckyDraw = LuckyDraw(0xc793328d20A95Ff8A6bd96D0B8B0acd039e3d64c);
    luckyDraw.setMoneeToken(0x6161cf6650Dd64c2cBAECd3b92F7B761C26344b2);
    console.log("Set Monee Token");
    luckyDraw.requestRandomWords();
    vm.stopBroadcast();
    console.log("Drawn LuckyDraw");
  }
}