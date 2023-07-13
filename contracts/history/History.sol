// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Types.sol";

error InvalidRange();

contract History is Ownable {

    using Counters for Counters.Counter;

    Counters.Counter public eventCounter;

    mapping(uint256 => HistoryTypes.Event) public events;

    event Add(uint256 indexed eventIndex);
    
    function add(string calldata name, string calldata data, string calldata externalURI) external onlyOwner {
        events[eventCounter.current()] = HistoryTypes.Event(
            uint64(block.timestamp),
            name,
            data,
            externalURI
        );

        emit Add(eventCounter.current());

        eventCounter.increment();
    }

    function getRange(uint256 start, uint256 end) external view returns (HistoryTypes.Event[] memory) {

        if (end < start) revert InvalidRange();

        HistoryTypes.Event[] memory requestedEvents = new HistoryTypes.Event[](end - start);

        for (uint256 i = 0; i <= end - start; i++) {
            requestedEvents[i] = events[start + i];
        }

        return requestedEvents;
    }

    function getLatest() external view returns (HistoryTypes.Event memory) {
        return events[eventCounter.current()];
    }
}