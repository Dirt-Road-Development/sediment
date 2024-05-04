// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IBytesLeaderboard {
    function isPaused() external view returns (bool);
    function length() external view returns (uint32);
    function reset() external;
    function incrementalReset() external;
    function submitScore(bytes32 user, uint64 highScore) external;
}