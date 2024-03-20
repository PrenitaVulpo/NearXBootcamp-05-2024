// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Flipper {
    bool value;

    constructor() {
        value = true;
        getValue();
    }

    function getValue() public returns (bool) {
        return value;
    }

    function flip() external returns (bool) {
        value = !value;
    }
}
