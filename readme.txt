The Proxy.sol contract acts as the proxy contract that makes delegate call to Main.sol which implements the logic. 
   State.sol holds the storage and Interact.sol contains of getter and setter functions for the storage. 
   When using the Proxy.sol for the first time, you will need to call the upgradeTo function to set the implementation. 
   The deployed contract already has it set. When you need to upgrade the Main.sol contract, 
   it is mandatory to inherit Main.sol in the upgraded contract and call the upgradeTo function of the Proxy.sol contract.
   

 https://medium.com/quillhash/how-to-write-upgradable-smart-contracts-in-solidity-d8f1b95a0e9a
     

     https://solidity.readthedocs.io/en/v0.5.3/
