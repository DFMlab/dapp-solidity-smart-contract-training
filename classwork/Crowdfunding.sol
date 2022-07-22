// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Crowdfunding {

    mapping(address => bool) admins;

    uint256 balance;

    constructor() {
        admins[msg.sender] = true;
    }

    receive() external payable {
        deposit();
    }


    modifier isAdmin() {
        require(admins[msg.sender], "not an admin");
        _;
    }

    function withdraw(uint256 amount) external payable isAdmin {
        payable(msg.sender).transfer(amount);
        balance -= msg.value;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function addAdmin(address admin) external isAdmin {
        admins[admin] = true;
    }

    function removeAdmin(address admin) external isAdmin {
        require(admin != msg.sender, "cannot remove self");
        admins[admin] = false;
    }

    function transferAdmin(address admin) external isAdmin {
        require(address(0) != admin, "cannot make zeo address an admin");
        admins[admin] = true;
        admins[msg.sender] = false;
     }


}
