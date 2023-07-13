// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./AddressKV.sol";
import "./IntegerKV.sol";
import "./StringKV.sol";

contract Store {

    IAddressKV public addressStore;
    IIntegerKV public integerStore;
    IStringKV public stringStore;

    event StoreCreated();

    constructor() {
        addressStore = new AddressKV();
        integerStore = new IntegerKV();
        stringStore = new StringKV();
        emit StoreCreated();
    }
}