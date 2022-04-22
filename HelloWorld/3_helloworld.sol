// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (HelloWorld/2_helloworld.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract 
 * for demonstrating public visibility and bool.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {

    uint256 _amount;

    /// @notice A variable that holds the name
    /// @dev A state variable that holds an string value (name)
    /// This variable doesn't need a getter anymore
    /// @return string
    string public _name;

    bool _active;

    /// @notice The constructor is a function that is called when the contract is first deployed
    /// @dev a constructor to initialize the name variable
    /// @param name the name is a local variable help in the memory
    constructor(string memory name, bool active) {
        _name = name; // local variable
        _active = active; // local variable
    }

   
    function setAmount(uint amount) public {
        _amount = amount; // amount is a local variable
    }

    function getAmount() public view returns(uint256) {
        return _amount;
    }

}