# Solidity API

## ERC1155Gate

_This contract allows checking various conditions related to ERC1155 tokens._

### token

```solidity
contract IERC1155 token
```

### tokenIds

```solidity
uint256[] tokenIds
```

### constructor

```solidity
constructor(contract IERC1155 _token, uint256[] _tokenIds) public
```

_Constructor to initialize the contract with the ERC1155 token and token IDs._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _token | contract IERC1155 | The address of the ERC1155 token contract. |
| _tokenIds | uint256[] | An array of token IDs to track. |

### isHolder

```solidity
function isHolder(address user) external view returns (bool)
```

_Checks if the user holds at least one instance of any of the tracked token IDs._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user holds at least one instance of any tracked token. |

### isHolderInRange

```solidity
function isHolderInRange(address user, uint256[] ids) external view returns (bool)
```

_Checks if the user holds at least one instance of any of the token IDs within a specified range._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |
| ids | uint256[] | An array of token IDs to check within the range. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user holds at least one instance of any tracked token within the range. |

### isHolderByToken

```solidity
function isHolderByToken(address user, uint256 tokenId) external view returns (bool)
```

_Checks if the user holds at least one instance of a specific token ID._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |
| tokenId | uint256 | The token ID to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user holds at least one instance of the specified token ID. |

### isBalanceSufficient

```solidity
function isBalanceSufficient(address user, uint256 tokenId, uint256 minimumAmount) external view returns (bool)
```

_Checks if the user's balance of a specific token ID is greater than or equal to a specified minimum amount._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |
| tokenId | uint256 | The token ID to check. |
| minimumAmount | uint256 | The minimum amount required for the token balance. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user's balance of the specified token ID meets the minimum amount requirement. |

