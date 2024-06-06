# Solidity API

## IERC165

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

## TokenChecker

A contract to check if a given contract address implements the ERC-20, ERC-721, or ERC-1155 token standard

### isERC20

```solidity
function isERC20(address tokenAddress) public pure returns (bool)
```

Check if the given contract address is an ERC-20 token contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenAddress | address | The address of the token contract to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the contract is an ERC-20 token, false otherwise |

### isERC721

```solidity
function isERC721(address tokenAddress) public view returns (bool)
```

Check if the given contract address is an ERC-721 token contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenAddress | address | The address of the token contract to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the contract is an ERC-721 token, false otherwise |

### isERC1155

```solidity
function isERC1155(address tokenAddress) public view returns (bool)
```

Check if the given contract address is an ERC-1155 token contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenAddress | address | The address of the token contract to check |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | bool True if the contract is an ERC-1155 token, false otherwise |

