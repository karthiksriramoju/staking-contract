// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/OrcaCoin.sol"; // Ensure this path is correct

contract TestContract is Test {
    OrcaContract c;

    function setUp() public {
        // Deploy the OrcaContract
        c = new OrcaContract(0x3bA161808C90b334C5a0c45c846f402dcd32338D);
    }

    function testTotalSupply() view public{
        assert(c.totalSupply()==0);
    }

    function testMint() public{
        vm.startPrank(0x3bA161808C90b334C5a0c45c846f402dcd32338D);
        c.mint(5, 0x5d81d157315ed00116098Bee609AcD49ac27D73F);
        assert(c.totalSupply()==5);
    }

    function testFailMinting() public {
        c.mint(5, 0x5d81d157315ed00116098Bee609AcD49ac27D73F);
        assert(c.totalSupply()==5);
    }

    function testUpdateStakingContract() public {
        c.updateStakingContract(0x5d81d157315ed00116098Bee609AcD49ac27D73F);
        vm.startPrank(0x5d81d157315ed00116098Bee609AcD49ac27D73F);
        c.mint(5, 0x3bA161808C90b334C5a0c45c846f402dcd32338D);
        assert(c.totalSupply()==5);
    }

    function testFailStakingContract() public {
        vm.startPrank(0x5d81d157315ed00116098Bee609AcD49ac27D73F);
        c.updateStakingContract(0x5d81d157315ed00116098Bee609AcD49ac27D73F);
    }

}
