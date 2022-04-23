// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/2_string.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating constructor and str memory.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {
    uint256 _amount;

    /// @notice A variable that holds the name
    /// @dev A state variable that holds an string value (name)
    string _name;

    /// @notice The constructor is a function that is called when the contract is first deployed
    /// @dev a constructor to initialize the name variable
    /// @param name the name is a local variable help in the memory
    constructor(string memory name) {
        _name = name; // local variable
    }

    /// @notice a function that gets a name
    /// @dev a function that gets the state variable name.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return string memory from the state variable that
    function getName() public view returns (string memory) {
        return _name;
    }

    function setAmount(uint256 amount) public {
        _amount = amount; // amount is a local variable
    }

    function getAmount() public view returns (uint256) {
        return _amount;
    }
}
