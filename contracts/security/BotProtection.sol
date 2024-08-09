// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "../authority/Authority.sol";

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

    event AddToBlacklist(address indexed addr);
    event AddStrike(address indexed addr, uint256 indexed strike);

    /**
     * @dev Modifier to check for bot activity and apply rate limiting.
     * @param addr The address to check for bot activity.
     */
    modifier checkForBot(address addr) {
        if (level == ProtectionLevel.OFF) _;
        
        require(!limits[addr].isBlacklisted, "Address is blacklisted");
        
        bool ok = uint64(block.timestamp) - limits[addr].lastRequest >= cooldown;
        
        if (!ok) {
            if (limits[addr].strikes + 1 >= strikes) {
                if (useBlacklist) limits[addr].isBlacklisted = true;
                emit AddToBlacklist(addr);

            } else {
                limits[addr].strikes++;
                emit AddStrike(addr, limits[addr].strikes);
            }
            return;
        } else {
            limits[addr].strikes = 0;
            limits[addr].lastRequest = uint64(block.timestamp); // Update after successful check
        }

        _;
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
    function _setProtectionLevel(ProtectionLevel protectionLevel) internal virtual {
        if (protectionLevel == ProtectionLevel.OFF) {
            cooldown = 0;
            strikes = 0;
        }
        
        if (protectionLevel == ProtectionLevel.LOW) {
            cooldown = 10 seconds;
            strikes = 3;
        }
        if (protectionLevel == ProtectionLevel.MEDIUM) {
            cooldown = 30 seconds;
            strikes = 3;
        }
        if (protectionLevel == ProtectionLevel.HIGH) {
            cooldown = 60 seconds;
            strikes = 3;
        }
        if (protectionLevel == ProtectionLevel.EXTREME) {
            cooldown = 5 minutes;
            strikes = 3;
        }

        emit SetProtectionLevel(protectionLevel);
    }

    /**
     * @dev Function to remove addresses from blacklist.
     * @param addresses The addresses to remove from blacklist.
     */
    function removeFromBlacklist(address[] memory addresses) public virtual onlyRole(MANAGER_ROLE) {
        for (uint256 i = 0; i < addresses.length; i++) {
            limits[addresses[i]].isBlacklisted = false;
        }

        emit RemoveFromBlacklist(addresses);
    }

    /**
     * @dev Function to set the protection level.
     * @param protectionLevel The protection level to set.
     */
    function setProtectionLevel(ProtectionLevel protectionLevel) public virtual onlyRole(MANAGER_ROLE) {
        _setProtectionLevel(protectionLevel);
    }

    /**
     * @dev Function to toggle the blacklist on/off.
     */
    function toggleBlacklist() public virtual onlyRole(MANAGER_ROLE) {
        useBlacklist = !useBlacklist;
        emit ToggleBlacklist(useBlacklist);
    }
}
