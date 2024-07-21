// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import { TokenKIP7 } from "src/TokenKIP7.sol";
import { Test, console } from "forge-std/Test.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

contract TokenKIP7Test is StdCheats, Test {
    TokenKIP7 public tokenKIP7;
    address public constant USER = address(1);
    address public constant SPENDER = address(2);

    function setUp() public {
        tokenKIP7 = new TokenKIP7(USER);
    }

    function test_Owner() public view {
        assertEq(address(tokenKIP7.owner()), USER);
    }

    function test_Symbol() public view {
        assertEq(tokenKIP7.symbol(), "TKIP7");
    }

    function test_Name() public view {
        assertEq(tokenKIP7.name(), "Token KIP7");
    }

    function test_Mint() public {
        vm.startPrank(USER);
        tokenKIP7.mint(USER, 100);
        vm.stopPrank();
        assertEq(tokenKIP7.balanceOf(USER), 100);
    }

    function test_Allowance() public {
        vm.startPrank(USER);
        tokenKIP7.approve(SPENDER, 100);
        vm.stopPrank();
        assertEq(tokenKIP7.allowance(USER, SPENDER), 100);
    }

    function testFail_CannotSpendWithNoAllowance() public {
        vm.startPrank(USER);
        tokenKIP7.mint(USER, 100);
        vm.stopPrank();
        vm.expectRevert("Cannot spend with no allowance");
        tokenKIP7.transferFrom(USER, SPENDER, 100);
    }
}
