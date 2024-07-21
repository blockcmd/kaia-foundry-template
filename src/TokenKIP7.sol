// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "kaia-contracts/contracts/KIP/token/KIP7/KIP7.sol";
import "kaia-contracts/contracts/access/Ownable.sol";

/// @title TokenKIP7
/// @author BlockCMD
/// @notice A simple KIP7 token that can be minted by its owner
contract TokenKIP7 is KIP7, Ownable {
    /// -----------------------------------------------------------------------
    /// Constructor
    /// -----------------------------------------------------------------------

    /// @notice Constructor to declare token name, symbol and initialOwner
    constructor() KIP7("Token KIP7", "TKIP7") Ownable() { }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return super.supportsInterface(interfaceId);
    }

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
