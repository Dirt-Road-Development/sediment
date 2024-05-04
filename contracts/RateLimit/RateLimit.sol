// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract RateLimit {

    uint64 public cooldown;

    mapping(address => uint64) public limits;

    modifier checkLimit(address user) {
        if (limits[user] + cooldown >= uint64(block.timestamp)) revert("Rate Limit Hit");
        _;
        limits[user] = uint64(block.timestamp);
    }

    constructor(
       uint256 _cooldownInSeconds
    ) {
        cooldown = uint64(_cooldownInSeconds);
    }
}