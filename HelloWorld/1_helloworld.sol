// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (HelloWorld/1_helloworld.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract 
 * for demonstrating set and get function.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {

    uint256 _amount; // state variable

    // a function that sets amount
    // a public function uses more gas than external
    // a public function can be called internally and externally
    function setAmount(uint amount) public {
        _amount = amount; // amount is a local variable
    }

    function getAmount() public view returns(uint256) {
        return _amount;
    }

}