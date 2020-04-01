# advanced-smart-contract-final-assignment-

# Developed by:
   # Name:Karanjot Singh
  # Student Id: 101195883
   # Course: Advance Smart Contracts
    
    
   # Introduction
     
  This is an assignment for the Advanced Smart Contracts . I have used contract upgradeability and signing and verification patterns.
     
   # Signing and verification
   
  The contract Transcript.sol handles the verification part. The signing part should be implemented off-chain with your own  private       key. To this use Signing.js for that.
   
   
   # Upgradeability
   
   The Proxy.sol contract acts as the proxy contract that makes delegate call to Main.sol which implements the logic. 
   State.sol holds the storage and Interact.sol contains of getter and setter functions for the storage. 
   When using the Proxy.sol for the first time, you will need to call the upgradeTo function to set the implementation. 
   The deployed contract already has it set. When you need to upgrade the Main.sol contract, 
   it is mandatory to inherit Main.sol in the upgraded contract and call the upgradeTo function of the Proxy.sol contract.
   
   # effciency
   The consensus operations are optimized to work eifficiently, even thought the loops are being used.
   It is made sure that loops break as soon as the consensus is reached.
     
   # Refference
     https://medium.com/quillhash/how-to-write-upgradable-smart-contracts-in-solidity-d8f1b95a0e9a
     

     https://solidity.readthedocs.io/en/v0.5.3/
