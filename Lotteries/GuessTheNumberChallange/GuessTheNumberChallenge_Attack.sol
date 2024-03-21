// SPDX-License-Identifier: MIT

pragma solidity^0.8.4;

interface IGuessTheNumberChallange{
    function guess(uint8)external payable;
}

contract Attack{
    constructor (IGuessTheNumberChallange target)payable{
        target.guess{value: msg.value}(42);
    }
    receive() external payable { }
}
