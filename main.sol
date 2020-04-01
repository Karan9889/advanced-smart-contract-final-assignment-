pragma solidity ^0.5.0;

import "./transcript.sol";
import "./state.sol";
import "./interact.sol";

contract Main is State, Transcript, Interact{
    
    
    uint lastcollegeId = 0;
    uint lastTranscriptId = 0;
    uint lastUpgradeId = 0;
    
    mapping(uint => address) upgrades;
    
    modifier onlyOwner() {
        require(tx.origin == owner);
        _;
    }
    
    function registerInstitute() public {
        uint id = ++lastcollegeId;
        addcollege(id);
    }
    
    function addTranscript(uint collegeId, bytes32 transcriptHash, uint8 v, bytes32 r, bytes32 s) public {
        uint id = ++lastTranscriptId;
        addTranscript(id, collegeId, transcriptHash, v, r, s);
    }
    
    function isTranscriptAuthentic(string memory transcriptHash, address signer, uint8 v, bytes32 r, bytes32 s) public pure returns(bool){
        
        address sig = verifyTranscript(transcriptHash, v, r, s);
        
        if(sig == signer)
            return true;
        else return false;
    }
    
}