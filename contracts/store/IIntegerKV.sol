// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IIntegerKV {
    function get(uint256 key) external view returns (bytes memory);
    function remove(uint256 key) external;
    function set(uint256 key, bytes calldata value) external;
}