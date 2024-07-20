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
    /// @param initialOwner The amount of underlying tokens to wrap
    constructor(address initialOwner) ERC20("Token ERC20", "TERC20") Ownable(initialOwner) { }

    /// -----------------------------------------------------------------------
    /// User actions
    /// -----------------------------------------------------------------------

    /// @notice Mints wrapped tokens using underlying tokens. Can only be called before the vest is over.
    /// @param to The amount of underlying tokens to wrap
    /// @param amount The amount of wrapped tokens to mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
