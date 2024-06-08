# Solidity API

## ITokenGate

Interface for the TokenGate contract that provides functions to check if an address holds specific tokens

### isHolder

```solidity
function isHolder(address user, address token) external returns (bool)
```

Check if a user holds a given ERC-20 or ERC-721 token

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check |
| token | address | The address of the token contract |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the user holds the token, false otherwise |

### isNFTHolder

```solidity
function isNFTHolder(address user, address token, uint256 tokenId) external returns (bool)
```

Check if a user holds a specific ERC-721 or ERC-1155 token ID

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check |
| token | address | The address of the token contract |
| tokenId | uint256 | The ID of the token to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the user holds the token ID, false otherwise |

### isERC1155Holder

```solidity
function isERC1155Holder(address user, uint256[] ids) external returns (bool)
```

Check if a user holds any of the specified ERC-1155 token IDs

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check |
| ids | uint256[] | An array of token IDs to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the user holds any of the token IDs, false otherwise |

### isERC721Holder

```solidity
function isERC721Holder(address user, uint256[] ids) external returns (bool)
```

Check if a user holds any of the specified ERC-721 token IDs

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user to check |
| ids | uint256[] | An array of token IDs to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the user holds any of the token IDs, false otherwise |

