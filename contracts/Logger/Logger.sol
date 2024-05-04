// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../Authority/Authority.sol";

contract Logger is Authority {

    event Debug(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    event Error(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    event Info(bytes32 indexed id, string indexed value, uint64 indexed timestamp);
    event Warn(bytes32 indexed id, string indexed value, uint64 indexed timestamp);

    function debugLog(string memory value) external onlyRole(CONTRACT_ROLE) {
        emit Debug(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }

    function errorLog(string memory value) external onlyRole(CONTRACT_ROLE) {
        emit Error(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }

    function infoLog(string memory value) external onlyRole(CONTRACT_ROLE) {
        emit Info(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }

    function warnLog(string memory value) external onlyRole(CONTRACT_ROLE) {
        emit Warn(keccak256(abi.encodePacked(value, uint64(block.timestamp))), value, uint64(block.timestamp));    
    }
}