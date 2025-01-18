// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract stakingContract {
  mapping (address => uint ) balances ;

  function stake() public payable{
    require(msg.value > 0);
    balances[msg.sender]+= msg.value;
  }

  function unstake(uint amount) public {
    require(balances[msg.sender] >= amount);
    balances[msg.sender]-= amount;
    payable(msg.sender).transfer(amount);
  }


 }
