# Solidity API

## RateLimit

### cooldown

```solidity
uint64 cooldown
```

### limits

```solidity
mapping(address => uint64) limits
```

### checkLimit

```solidity
modifier checkLimit(address user)
```

### constructor

```solidity
constructor(uint256 _cooldownInSeconds) public
```

