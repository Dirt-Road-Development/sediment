// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IAddressKV {
    function get(address key) external view returns (bytes memory);
    function remove(address key) external;
    function set(address key, bytes calldata value) external;
}