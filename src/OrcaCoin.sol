// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract OrcaContract is ERC20, Ownable {
  address stakingContract;

  constructor(address _stakingContract) ERC20("Orca", "ORC")  Ownable(msg.sender){
    stakingContract = _stakingContract;
  }

  function  mint( address to,uint amount) public  {
    require(msg.sender == stakingContract);
    _mint(to, amount);
  }

function updateStakingContract(address _stakingContract) public onlyOwner {
    stakingContract = _stakingContract;
  }


 }
