// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/**
 * @title ERC721Gate
 * @dev This contract allows checking various conditions related to ERC721 tokens.
 */
contract ERC721Gate {
    
    IERC721 public token; // The ERC721 token contract
    uint256 public minBalance;
    /**
     * @dev Constructor to initialize the contract with the ERC721 token and minimum balance requirements.
     * @param _token The address of the ERC721 token contract.
     * @param _minBalance The minimum balance required for certain operations.
     */
    constructor(
        IERC721 _token,
        uint256 _minBalance
    ) {
        token = _token;
        minBalance = _minBalance;
    }

    /**
     * @dev Checks if the user has a balance of ERC721 tokens greater than or equal to the specified minimum balance.
     * @param user The address of the user to check.
     * @return A boolean indicating whether the user has the required balance or not.
     */
    function hasSufficientBalance(address user) external view returns (bool) {
        return token.balanceOf(user) >= minBalance;
    }

    /**
     * @dev Checks if a user is the owner of a specific ERC721 token.
     * @param user The address of the user to check.
     * @param tokenId The ID of the ERC721 token to check ownership for.
     * @return A boolean indicating whether the user is the owner of the specified token or not.
     */
    function isOwner(address user, uint256 tokenId) external view returns (bool) {
        return token.ownerOf(tokenId) == user;
    }

    /**
     * @dev Checks if a user holds at least one ERC721 token.
     * @param user The address of the user to check.
     * @return A boolean indicating whether the user holds at least one ERC721 token.
     */
    function isHolder(address user) external view returns (bool) {
        return token.balanceOf(user) >= 1;
    }
}
