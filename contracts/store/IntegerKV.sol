// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./IIntegerKV.sol";

contract IntegerKV is Ownable, IIntegerKV {

    using Counters for Counters.Counter;
    
    Counters.Counter public counter;

    mapping(uint256 => bytes) private store;

    event Remove(uint256 indexed key);
    event Set(uint256 indexed key);

    function get(uint256 key) external view returns (bytes memory) {
        return store[key];
    }

    function remove(uint256 key) external onlyOwner {
        delete store[key];
        counter.decrement();
        emit Remove(key);
    }

    function set(uint256 key, bytes calldata value) external onlyOwner {
        store[key] = value;
        counter.increment();
        emit Set(key);
    }
}
