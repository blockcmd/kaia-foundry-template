// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import { TokenKIP7 } from "src/TokenKIP7.sol";
import { Test, console } from "forge-std/Test.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

contract TokenERC20Test is StdCheats, Test {
    TokenKIP7 public tokenKIP7;
    address public constant USER = address(1);
    address public constant SPENDER = address(2);

    function setUp() public {
        tokenERC20 = new TokenERC20(USER);
    }

    function test_Owner() public view {
        assertEq(address(tokenERC20.owner()), USER);
    }

    function test_Symbol() public view {
        assertEq(tokenERC20.symbol(), "TERC20");
    }

    function test_Name() public view {
        assertEq(tokenERC20.name(), "Token ERC20");
    }

    function test_Mint() public {
        vm.startPrank(USER);
        tokenERC20.mint(USER, 100);
        vm.stopPrank();
        assertEq(tokenERC20.balanceOf(USER), 100);
    }

    function test_Allowance() public {
        vm.startPrank(USER);
        tokenERC20.approve(SPENDER, 100);
        vm.stopPrank();
        assertEq(tokenERC20.allowance(USER, SPENDER), 100);
    }

    function testFail_CannotSpendWithNoAllowance() public {
        vm.startPrank(USER);
        tokenERC20.mint(USER, 100);
        vm.stopPrank();
        vm.expectRevert("Cannot spend with no allowance");
        tokenERC20.transferFrom(USER, SPENDER, 100);
    }
}
