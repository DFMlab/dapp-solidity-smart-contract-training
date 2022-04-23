// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (HelloWorld/6_helloworld.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract
 * for demonstrating mapping.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {
    /// @notice  A variable that holds the balances of each address
    /// @dev A state variable that maps addresses to balance
    mapping(address => uint256) _balances;

    /// @notice a function that sets the balance of an address on blockchain
    /// @dev a function that maps an address to balance.
    /// This is a public function can be called internally and externally
    /// @param amount the value to be set
    /// @param account the address to map to
    function setBalance(uint256 amount, address account) public {
        _balances[account] = amount;
    }

    /// @notice a function that gets the balance of an address from the blockchain
    /// @dev a function that gets the balance of an address
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @param account the address to query
    /// @return uint256 from the state variable that
    function getBalance(address account) public view returns(uint256) {
        return _balances[account];
    }
}
