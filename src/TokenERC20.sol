// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title TokenERC20
/// @author BlockCMD
/// @notice A simple ERC20 token that can be minted by its owner
contract TokenERC20 is ERC20, Ownable {
    /// -----------------------------------------------------------------------
    /// Constructor
    /// -----------------------------------------------------------------------

    /// @notice Constructor to declare token name, symbol and initialOwner
    /// @param initialOwner The privillege account of the token
    constructor(address initialOwner) ERC20("Token ERC20", "TERC20") Ownable(initialOwner) { }

    /// -----------------------------------------------------------------------
    /// User actions
    /// -----------------------------------------------------------------------

    /// @notice Mints new tokens to the specified address
    /// @param to The address to mint tokens to
    /// @param amount The amount of tokens to mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
