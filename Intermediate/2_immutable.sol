// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Intermediate/2_immutable.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating immutability.
 * @author Decentralized Future in Motion Lab Limited
 */
pragma solidity ^0.8.3;

contract Visibiility {
    error InsufficientContribution();

    error UnauthorizedAccess(string message);

    struct Contribution {
        address acount;
        uint256 amount;
        uint256 timestamp;
    }

    /// @dev A constant variable can be initialized only once
    address payable public immutable owner;

    /// @dev A constant variable can be initialized only once
    uint256 public immutable _minimumDonation;

    /// @dev A constant variable can be initialized only once
    uint256 public immutable _maximumDonation;

    address private _topDonor;

    uint256 public largestDonation;

    constructor(uint256 minimumDonation, uint256 maximumDonation) {
        owner = payable(msg.sender);
        _minimumDonation = minimumDonation;
        _maximumDonation = maximumDonation;
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
        require(msg.value >= _minimumDonation, "INSUFFICIENT_CONTRIBUTION");
        require(msg.value <= _maximumDonation, "EXCEED_CONTRIBUTION_LIMIT");

        Contribution memory contribution = Contribution(
            msg.sender,
            msg.value,
            block.timestamp
        );
        _contributions.push(contribution);

        if (msg.value >= largestDonation) {
            _setTopDonor(msg.sender);
        }

        _safeCheck();
    }

    function _safeCheck() private view {
        assert(address(this).balance > 0);
    }

    function _setTopDonor(address topDonor) internal {
        _topDonor = topDonor;
    }

    function withdraw(uint256 amount) public payable {
        require(
            msg.sender == address(owner),
            "only owner can call this function"
        );

        owner.transfer(amount);
    }
}
