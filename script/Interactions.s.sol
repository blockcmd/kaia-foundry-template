// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { LuckyDraw } from "src/LuckyDraw.sol";

contract DrawLuckyDraw is Script {

  LuckyDraw luckyDraw = LuckyDraw(0xa5DE8993c063fEfeCCE05e41effF2B17fF8F9DF7);

  function run() external {
    vm.startBroadcast();
    luckyDraw.setMoneeToken(0x58F994D52A56A864Baf0123fA57Fe1336fD1C01b);
    luckyDraw.requestRandomWords();
    vm.stopBroadcast();
    console.log("Drawn LuckyDraw");
  }
}