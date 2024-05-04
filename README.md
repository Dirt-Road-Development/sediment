# Sediment

Sediment is a set of smart-contracts designed to abstract on-chain data storage through a number of basic unopinionated flows.

## Installation

To add to your project, run:

```shell
npm add @dirtroad/sediment
```

Then important according to each of the modules:

### Modules

#### Authority

Add AccessControl from OpenZeppelin to your contract with some pre-defined roles for authority.

```solidity
import "@dirtroad/sediment/contracts/authority/Authority.sol";
```

#### Leaderboards

Sediment offers three (3) leaderboard options for developers to use:

##### Default Leaderboard 
This leaderboard uses Ethereum addresses as the primary identifier.

```solidity
import "@dirtroad/sediment/contracts/leaderboard/Leaderboard.sol";
```

##### String Leaderboard
This leaderboard uses strings as the primary identifier. This is a great option for using UUID's or other string based ID's from a server.

```solidity
import "@dirtroad/sediment/contracts/leaderboard/StringLeaderboard.sol";
```

##### Bytes Leaderboard
This leaderboard uses bytes32 as the primary identifier.

```solidity
import "@dirtroad/sediment/contracts/leaderboard/BytesLeaderboard.sol";
```

#### Logger

A simple logging smart contract that allows you to add more traditional log types
to your contract to help identify specific issues or information.

Automatically hashes the value with the timestamp to ensure Unique Identifiers are created for each log.

```solidity
import "@dirtroad/sediment/contracts/logger/Logger.sol";
```

#### Rate Limit

There are two rate limit contracts offered in Sediment.
The first is a basic rate limit that helps ensure that transactions 
on a specific function are limited. This is great for chains that have low or zero gas fees.

```solidity
import "@dirtroad/sediment/contracts/rateLimit/RateLimit.sol";
```

#### Bot Protection

The second rate limit contract offered by Sediment is geared more towards
mitigation against bots. Great for protecting public functions that write state
to chain or offer minting; this has configurable limit times coupled with a strike system in addition
to an optional blacklist for addresses.

```solidity
import "@dirtroad/sediment/contracts/rateLimit/BotProtection.sol";
```

#### Token Checker

While not a silver bullet; this contract will help identify most tokens by type allowing
for dynamic usage of addresses within a Solidity function. This is used internally within
the TokenGate contracts, but can be used externally as well.

```solidity
import "@dirtroad/sediment/contracts/tokenChecker/TokenChecker.sol";
```

#### Chain Level Token Gating

The TokenGate contract was designed to be deployed once at the chain level and used by
any dApp to do high-level token gating.

```solidity
import "@dirtroad/sediment/contracts/tokenGate/TokenGate.sol";
```

#### Project Level Token Gating

The project level token gates are designed per standard token.
With an ERC-20, ERC-721, and ERC-1155 token gate available; these can be
deployed with a project to offer specific token gating with slightly more direct 
features.

```solidity
/// For ERC-20
import "@dirtroad/sediment/contracts/tokenGate/ERC20.sol";

/// For ERC-721
import "@dirtroad/sediment/contracts/tokenGate/ERC721.sol";

/// For ERC-1155
import "@dirtroad/sediment/contracts/tokenGate/ERC1155.sol";
```

### Security and Liability

The Sediment contracts and code is WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

### License

See [MIT License](./LICENSE).