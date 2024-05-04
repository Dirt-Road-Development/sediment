// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// ERC-165 interface
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/// @title TokenChecker
/// @author Dirt Road Development
/// @notice A contract to check if a given contract address implements the ERC-20, ERC-721, or ERC-1155 token standard
contract TokenChecker {
    
    /// @dev Interface ID for ERC-721 token standard
    bytes4 private constant ERC721_INTERFACE_ID = 0x80ac58cd;
    /// @dev Interface ID for ERC-1155 token standard
    bytes4 private constant ERC1155_INTERFACE_ID = 0xd9b67a26;

    /// @notice Check if the given contract address is an ERC-20 token contract
    /// @param tokenAddress The address of the token contract to check
    /// @return bool True if the contract is an ERC-20 token, false otherwise
    function isERC20(address tokenAddress) public pure returns (bool) {
        IERC20 tokenContract = IERC20(tokenAddress);
        return (
            tokenContract.totalSupply.selector == 0x18160ddd &&
            tokenContract.balanceOf.selector == 0x70a08231 &&
            tokenContract.transfer.selector == 0xa9059cbb &&
            tokenContract.allowance.selector == 0xdd62ed3e &&
            tokenContract.approve.selector == 0x095ea7b3 &&
            tokenContract.transferFrom.selector == 0x23b872dd
        );
    }

    /// @notice Check if the given contract address is an ERC-721 token contract
    /// @param tokenAddress The address of the token contract to check
    /// @return bool True if the contract is an ERC-721 token, false otherwise
    function isERC721(address tokenAddress) public view returns (bool) {
        IERC165 tokenContract = IERC165(tokenAddress);
        return tokenContract.supportsInterface(ERC721_INTERFACE_ID);
    }

    /// @notice Check if the given contract address is an ERC-1155 token contract
    /// @param tokenAddress The address of the token contract to check
    /// @return bool True if the contract is an ERC-1155 token, false otherwise
    function isERC1155(address tokenAddress) public view returns (bool) {
        IERC165 tokenContract = IERC165(tokenAddress);
        return tokenContract.supportsInterface(ERC1155_INTERFACE_ID);
    }
}