// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IStringKV {
    function get(string calldata key) external view returns (bytes memory);
    function remove(string calldata key) external;
    function set(string calldata key, bytes calldata value) external;
}