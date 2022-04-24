// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/10_payable.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating payable.
 * @author Decentralized Future in Motion Lab Limited
 */
pragma solidity ^0.8.3;

contract Payable {
    /// @notice  A structure that will holds the amount and time people donated
    /// to the contract. This is similar to crowdfunding.
    /// @dev A structure that will hold account, amount, timestamp, image
    struct Contribution {
        address acount;
        uint256 amount;
        uint256 timestamp;
    }

    /// @notice A variable that holds the address of the owner
    /// @dev A variable that holds the address of the owner
    address payable owner;

    /// @notice The constructor is a function that is called when the contract is first deployed
    /// and it will set the state variable owner to the address that deployed the contract
    /// @dev a constructor to initialize the name variable
    constructor() {
        owner = payable(msg.sender);
    }

    /// @notice A variable that holds multiple contributions
    /// @dev A variable that holds an array of contributions
    Contribution[] _contributions;

    /// @notice a function that adds a contribution to the crowfunding contract
    /// @dev a function that adds a contribution to the state variable contributions.
    /// This is a public function can be called internally and externally.
    // a payable function will require certain amount of wei (fraction of a coin) to be sent with it
    // a 10^18 wei == 1 ether
    function donate() public payable {
        Contribution memory contribution = Contribution(
            msg.sender,
            msg.value,
            block.timestamp
        );
        _contributions.push(contribution);
    }

    /// @notice a function that withdraws wei from the crowfunding contract
    /// @dev a function that transfers wei to the owner address
    /// This is a public function can be called internally and externally.
    // a payable function will require certain amount of wei to be sent with it
    function withdraw(uint256 amount) public payable {
        owner.transfer(amount);
    }
}
