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
    Product[] _exclusive;

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] _products;

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] _sales;

    function addProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image,
        uint8 _type
    ) public {
        if (_type == 0) {
            _exclusive.push(Product(owner, price, title, image));
        } else if (_type == 1) {
            _sales.push(Product(owner, price, title, image));
        } else {
            _products.push(Product(owner, price, title, image));
        }
    }

    function getProduct(uint256 id, uint8 _type)
        public
        view
        returns (Product memory)
    {
        if (_type == 0) {
            return _products[id];
        } else if (_type == 1) {
            return _products[id];
        } else {
            return _products[id];
        }
    }
}
