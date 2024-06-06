# Solidity API

## IStringLeaderboard

Interface for a leaderboard contract that manages user scores associated with string identifiers

### isPaused

```solidity
function isPaused() external view returns (bool)
```

Check if the score submission is currently paused

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if score submission is paused, false otherwise |

### length

```solidity
function length() external view returns (uint32)
```

Get the current length of the leaderboard

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint32 | The length of the leaderboard |

### reset

```solidity
function reset() external
```

Reset the entire leaderboard

_This function should be restricted to authorized roles/addresses_

### incrementalReset

```solidity
function incrementalReset() external
```

Perform an incremental reset of the leaderboard

_This function should be restricted to authorized roles/addresses
Removes a batch of entries from the leaderboard_

### submitScore

```solidity
function submitScore(string user, uint64 highScore) external
```

Submit a new high score for a user

_This function should be restricted to authorized roles/addresses_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | string | The string identifier of the user |
| highScore | uint64 | The new high score to be submitted |

