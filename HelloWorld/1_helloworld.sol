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

    /// @notice A variable that holds the amount
    /// @dev A state variable that holds an integer value (amount)
    uint256 _amount; // state variable

    /// @notice a function that sets the amount on blockchain
    /// @dev a function that sets the state variable amount.
    /// This is a public function can be called internally and externally
    /// @param amount the value to be set
    function setAmount(uint amount) public {
        _amount = amount; // amount is a local variable
    }

    /// @notice a function that gets the amount stored on the blockchain
    /// @dev a function that gets the state variable amount.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint256 from the state variable that
    function getAmount() public view returns(uint256) {
        return _amount;
    }

}