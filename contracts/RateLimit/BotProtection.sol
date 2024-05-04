// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../Authority/Authority.sol";

/**
 * @title RateLimitByFunction
 * @dev Contract for rate limiting functionality based on function calls.
 */
contract BotProtection is Authority {
    enum ProtectionLevel { OFF, LOW, MEDIUM, HIGH, EXTREME }

    struct Limit {
        uint64 lastRequest;
        uint8 strikes;
        bool isBlacklisted;
    }

    uint64 public cooldown;
    ProtectionLevel public level;
    uint8 public strikes;
    bool public useBlacklist;

    mapping(address => Limit) public limits;

    /**
     * @dev Modifier to check for bot activity and apply rate limiting.
     * @param addr The address to check for bot activity.
     */
    modifier checkForBot(address addr) {
        require(!limits[addr].isBlacklisted, "Address is blacklisted");

        bool ok = limits[addr].lastRequest + cooldown >= uint64(block.timestamp);

        if (!ok) {
            if (limits[addr].strikes + 1 >= strikes) {
                if (useBlacklist) limits[addr].isBlacklisted = true;
            }
        }

        require(ok, "Rate Limit Hit");

        _;

        limits[addr].lastRequest = uint64(block.timestamp);
    }

    event RemoveFromBlacklist(address[] addresses);
    event SetProtectionLevel(ProtectionLevel indexed protectionLevel);
    event ToggleBlacklist(bool indexed enabled);

    /**
     * @dev Constructor to initialize the contract with protection level and blacklist usage.
     * @param _level The initial protection level.
     * @param _useBlacklist Flag indicating whether to use blacklist.
     */
    constructor(
       ProtectionLevel _level,
       bool _useBlacklist
    ) {
        level = _level;
        useBlacklist = _useBlacklist;

        _setProtectionLevel(level);
    }

    /**
     * @dev Internal function to set protection level parameters.
     * @param protectionLevel The protection level to set.
     */
    function _setProtectionLevel(ProtectionLevel protectionLevel) internal {
        if (protectionLevel == ProtectionLevel.OFF) {
            cooldown = 0;
            strikes = 0;
        }
        
        if (protectionLevel == ProtectionLevel.LOW) {
            cooldown = 60 seconds;
            strikes = 5;
        }
        if (protectionLevel == ProtectionLevel.MEDIUM) {
            cooldown = 5 minutes;
            strikes = 5;
        }
        if (protectionLevel == ProtectionLevel.HIGH) {
            cooldown = 60 minutes;
            strikes = 5;
        }
        if (protectionLevel == ProtectionLevel.EXTREME) {
            cooldown = 24 hours;
            strikes = 3;
        }

        emit SetProtectionLevel(protectionLevel);
    }

    /**
     * @dev Function to remove addresses from blacklist.
     * @param addresses The addresses to remove from blacklist.
     */
    function removeFromBlacklist(address[] memory addresses) external onlyRole(MANAGER_ROLE) {
        for (uint256 i = 0; i < addresses.length; i++) {
            limits[addresses[i]].isBlacklisted = false;
        }

        emit RemoveFromBlacklist(addresses);
    }

    /**
     * @dev Function to set the protection level.
     * @param protectionLevel The protection level to set.
     */
    function setProtectionLevel(ProtectionLevel protectionLevel) external onlyRole(MANAGER_ROLE) {
        _setProtectionLevel(protectionLevel);
    }

    /**
     * @dev Function to toggle the blacklist on/off.
     */
    function toggleBlacklist() external onlyRole(MANAGER_ROLE) {
        useBlacklist = !useBlacklist;
        emit ToggleBlacklist(useBlacklist);
    }
}
