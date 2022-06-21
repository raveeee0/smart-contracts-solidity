// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Bidder {

    /* Fields */
    string public name;
    uint public bidAmount;
    bool public eligible;
    uint constant minBid = 1000;

    /* name setter */
    function setName(string nm) public {
        name = nm;
    }

    /* bidAmount setter */
    function setBidAmount(uint x) public {
        bidAmount = x;
    }

    /* Check eligibility */
    function determinaEligibility() public {
        if(bidAmount >= minBid)
            eligible = true;
        else
            eligible = false;
    }
}