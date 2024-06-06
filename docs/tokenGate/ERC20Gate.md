# Solidity API

## ERC20Gate

_This contract allows checking the balance of ERC20 tokens for a given user._

### token

```solidity
contract IERC20 token
```

### minBalance

```solidity
uint256 minBalance
```

### constructor

```solidity
constructor(contract IERC20 _token, uint256 _minBalance) public
```

_Constructor to initialize the contract with the ERC20 token and minimum balance requirements._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _token | contract IERC20 | The address of the ERC20 token contract. |
| _minBalance | uint256 | The minimum balance required for certain operations. |

### hasSufficientBalance

```solidity
function hasSufficientBalance(address user) external view returns (bool)
```

_Checks if the user has a balance of ERC20 tokens greater than or equal to the specified minimum balance._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user has the required balance or not. |

### isHolder

```solidity
function isHolder(address user) external view returns (bool)
```

_Checks if the user has a balance of ERC20 tokens greater than -_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user is a holder. |

