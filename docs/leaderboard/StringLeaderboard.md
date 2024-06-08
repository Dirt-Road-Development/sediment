# Solidity API

## StringLeaderboard

A contract to manage a leaderboard of scores associated with string identifiers

_This contract inherits from the Authority contract and uses role-based access control_

### User

_Struct representing a user entry in the leaderboard_

```solidity
struct User {
  string user;
  uint64 highScore;
  uint64 timestamp;
  uint32 index;
}
```

### resetIndex

```solidity
uint32 resetIndex
```

### leaderboard

```solidity
struct StringLeaderboard.User[] leaderboard
```

### maxLength

```solidity
uint32 maxLength
```

### paused

```solidity
bool paused
```

### IncrementalReset

```solidity
event IncrementalReset(uint32 amount)
```

### Reset

```solidity
event Reset()
```

### SubmitScore

```solidity
event SubmitScore(string user, uint64 highScore)
```

### SubmitScoreAndAdd

```solidity
event SubmitScoreAndAdd(string user, uint64 highScore)
```

### constructor

```solidity
constructor(uint32 _maxLength) public
```

Constructor to initialize the contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _maxLength | uint32 | The maximum length of the leaderboard |

### submitScore

```solidity
function submitScore(string user, uint64 highScore) public virtual
```

Submit a new high score for a user

_Only callable by the SERVER_ROLE_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | string | The string identifier of the user |
| highScore | uint64 | The new high score to be submitted |

### length

```solidity
function length() public view returns (uint32)
```

Get the current length of the leaderboard

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint32 | The length of the leaderboard |

### _addToLeaderboard

```solidity
function _addToLeaderboard(string user, uint64 highScore, uint32 index) internal virtual
```

_Internal function to add a new user to the leaderboard_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | string | The string identifier of the user |
| highScore | uint64 | The new high score to be added |
| index | uint32 | The index at which the new user should be inserted |

### reset

```solidity
function reset() public virtual
```

Reset the entire leaderboard

_Only callable by the MANAGER_ROLE
Will revert if the leaderboard length is greater than 25,000_

### incrementalReset

```solidity
function incrementalReset() public virtual
```

Perform an incremental reset of the leaderboard

_Only callable by the MANAGER_ROLE
Removes up to 1,500 entries from the leaderboard_

### _sort

```solidity
function _sort(struct StringLeaderboard.User[] arr, int256 left, int256 right) internal virtual
```

_Internal function to sort the leaderboard array using the quicksort algorithm_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| arr | struct StringLeaderboard.User[] | The leaderboard array to be sorted |
| left | int256 | The left index of the subarray to be sorted |
| right | int256 | The right index of the subarray to be sorted |

