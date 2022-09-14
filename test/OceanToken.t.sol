// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/OceanToken.sol";

contract CounterTest is Test {
    OceanToken public oceanToken;

    address bob = address(0x1);
    address alice = address(0x2);

    function setUp() public {
        oceanToken = new OceanToken(100000000, 50);
    }

    function testBalanceOfOwner() public {
        assertEq(oceanToken.balanceOf(oceanToken.owner()), 70000000 * 1e18);
    }

    function testTransferFunction() public {
        oceanToken.transfer(bob, 1000000);
        assertEq(oceanToken.balanceOf(bob), 1000000);
        vm.startPrank(bob);
        oceanToken.transfer(alice, 100);
        vm.stopPrank();
        assertEq(oceanToken.balanceOf(alice), 100);
        assertEq(oceanToken.balanceOf(bob), 1000000 - 100);
    }
}
