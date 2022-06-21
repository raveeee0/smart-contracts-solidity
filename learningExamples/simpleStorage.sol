// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract integerStorage {
    /* Integer data */
    uint private storedData; // Always initialized to 0


    /* storedData setter */
    function set(uint x) public{
        storedData = x;
    }


    /* storedData getter */
    function get() constant public returns (uint){
        return storedData;
    } 


    /* Increment storedData */
    function increment(uint n) public {
        storedData = storedData + n;
    }


    /* Decrement storedData */
    function decrement(uint n) public {
        storedData = storedData - n;
    }
}