// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/13_require.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating require.
 * @author Decentralized Future in Motion Lab Limited
 */
pragma solidity ^0.8.3;

contract Revert {
    error InsufficientContribution();

    error UnauthorizedAccess(string message);

    struct Contribution {
        address acount;
        uint256 amount;
        uint256 timestamp;
    }

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    Contribution[] _contributions;

    /// @notice a function that adds a contribution to the crowfunding contract
    /// minimum amount to be sent is 1000 wei or else the contract will fail
    /// and refund the remaining gas
    /// the donate function also assert if the balance is zero after calling the function
    /// @dev a function that adds a contribution to the state variable contributions.
    /// This is a public function can be called internally and externally.
    // a payable function will require certain amount of wei (fraction of a coin) to be sent with it
    // a 10^18 wei == 1 ether
    function donate() public payable {
        
        require(msg.value > 1000, "INSUFFICIENT_CONTRIBUTION");

        Contribution memory contribution = Contribution(
            msg.sender,
            msg.value,
            block.timestamp
        );
        _contributions.push(contribution);

        assert(address(this).balance > 0);
    }

    function withdraw(uint256 amount) public payable {

        require(msg.sender == address(owner), "only owner can call this function");

        owner.transfer(amount);
    }
}
