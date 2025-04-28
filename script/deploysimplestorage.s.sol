// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {simplestorage} from "../src/simplestorage.sol";

contract deploysimplestorage is Script {

    function run() external returns (simplestorage){
        vm.startBroadcast();
        simplestorage SimpleStorage = new simplestorage();

        vm.stopBroadcast();
        return SimpleStorage;

    }

}
