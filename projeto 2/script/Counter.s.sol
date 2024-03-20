// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    Counter counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(
            0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
        );

        // deploy do contrato
        counter = new Counter();

        console2.log("ADDRESS: ", address(counter));
        // 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

        // chamar o contrato (getNumber)
        console2.log(counter.getNumber());

        // chamar o contrato (incremento)
        counter.increment();

        // chamar o contrato (getNumber)
        console2.log(counter.getNumber());

        vm.stopBroadcast();
    }
}
