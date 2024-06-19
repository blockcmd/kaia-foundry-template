// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { LuckyDraw } from "src/LuckyDraw.sol";

contract DrawLuckyDraw is Script {
  uint256 SEND_VALUE = 8 ether;

  function run() external {
    vm.startBroadcast();
    LuckyDraw(payable(0x1AB3f8fab3267ed55FCb6E77DE36D65820A76b19)).draw{value: SEND_VALUE}();
    vm.stopBroadcast();
    console.log("Drawn LuckyDraw");
  }
}