// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import { Monee } from "src/MoneeToken.sol";
import { DeployHelper } from "script/DeployHelper.s.sol";
import { Deploy } from "script/Deploy.s.sol";

contract CounterTest is Test {
    Monee public monee;
    DeployHelper public deployHelper;

    function setUp() public {
        Deploy deployer = new Deploy();
        (,monee,) = deployer.run();
    }
}
