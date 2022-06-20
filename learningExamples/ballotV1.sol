pragma solidity ^0.4.0;

contract Ballot {
    /* Voter structure */
    struct Voter {
        uint weight; // Value of the vote
        bool voted;
        uint8 vote;
    }


    /* Proposal struct */
    struct Proposal{
        uint voteCount;
    }

    
    address chairperson;    //  Organizer
    mapping(address => Voter) voters;   // Mapping of partecipants
    Proposal[] proposals;   // Proposals to vote


    /* Contract constructor */
    constructor(uint8 _numProposals) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        proposals.length = _numProposals;
    }


    /* Give authority to voters */
    function register(address toVoter) public {
        if(msg.sender != chairperson || voters[toVoter].voted) //   Only chairman!!
            return;
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }


    /* Give a vote to a proposal */
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender];
        if(sender.voted || toProposal >= proposals.length)
            return;
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }

    function ballotInfo() public constant return (Proposal[] _proposals)


    function winningProposal() public constant returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
            for(uint8 prop = 0; prop < proposals.length; prop++){
                if(proposals[prop].voteCount > winningVoteCount)
                    _winningProposal = prop;    
            }
        return _winningProposal;
    }
}