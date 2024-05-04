// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface ILeaderboard {
    function isPaused() external view returns (bool);
    function length() external view returns (uint32);
    function reset() external;
    function incrementalReset() external;
    function submitScore(address user, uint64 highScore) external;
}