# Solidity API

## BotProtection

_Contract for rate limiting functionality based on function calls._

### ProtectionLevel

```solidity
enum ProtectionLevel {
  OFF,
  LOW,
  MEDIUM,
  HIGH,
  EXTREME
}
```

### Limit

```solidity
struct Limit {
  uint64 lastRequest;
  uint8 strikes;
  bool isBlacklisted;
}
```

### cooldown

```solidity
uint64 cooldown
```

### level

```solidity
enum BotProtection.ProtectionLevel level
```

### strikes

```solidity
uint8 strikes
```

### useBlacklist

```solidity
bool useBlacklist
```

### limits

```solidity
mapping(address => struct BotProtection.Limit) limits
```

### checkForBot

```solidity
modifier checkForBot(address addr)
```

_Modifier to check for bot activity and apply rate limiting._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| addr | address | The address to check for bot activity. |

### RemoveFromBlacklist

```solidity
event RemoveFromBlacklist(address[] addresses)
```

### SetProtectionLevel

```solidity
event SetProtectionLevel(enum BotProtection.ProtectionLevel protectionLevel)
```

### ToggleBlacklist

```solidity
event ToggleBlacklist(bool enabled)
```

### constructor

```solidity
constructor(enum BotProtection.ProtectionLevel _level, bool _useBlacklist) public
```

_Constructor to initialize the contract with protection level and blacklist usage._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _level | enum BotProtection.ProtectionLevel | The initial protection level. |
| _useBlacklist | bool | Flag indicating whether to use blacklist. |

### _setProtectionLevel

```solidity
function _setProtectionLevel(enum BotProtection.ProtectionLevel protectionLevel) internal virtual
```

_Internal function to set protection level parameters._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| protectionLevel | enum BotProtection.ProtectionLevel | The protection level to set. |

### removeFromBlacklist

```solidity
function removeFromBlacklist(address[] addresses) public virtual
```

_Function to remove addresses from blacklist._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| addresses | address[] | The addresses to remove from blacklist. |

### setProtectionLevel

```solidity
function setProtectionLevel(enum BotProtection.ProtectionLevel protectionLevel) public virtual
```

_Function to set the protection level._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| protectionLevel | enum BotProtection.ProtectionLevel | The protection level to set. |

### toggleBlacklist

```solidity
function toggleBlacklist() public virtual
```

_Function to toggle the blacklist on/off._

