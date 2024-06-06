# Solidity API

## Logger

_A contract for logging events with different severity levels.
Inherits from Authority contract._

### Debug

```solidity
event Debug(bytes32 id, string value, uint64 timestamp)
```

_Emitted when a debug message is logged._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| id | bytes32 | The unique identifier of the log. |
| value | string | The debug message. |
| timestamp | uint64 | The timestamp of the log. |

### Error

```solidity
event Error(bytes32 id, string value, uint64 timestamp)
```

_Emitted when an error message is logged._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| id | bytes32 | The unique identifier of the log. |
| value | string | The error message. |
| timestamp | uint64 | The timestamp of the log. |

### Info

```solidity
event Info(bytes32 id, string value, uint64 timestamp)
```

_Emitted when an informational message is logged._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| id | bytes32 | The unique identifier of the log. |
| value | string | The informational message. |
| timestamp | uint64 | The timestamp of the log. |

### Warn

```solidity
event Warn(bytes32 id, string value, uint64 timestamp)
```

_Emitted when a warning message is logged._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| id | bytes32 | The unique identifier of the log. |
| value | string | The warning message. |
| timestamp | uint64 | The timestamp of the log. |

### debugLog

```solidity
function debugLog(string value) internal virtual
```

_Internal function to log a debug message._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| value | string | The debug message to be logged. |

### errorLog

```solidity
function errorLog(string value) internal virtual
```

_Internal function to log an error message._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| value | string | The error message to be logged. |

### infoLog

```solidity
function infoLog(string value) internal virtual
```

_Internal function to log an informational message._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| value | string | The informational message to be logged. |

### warnLog

```solidity
function warnLog(string value) internal virtual
```

_Internal function to log a warning message._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| value | string | The warning message to be logged. |

