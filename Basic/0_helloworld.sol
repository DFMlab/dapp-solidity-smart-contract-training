// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/0_helloworld.sol)

/**
 * @title A Simple Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract
 * for demonstrating how solidity works.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

/// @title Hello World contract very similar to classes in C and C++
/// @dev Hello World contract
contract HelloWorld {

    function helloWorld() public pure returns(string memory)  {
        return "hello world";
    }

}
