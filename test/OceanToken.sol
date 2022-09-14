// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OceanToken.sol";

contract CounterTest is Test {
    OceanToken public oceanToken;

    function setUp() public {
        oceanToken = new OceanToken(100000000, 50);
    }
}
