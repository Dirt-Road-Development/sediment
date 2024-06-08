// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title ITokenGate
/// @notice Interface for the TokenGate contract that provides functions to check if an address holds specific tokens
interface ITokenGate {
    /// @notice Check if a user holds a given ERC-20 or ERC-721 token
    /// @param user The address of the user to check
    /// @param token The address of the token contract
    /// @return bool True if the user holds the token, false otherwise
    function isHolder(address user, address token) external returns (bool);

    /// @notice Check if a user holds a specific ERC-721 or ERC-1155 token ID
    /// @param user The address of the user to check
    /// @param token The address of the token contract
    /// @param tokenId The ID of the token to check
    /// @return bool True if the user holds the token ID, false otherwise
    function isNFTHolder(address user, address token, uint256 tokenId) external returns (bool);

    /// @notice Check if a user holds any of the specified ERC-1155 token IDs
    /// @param user The address of the user to check
    /// @param ids An array of token IDs to check
    /// @return bool True if the user holds any of the token IDs, false otherwise
    function isERC1155Holder(address user, uint256[] memory ids) external returns (bool);

    /// @notice Check if a user holds any of the specified ERC-721 token IDs
    /// @param user The address of the user to check
    /// @param ids An array of token IDs to check
    /// @return bool True if the user holds any of the token IDs, false otherwise
    function isERC721Holder(address user, uint256[] memory ids) external returns (bool);
}
