// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    address public owner;
    bool public votingOpen;
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    constructor(string[] memory candidateNames) {
        owner = msg.sender;
        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({ name: candidateNames[i], voteCount: 0 }));
        }
        votingOpen = true;
    }

    function vote(uint256 candidateIndex) public {
        require(votingOpen, "Voting is closed");
        require(!hasVoted[msg.sender], "You already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");

        candidates[candidateIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    function endVoting() public {
        require(msg.sender == owner, "Only owner can end voting");
        votingOpen = false;
    }
}
