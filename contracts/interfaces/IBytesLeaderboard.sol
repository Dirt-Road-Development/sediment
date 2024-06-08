// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title IBytesLeaderboard
/// @author Dirt Road Development
/// @notice Interface for a leaderboard contract that manages user scores associated with bytes32 identifiers
interface IBytesLeaderboard {
    /// @notice Check if the score submission is currently paused
    /// @return True if score submission is paused, false otherwise
    function isPaused() external view returns (bool);

    /// @notice Get the current length of the leaderboard
    /// @return The length of the leaderboard
    function length() external view returns (uint32);

    /// @notice Reset the entire leaderboard
    /// @dev This function should be restricted to authorized roles/addresses
    function reset() external;

    /// @notice Perform an incremental reset of the leaderboard
    /// @dev This function should be restricted to authorized roles/addresses
    /// @dev Removes a batch of entries from the leaderboard
    function incrementalReset() external;

    /// @notice Submit a new high score for a user
    /// @param user The bytes32 identifier of the user
    /// @param highScore The new high score to be submitted
    /// @dev This function should be restricted to authorized roles/addresses
    function submitScore(bytes32 user, uint64 highScore) external;
}