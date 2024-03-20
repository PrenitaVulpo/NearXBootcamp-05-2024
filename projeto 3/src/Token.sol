// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Token {
    uint8 number;

    function setNumber(uint8 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint8) {
        return number;
    }

    function increment() public {
        number++;
    }
}
