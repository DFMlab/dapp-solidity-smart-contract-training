// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Intermediate/6_1_inheritance.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating inheritance.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract Admin {
    mapping(address => bool) _admins;

    constructor() {
        _admins[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(_admins[msg.sender], "PERMISSION_ERROR");
        _;
    }

    function addAdmin(address _address) public onlyAdmin {
        _admins[_address] = true;
    }

    function removeAdmin(address _address) public onlyAdmin {
        _admins[_address] = false;
    }

    function renounceAdmin() public {
        _admins[msg.sender] = false;
    }
}

contract Inheritance is Admin {
    /// @notice  A structure that will holds the address of the
    /// owner address, price of the product, title and image
    /// @dev A structure that will hold owner, price, title, image
    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
    }

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] public _products;

    function addProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyAdmin {
        _products[_products.length] = Product(owner, price, title, image);
    }

    function editProduct(
        uint256 id,
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyAdmin {
        _products[id] = Product(owner, price, title, image);
    }

}
