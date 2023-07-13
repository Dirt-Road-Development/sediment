// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./IAddressKV.sol";

contract AddressKV is Ownable, IAddressKV {

    using Counters for Counters.Counter;
    
    Counters.Counter public counter;

    mapping(address => bytes) private store;

    event Remove(address indexed key);
    event Set(address indexed key);

    function get(address key) external view returns (bytes memory) {
        return store[key];
    }

    function remove(address key) external onlyOwner {
        delete store[key];
        counter.decrement();
        emit Remove(key);
    }

    function set(address key, bytes calldata value) external onlyOwner {
        store[key] = value;
        counter.increment();
        emit Set(key);
    }
}
