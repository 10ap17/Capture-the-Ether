// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface IGuessTheSecretNumberChallange{
    function guess(uint8)external payable;
}

contract Attack{
    constructor(IGuessTheSecretNumberChallange target)payable{
        bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
        uint8 answer;
        for (uint8 i=0; i<=255; i++) 
        {
            if(keccak256(abi.encodePacked(i))==answerHash){
                answer=i;
                break;
            }
        }
       target.guess{value: msg.value}(answer); 
    }
    receive() external  payable { }
}