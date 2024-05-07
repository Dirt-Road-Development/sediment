// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title ERC20Gate
 * @dev This contract allows checking the balance of ERC20 tokens for a given user.
 */
contract ERC20Gate {
    
    IERC20 public token; // The ERC20 token contract
    uint256 public minBalance; // The minimum balance required for certain operations
    
    /**
     * @dev Constructor to initialize the contract with the ERC20 token and minimum balance requirements.
     * @param _token The address of the ERC20 token contract.
     * @param _minBalance The minimum balance required for certain operations.
     */
    constructor(
        IERC20 _token,
        uint256 _minBalance
    ) {
        token = _token;
        minBalance = _minBalance;
    }

    /**
     * @dev Checks if the user has a balance of ERC20 tokens greater than or equal to the specified minimum balance.
     * @param user The address of the user to check.
     * @return A boolean indicating whether the user has the required balance or not.
     */
    function hasSufficientBalance(address user) external view returns (bool) {
        return token.balanceOf(user) >= minBalance;
    }

    /**
     * @dev Checks if the user has a balance of ERC20 tokens greater than -
     * @param user The address of the user to check.
     * @return A boolean indicating whether the user is a holder.
     */
    function isHolder(address user) external view returns (bool) {
        return token.balanceOf(user) > 0;
    }
}
