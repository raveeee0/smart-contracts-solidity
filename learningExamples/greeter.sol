// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Greeter {
    /* Holds your name */
    string public yourName;

    /* Execution entry point - Initialization */
    constructor() public {
        yourName = "World";
    }

    /* yourName setter */
    function set(string name) public {
        yourName = name;
    }

    function hello() constant public returns (string) {
        return yourName;
    }

}