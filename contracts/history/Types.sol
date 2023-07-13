// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

library HistoryTypes {

    struct Event {
        uint64 timestamp;
        string name;
        string data;
        string externalURI;
    }
}