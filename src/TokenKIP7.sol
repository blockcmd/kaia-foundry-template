// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@kaiachain/contracts/KIP/token/KIP7/KIP7.sol";
import "lib/kaia-contracts/contracts/access/Ownable.sol";

/// @title TokenKIP7
/// @author BlockCMD
/// @notice A simple KIP7 token that can be minted by its owner
contract TokenKIP7 is KIP7, Ownable {
    
    /// -----------------------------------------------------------------------
    /// Constructor
    /// -----------------------------------------------------------------------

    /// @notice Constructor to declare token name, symbol and initialOwner
    /// @param initialOwner The amount of underlying tokens to wrap
    constructor(address initialOwner) KIP7("Token KIP7", "TKIP7") Ownable(initialOwner) { }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return super.supportsInterface(interfaceId);
    }

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
