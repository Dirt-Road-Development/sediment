// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

/**
 * @title ERC1155Gate
 * @dev This contract allows checking various conditions related to ERC1155 tokens.
 */
contract ERC1155Gate {

    IERC1155 public token; // The ERC1155 token contract
    uint256[] public tokenIds; // Array of token IDs
    
    /**
     * @dev Constructor to initialize the contract with the ERC1155 token and token IDs.
     * @param _token The address of the ERC1155 token contract.
     * @param _tokenIds An array of token IDs to track.
     */
    constructor(
        IERC1155 _token,
        uint256[] memory _tokenIds
    ) {
        token = _token;
        if (_tokenIds.length > 100) revert("Maximum 100 token IDs allowed");
        tokenIds = _tokenIds;
    }

    /**
     * @dev Checks if the user holds at least one instance of any of the tracked token IDs.
     * @param user The address of the user to check.
     * @return A boolean indicating whether the user holds at least one instance of any tracked token.
     */
    function isHolder(address user) external view returns (bool) {
        for (uint256 i = 0; i < tokenIds.length; i++) {
            if (token.balanceOf(user, tokenIds[i]) >= 1) return true;
        }
        return false;
    }

    /**
     * @dev Checks if the user holds at least one instance of any of the token IDs within a specified range.
     * @param user The address of the user to check.
     * @param ids An array of token IDs to check within the range.
     * @return A boolean indicating whether the user holds at least one instance of any tracked token within the range.
     */
    function isHolderInRange(address user, uint256[] memory ids) external view returns (bool) {
        if (ids.length > 10) revert("Maximum range is 10");
        for (uint256 i = 0; i < ids.length; i++) {
            if (token.balanceOf(user, ids[i]) >= 1) return true;
        }
        return false;
    }

    /**
     * @dev Checks if the user holds at least one instance of a specific token ID.
     * @param user The address of the user to check.
     * @param tokenId The token ID to check.
     * @return A boolean indicating whether the user holds at least one instance of the specified token ID.
     */
    function isHolderByToken(address user, uint256 tokenId) external view returns (bool) {
        return token.balanceOf(user, tokenId) >= 1;
    }

    /**
     * @dev Checks if the user's balance of a specific token ID is greater than or equal to a specified minimum amount.
     * @param user The address of the user to check.
     * @param tokenId The token ID to check.
     * @param minimumAmount The minimum amount required for the token balance.
     * @return A boolean indicating whether the user's balance of the specified token ID meets the minimum amount requirement.
     */
    function isBalanceSufficient(address user, uint256 tokenId, uint256 minimumAmount) external view returns (bool) {
        return token.balanceOf(user, tokenId) >= minimumAmount;
    }
}
