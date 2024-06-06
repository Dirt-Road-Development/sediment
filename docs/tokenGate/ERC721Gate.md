# Solidity API

## ERC721Gate

_This contract allows checking various conditions related to ERC721 tokens._

### token

```solidity
contract IERC721 token
```

### minBalance

```solidity
uint256 minBalance
```

### constructor

```solidity
constructor(contract IERC721 _token, uint256 _minBalance) public
```

_Constructor to initialize the contract with the ERC721 token and minimum balance requirements._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _token | contract IERC721 | The address of the ERC721 token contract. |
| _minBalance | uint256 | The minimum balance required for certain operations. |

### hasSufficientBalance

```solidity
function hasSufficientBalance(address user) external view returns (bool)
```

_Checks if the user has a balance of ERC721 tokens greater than or equal to the specified minimum balance._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user has the required balance or not. |

### isOwner

```solidity
function isOwner(address user, uint256 tokenId) external view returns (bool)
```

_Checks if a user is the owner of a specific ERC721 token._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |
| tokenId | uint256 | The ID of the ERC721 token to check ownership for. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user is the owner of the specified token or not. |

### isHolder

```solidity
function isHolder(address user) external view returns (bool)
```

_Checks if a user holds at least one ERC721 token._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | A boolean indicating whether the user holds at least one ERC721 token. |

