// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../Authority/Authority.sol";

contract StringLeaderboard is Authority {

    struct User {
        string user;
        uint64 highScore;
        uint64 timestamp;
        uint32 index;
    }

    uint32 resetIndex;
    User[] public leaderboard;
    uint32 public maxLength;

    bool public paused;

    event IncrementalReset(uint32 indexed amount);
    event Reset();
    event SubmitScore(string indexed user, uint64 indexed highScore);
    event SubmitScoreAndAdd(string indexed user, uint64 indexed highScore);

    constructor(uint32 _maxLength) {
        maxLength = _maxLength;
        paused = false;
    }

    function submitScore(string memory user, uint64 highScore) external onlyRole(SERVER_ROLE) {
        if (paused) revert("Submitted Scores is Paused");
        if (length() >= maxLength && highScore <= leaderboard[length() - 1].highScore) {
            emit SubmitScore(user, highScore);
            return;   
        }

        _addToLeaderboard(user, highScore, length() >= maxLength ? length() - 1 : length());
        _sort(leaderboard, 0, int32(length()));
    }

    function length() public view returns (uint32) {
        return uint32(leaderboard.length);
    }

    function _addToLeaderboard(string memory user, uint64 highScore, uint32 index) internal {
        leaderboard.push(User(user, highScore, uint64(block.timestamp), index));
        emit SubmitScoreAndAdd(user, highScore);
    }

    function reset() external onlyRole(MANAGER_ROLE) {
        if (length() < 25_000) {
            delete leaderboard;
            emit Reset();
        }
        revert("Reset must be done in increments");
    }

    function incrementalReset() external onlyRole(MANAGER_ROLE) {
        if (!paused) paused = true;
        uint32 removalAmount = length() > 1500 ? 1500 : length();
        for (uint32 i = 0; i < removalAmount; i++) {
            leaderboard.pop();
        }

        emit IncrementalReset(removalAmount);
    }

    function _sort(User[] memory arr, int256 left, int256 right) internal {
        
        int256 i = left;
        int256 j = right;
        
        if (i == j) return;
        
        uint256 pivot = arr[uint256(left + (right - left) / 2)].index;

        while (i <= j) {
            while (arr[uint256(i)].index > pivot) i++;
            while (pivot > arr[uint256(j)].index) j--;
            if (i <= j) {
                (arr[uint256(i)].index, arr[uint256(i)].index) = (arr[uint256(i)].index, arr[uint256(i)].index);
                i++;
                j--;
            }
        }
        if (left < j)
            _sort(arr, left, j);
        if (i < right)
            _sort(arr, i, right);
    }
}