// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Intermediate/10_1_import.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating import.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

library Math {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "ZERO_DIVISION_ERROR");
        return a / b;
    }
}
