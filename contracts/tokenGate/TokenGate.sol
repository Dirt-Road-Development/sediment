// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC721 } from  "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import { IERC1155 } from  "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "../tokenChecker/TokenChecker.sol";

/// @title TokenGate
/// @author Your Name
/// @notice A contract that provides functions to check if an address holds specific tokens
/// @dev This contract inherits from the TokenChecker contract
contract TokenGate is TokenChecker {
    /// @notice Check if a user holds a given ERC-20 or ERC-721 token
    /// @param user The address of the user to check
    /// @param token The address of the token contract
    /// @return bool True if the user holds the token, false otherwise
    function isHolder(address user, address token) external view returns (bool) {
        if (isERC20(token)) {
            return IERC20(token).balanceOf(user) > 0;
        } else if (isERC721(token)) {
            return IERC721(token).balanceOf(user) >= 1;
        } else {
            return false;
        }
    }

    /// @notice Check if a user holds a specific ERC-721 or ERC-1155 token ID
    /// @param user The address of the user to check
    /// @param token The address of the token contract
    /// @param tokenId The ID of the token to check
    /// @return bool True if the user holds the token ID, false otherwise
    function isNFTHolder(address user, address token, uint256 tokenId) external view returns (bool) {
        if (isERC1155(token)) {
            return IERC1155(token).balanceOf(user, tokenId) >= 1;
        } else if (isERC721(token)) {
            return IERC721(token).balanceOf(user) >= 1;
        } else {
            return false;
        }
    }

    /// @notice Check if a user holds any of the specified ERC-1155 token IDs
    /// @param user The address of the user to check
    /// @param token The address of the ERC-1155 token contract
    /// @param ids An array of token IDs to check
    /// @return bool True if the user holds any of the token IDs, false otherwise
    function isERC1155Holder(address user, address token, uint256[] memory ids) external view returns (bool) {
        if (!isERC1155(token)) revert("Not recognized as an ERC-1155");
        if (ids.length > 50_000) revert("50,000 is maximum ids to check");

        IERC1155 erc1155 = IERC1155(token);
        for (uint256 i = 0; i < ids.length; i++) {
            if (erc1155.balanceOf(user, ids[i]) >= 1) return true;
        }
        return false;
    }

    /// @notice Check if a user holds any of the specified ERC-721 token IDs
    /// @param user The address of the user to check
    /// @param token The address of the ERC-721 token contract
    /// @param ids An array of token IDs to check
    /// @return bool True if the user holds any of the token IDs, false otherwise
    function isERC721Holder(address user, address token, uint256[] memory ids) external view returns (bool) {
        if (!isERC721(token)) revert("Not recognized as an ERC-721");
        if (ids.length > 50_000) revert("50,000 is maximum ids to check");

        IERC721 erc721 = IERC721(token);
        for (uint256 i = 0; i < ids.length; i++) {
            if (erc721.ownerOf(ids[i]) == user) return true;
        }
        return false;
    }
}