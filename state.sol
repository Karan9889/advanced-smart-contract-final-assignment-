pragma solidity ^0.5.0;

contract State {
    
    address owner;
    address public implementation;
    
    struct college{
        address addr;
        uint timestamp;
    }
    struct Transcript{
        uint collegeId;
        bytes32 transcriptHash;
        uint8 v;
        bytes32 r;
        bytes32 s;
        uint timestamp; 
    }
    
    mapping(uint => college) colleges;
    mapping(uint => Transcript) transcripts;
}