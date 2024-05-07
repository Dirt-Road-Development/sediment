// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

/// @title Authority
/// @author Dirt Road Development
/// @notice A contract that defines various roles for access control
/// @dev This contract inherits from the OpenZeppelin AccessControl contract
contract Authority is AccessControl {
    /// @notice Role for contracts that need to blacklist users
    bytes32 public constant BLACKLIST_ROLE = keccak256("BLACKLIST_ROLE");

    /// @notice Role for contracts to call other contracts
    bytes32 public constant CONTRACT_ROLE = keccak256("CONTRACT_ROLE");

    /// @notice Role for creators of new assets in NFT-based contracts
    bytes32 public constant CREATOR_ROLE = keccak256("CREATOR_ROLE");

    /// @notice Role for key manual management of smart contracts
    bytes32 public constant MANAGER_ROLE = keccak256("MANAGER_ROLE");

    /// @notice Role for token-based contracts that have a growing supply
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /// @notice Role for contracts that have server's managing functions
    bytes32 public constant SERVER_ROLE = keccak256("SERVER_ROLE");

    /// @notice Role for contracts that need to whitelist users
    bytes32 public constant WHITELIST_ROLE = keccak256("WHITELIST_ROLE");

    /// @notice Constructor that grants all defined roles to the deployer
    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _grantRole(BLACKLIST_ROLE, _msgSender());
        _grantRole(CREATOR_ROLE, _msgSender());
        _grantRole(MANAGER_ROLE, _msgSender());
        _grantRole(MINTER_ROLE, _msgSender());
        _grantRole(SERVER_ROLE, _msgSender());
        _grantRole(WHITELIST_ROLE, _msgSender());
    }
}