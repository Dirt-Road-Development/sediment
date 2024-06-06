# Solidity API

## Authority

A contract that defines various roles for access control

_This contract inherits from the OpenZeppelin AccessControl contract_

### BLACKLIST_ROLE

```solidity
bytes32 BLACKLIST_ROLE
```

Role for contracts that need to blacklist users

### CONTRACT_ROLE

```solidity
bytes32 CONTRACT_ROLE
```

Role for contracts to call other contracts

### CREATOR_ROLE

```solidity
bytes32 CREATOR_ROLE
```

Role for creators of new assets in NFT-based contracts

### MANAGER_ROLE

```solidity
bytes32 MANAGER_ROLE
```

Role for key manual management of smart contracts

### MINTER_ROLE

```solidity
bytes32 MINTER_ROLE
```

Role for token-based contracts that have a growing supply

### SERVER_ROLE

```solidity
bytes32 SERVER_ROLE
```

Role for contracts that have server's managing functions

### WHITELIST_ROLE

```solidity
bytes32 WHITELIST_ROLE
```

Role for contracts that need to whitelist users

### constructor

```solidity
constructor() public
```

Constructor that grants all defined roles to the deployer

