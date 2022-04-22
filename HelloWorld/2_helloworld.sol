// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (HelloWorld/2_helloworld.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract 
 * for demonstrating constructor and str memory.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {

    uint256 _amount; // state variable

    string _name; // state variable

    // The constructor is called when the smart is deployed
    // a constructor to initialize the name variable
    // a string is stored in memory in form of an array
    constructor(string memory name) {
        _name = name; // local variable
    }

    // a getter function for the name variable
    function getName() public view returns(string memory) {
        return _name;
    }

    // a function that sets amount
    // a public function uses more gas than external
    // a public function can be called internally and externally
    function setAmount(uint amount) public {
        _amount = amount; // amount is a local variable
    }

    // return the amount
    // a view function will not modify any state variable
    function getAmount() public view returns(uint256) {
        return _amount;
    }

}