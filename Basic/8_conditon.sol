// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/8_condition.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating struct.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract Condition {
    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
    }

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    mapping(uint256 => Product) _exclusive;

    /// @notice Number of products in exclusive
    /// @dev A variable that holds the number of products in exclusive
    uint256 _exclusiveCount = 0;

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    mapping(uint256 => Product) _products;

    /// @notice Number of products in product variable
    /// @dev A variable that holds the number of products in exclusive
    uint256 _productsCount = 0;

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    mapping(uint256 => Product) _sales;

    /// @notice Number of products in exclusive
    /// @dev A variable that holds the number of products in exclusive
    uint256 _salesCount = 0;

    function addProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image,
        uint8 _type
    ) public {
        if (_type == 0) {
            _exclusive[_exclusiveCount] = Product(owner, price, title, image);
            _exclusiveCount++;
        } else if (_type == 1) {
            _sales[_salesCount] = Product(owner, price, title, image);
            _salesCount++;
        } else {
            _products[_productsCount] = Product(owner, price, title, image);
            _productsCount++;
        }
    }

    function getProduct(uint256 id, uint8 _type)
        public
        view
        returns (Product memory)
    {
        if (_type == 0) {
            return _exclusive[id];
        } else if (_type == 1) {
            return _sales[id];
        } else {
            return _products[id];
        }
    }
}
