// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/stakingContract.sol";
import "src/OrcaCoin.sol";

contract StakingWithEmissionsTest is Test {
    stakingContract stakingcontract;
    OrcaContract orcaToken;

    function setUp() public{
        orcaToken = new OrcaContract(address(this)); // address doesnt matter
        stakingcontract = new stakingContract(IOrcaCoin(address(orcaToken)));
        orcaToken.updateStakingContract(address(stakingcontract));
    }

    function testStake() public {
        uint value = 10 ether;
        stakingcontract.stake{value: value}(value);

        assert(stakingcontract.totalStake() == value);
    }

    function testFailStake() public {
        uint value = 10 ether;
        stakingcontract.stake(value);
        stakingcontract.unstake(value + 1 ether);

    }

    function testGetRewards() public {
        uint value = 1 ether;
        stakingcontract.stake{value: value}(value);
        vm.warp(block.timestamp + 1);
        uint rewards = stakingcontract.getRewards();

        assert(rewards == 1 ether);
    }

    function testComplexGetRewards() public {
        uint value = 1 ether;
        stakingcontract.stake{value: value}(value);
        vm.warp(block.timestamp + 1);
        console.log(block.timestamp);
        stakingcontract.stake{value: value}(value);
        vm.warp(block.timestamp + 1);
        uint rewards = stakingcontract.getRewards();

        assert(rewards == 3 ether);
    }

    function testRedeemRewards() public {
        uint value = 1 ether;
        stakingcontract.stake{value: value}(value);
        vm.warp(block.timestamp + 1);
        stakingcontract.claimEmissions();
        console.log("balance of");
        console.log(orcaToken.balanceOf(address(this)));

        assert(orcaToken.balanceOf(address(this)) == 1 ether);
    }

   
}