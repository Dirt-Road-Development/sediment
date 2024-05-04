// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../Authority/Authority.sol";

/**
 * @title Logger
 * @dev A contract for logging events with different severity levels.
 * Inherits from Authority contract.
 */
contract Logger is Authority {
    
    /**
     * @dev Emitted when a debug message is logged.
     * @param id The unique identifier of the log.
     * @param value The debug message.
     * @param timestamp The timestamp of the log.
     */
    event Debug(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    
    /**
     * @dev Emitted when an error message is logged.
     * @param id The unique identifier of the log.
     * @param value The error message.
     * @param timestamp The timestamp of the log.
     */
    event Error(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    
    /**
     * @dev Emitted when an informational message is logged.
     * @param id The unique identifier of the log.
     * @param value The informational message.
     * @param timestamp The timestamp of the log.
     */
    event Info(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    
    /**
     * @dev Emitted when a warning message is logged.
     * @param id The unique identifier of the log.
     * @param value The warning message.
     * @param timestamp The timestamp of the log.
     */
    event Warn(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    
    /**
     * @dev Internal function to log a debug message.
     * @param value The debug message to be logged.
     */
    function debugLog(string memory value) internal {
        emit Debug(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }
    
    /**
     * @dev Internal function to log an error message.
     * @param value The error message to be logged.
     */
    function errorLog(string memory value) internal {
        emit Error(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }
    
    /**
     * @dev Internal function to log an informational message.
     * @param value The informational message to be logged.
     */
    function infoLog(string memory value) internal {
        emit Info(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }
    
    /**
     * @dev Internal function to log a warning message.
     * @param value The warning message to be logged.
     */
    function warnLog(string memory value) internal {
        emit Warn(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }
}
