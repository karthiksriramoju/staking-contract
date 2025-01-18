// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/stakingContract.sol"; // Ensure this path is correct


contract TestStakingContract is Test{
  stakingContract c;

  function setUp() public{
    c = new stakingContract();
  }

  function testStake() public{
    c.stake{value:100}();
    assert(c.totalBalance()==100);
  }

  function testFailStake() public {
    c.stake();
    assert(c.totalBalance()==0);
  }

    // function testunstate() public {
    //     c.stake{value: 200}();
    //    c.unstake(100);
    //    assert(c.balanceOf(address(this)) == 100);
    // }

    function testUnstake() public {
         vm.startPrank(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f);
         vm.deal(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f, 10 ether);
        console.log(address(this));
        console.log(address(c));
        c.stake{value: 10 ether}();
        c.unstake(10 ether);

        assert(c.totalBalance() == 0);
    }






}