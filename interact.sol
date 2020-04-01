pragma solidity ^0.5.0;

import "./state.sol";

contract Interact is State {
    
    event collegeAdded(uint id, address addr, uint timestamp);
    event transcriptAdded(uint id, uint collegeId, bytes32 transcriptHash, uint timestamp);
    
    modifier collegeExistornot(uint _id) {
        require(colleges[_id].addr != address(0), "college does not exist" );
        _;
    }
    
    modifier TranscriptExistornot (uint _id) {
        require(transcripts[_id].transcriptHash != bytes32(0), "transcript does not exist" );
        _;
    }
    
    modifier iscollegeIdValid(uint _id) {
        require(colleges[_id].addr == address(0), "college id invalid");
        _;
    }
    
    modifier isTranscriptIdValid(uint _id) {
        require(transcripts[_id].transcriptHash == bytes32(0), "transcript id invalid");
        _;
    }
    
    modifier onlycollege(uint id) {
        require(tx.origin == colleges[id].addr, "You are not the college");
        _;
    }
    
    function getcollegeById(uint _id) public collegeExistornot(_id) view returns(address, uint){
        college memory i = colleges[_id];
        return (i.addr, i.timestamp);
    }
    
    function getTranscriptById(uint _id) public TranscriptExistornot(_id) view returns (uint ,bytes32, uint8, bytes32, bytes32, uint){
        Transcript memory t = transcripts[_id];
        return (t.collegeId ,t.transcriptHash, t.v, t.r, t.s, t.timestamp);
    }
    
    function addcollege(uint _id) public iscollegeIdValid(_id) {
        college memory i = college(tx.origin, now);
        colleges[_id] = i;
        emit collegeAdded(_id, colleges[_id].addr, colleges[_id].timestamp);
    }
    
    function addTranscript(uint _id, uint _collegeId, bytes32 transcriptHash, uint8 v, bytes32 r, bytes32 s) public collegeExistornot(_collegeId) onlycollege(_collegeId) isTranscriptIdValid(_id) {
        Transcript memory t = Transcript(_collegeId, transcriptHash, v, r, s, now);
        transcripts[_id] = t;
        emit transcriptAdded(_id, transcripts[_id].collegeId, transcripts[_id].transcriptHash, transcripts[_id].timestamp);
    }
}