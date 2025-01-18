// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract stakingContract {
  mapping (address => uint ) balances ;
  uint public totalbalance;

  function stake() public payable{
    require(msg.value > 0);
    balances[msg.sender]+= msg.value;
    totalbalance+=msg.value;
  }

      // function unstake(uint _amount) public  {
      //     require(_amount <= balances[msg.sender]);
      //   //  payable(msg.sender).transfer(_amount);
      //     balances[msg.sender] -= _amount;
      //     totalbalance-=_amount;
      // }

    function unstake(uint _amount) public payable {
        require(_amount > 0);
        require(balances[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount);
        totalbalance -= _amount;
        balances[msg.sender] -= _amount;
    }

  function totalBalance() public view returns(uint) {
    return totalbalance ;
  }

  function balanceOf(address _address) public view returns (uint) {
    return balances[_address];
}


 }
