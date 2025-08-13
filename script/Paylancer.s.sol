// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Paylancer} from "../src/Paylancer.sol";

contract PaylancerScript is Script {
    function setUp() public {}

    function run() public returns (Paylancer) {
        vm.startBroadcast();
        Paylancer paylancer = new Paylancer();
        vm.stopBroadcast();
        return paylancer;
    }
}
