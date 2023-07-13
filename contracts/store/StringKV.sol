// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./IStringKV.sol";

contract StringKV is Ownable, IStringKV {

    using Counters for Counters.Counter;
    
    Counters.Counter public counter;

    mapping(string => bytes) private store;

    event Remove(string indexed key);
    event Set(string indexed key);

    function get(string calldata key) external view returns (bytes memory) {
        return store[key];
    }

    function remove(string calldata key) external onlyOwner {
        delete store[key];
        counter.decrement();
        emit Remove(key);
    }

    function set(string calldata key, bytes calldata value) external onlyOwner {
        store[key] = value;
        counter.increment();
        emit Set(key);
    }
}
