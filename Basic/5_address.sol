// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/5_address.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating global variable, address and payable address.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract Address {
    /// @notice A variable that holds the owner address
    /// @dev A state variable that holds an string address (address)
    /// This address can not receive ether
    /// This variable doesn't need a getter anymore
    /// @return string
    address public _owner;

    /// @notice A variable that holds the account address
    /// @dev A state variable that holds an account address (address)
    /// This address can receive ether
    /// This variable doesn't need a getter anymore
    /// @return string
    address payable public _account;

    /// @notice The constructor is a function that is called when the contract is first deployed
    /// @dev a constructor to initialize the owner and account variable
    /// This function uses a global variable named msg.sender and block.timestamp
    constructor() {
        _owner = msg.sender;
        _account = payable(msg.sender);
    }

    /// @notice a function that gets the current blocktime
    /// @dev a function that gets the current block timestamp.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint256 from the current block.timestamp
    function getTime() public view returns (uint256) {
        return block.timestamp;
    }
} 
