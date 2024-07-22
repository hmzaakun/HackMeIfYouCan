pragma solidity 0.7.0;

import "./HackMeIfYouCan.sol";

contract Proxy {
    HackMeIfYouCan HMIYC;

    constructor(address contractAddr) {
        HMIYC = HackMeIfYouCan(payable(contractAddr));
    }
    function addpoint() external {
        HMIYC.addPoint();
    }
}
