// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "../authority/Authority.sol";

/// @title BytesLeaderboard
/// @author Dirt Road Development
/// @notice A contract to manage a leaderboard of scores associated with user bytes32 values
/// @dev This contract inherits from the Authority contract and uses role-based access control
contract BytesLeaderboard is Authority {
    /// @dev Struct representing a user entry in the leaderboard
    struct User {
        bytes32 user; // The user's bytes32 identifier
        uint64 highScore; // The user's high score
        uint64 timestamp; // The timestamp when the score was submitted
        uint32 index; // The index of the user in the sorted leaderboard
    }

    uint32 resetIndex; // Variable used for incremental reset
    User[] public leaderboard; // The leaderboard array of User structs
    uint32 public maxLength; // The maximum length of the leaderboard
    bool public paused; // Flag indicating whether score submission is paused

    event IncrementalReset(uint32 indexed amount); // Event emitted when an incremental reset is performed
    event Reset(); // Event emitted when the leaderboard is completely reset
    event SubmitScore(bytes32 indexed user, uint64 indexed highScore); // Event emitted when a score is submitted but not added to the leaderboard
    event SubmitScoreAndAdd(bytes32 indexed user, uint64 indexed highScore); // Event emitted when a score is submitted and added to the leaderboard

    /// @notice Constructor to initialize the contract
    /// @param _maxLength The maximum length of the leaderboard
    constructor(uint32 _maxLength) {
        maxLength = _maxLength;
        paused = false;
    }

    /// @notice Submit a new high score for a user
    /// @param user The bytes32 identifier of the user
    /// @param highScore The new high score to be submitted
    /// @dev Only callable by the SERVER_ROLE
    function submitScore(bytes32 user, uint64 highScore) external onlyRole(SERVER_ROLE) {
        if (paused) revert("Submitted Scores is Paused");
        if (length() >= maxLength && highScore <= leaderboard[length() - 1].highScore) {
            emit SubmitScore(user, highScore);
            return;
        }
        _addToLeaderboard(user, highScore, length() >= maxLength ? length() - 1 : length());
        _sort(leaderboard, 0, int32(length()));
    }

    /// @notice Get the current length of the leaderboard
    /// @return The length of the leaderboard
    function length() public view returns (uint32) {
        return uint32(leaderboard.length);
    }

    /// @dev Internal function to add a new user to the leaderboard
    /// @param user The bytes32 identifier of the user
    /// @param highScore The new high score to be added
    /// @param index The index at which the new user should be inserted
    function _addToLeaderboard(bytes32 user, uint64 highScore, uint32 index) internal {
        leaderboard.push(User(user, highScore, uint64(block.timestamp), index));
        emit SubmitScoreAndAdd(user, highScore);
    }

    /// @notice Reset the entire leaderboard
    /// @dev Only callable by the MANAGER_ROLE
    /// @dev Will revert if the leaderboard length is greater than 25,000
    function reset() external onlyRole(MANAGER_ROLE) {
        if (length() < 25_000) {
            delete leaderboard;
            emit Reset();
        }
        revert("Reset must be done in increments");
    }

    /// @notice Perform an incremental reset of the leaderboard
    /// @dev Only callable by the MANAGER_ROLE
    /// @dev Removes up to 1,500 entries from the leaderboard
    function incrementalReset() external onlyRole(MANAGER_ROLE) {
        if (!paused) paused = true;
        uint32 removalAmount = length() > 1500 ? 1500 : length();
        for (uint32 i = 0; i < removalAmount; i++) {
            leaderboard.pop();
        }
        emit IncrementalReset(removalAmount);
    }

    /// @dev Internal function to sort the leaderboard array using the quicksort algorithm
    /// @param arr The leaderboard array to be sorted
    /// @param left The left index of the subarray to be sorted
    /// @param right The right index of the subarray to be sorted
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