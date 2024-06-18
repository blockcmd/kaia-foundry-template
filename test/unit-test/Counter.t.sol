// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import { Counter } from "src/Counter.sol";
import { DeployHelper } from "script/DeployHelper.s.sol";
import { Deploy } from "script/Deploy.s.sol";

contract CounterTest is Test {
    Counter public counter;
    DeployHelper public deployHelper;

    function setUp() public {
        Deploy deployer = new Deploy();
        (fundMe, helperConfig) = deployer.run();
        counter = new Counter(42);
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
