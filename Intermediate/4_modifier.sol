// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Intermediate/4_modifier.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating modifier.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract Modifier {
    /// @notice  A structure that will holds the address of the
    /// owner address, price of the product, title and image
    /// @dev A structure that will hold owner, price, title, image
    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
    }

    address _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "PERMISSION_ERROR");
        _;
    }

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] public _products;

    /// @dev a function that adds a product
    // due to the set modifier, only owner can call the function
    function addProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyOwner {
        _products[_products.length] = Product(owner, price, title, image);
    }

    /// @dev a function that edits a product
    // due to the set modifier, only owner can call the function
    function editProduct(
        uint256 id,
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyOwner {
        _products[id] = Product(owner, price, title, image);
    }
}
