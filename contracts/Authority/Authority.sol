// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Authority is AccessControl {

    /// @notice For contracts that need to whitelist users
    bytes32 public constant BLACKLIST_ROLE = keccak256("BLACKLIST_ROLE");

    /// @notice For contracts to call contracts
    bytes32 public constant CONTRACT_ROLE = keccak256("CONTRACT_ROLE");

    /// @notice For creator of new assets in NFT based contracts
    bytes32 public constant CREATOR_ROLE = keccak256("CREATOR_ROLE");

    /// @notice For key manual management of a smart contracts
    bytes32 public constant MANAGER_ROLE = keccak256("MANAGER_ROLE");

    /// @notice For token based contracts that have a growing supply
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /// @notice For contracts that have server's managing functions
    bytes32 public constant SERVER_ROLE = keccak256("SERVER_ROLE");

    /// @notice For contracts that need to whitelist users
    bytes32 public constant WHITELIST_ROLE = keccak256("WHITELIST_ROLE");

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