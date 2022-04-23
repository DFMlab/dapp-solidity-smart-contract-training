// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/7_struct.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating struct.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract Struct {
    /// @notice  A structure that will holds the address of the
    /// owner address, price of the product, title and image
    /// @dev A structure that will hold owner, price, title, image
    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
    }

    /// @notice A variable that holds a single product
    /// @dev A variable that holds a single product
    Product _product =
        Product(
            0x0000000000000000000000000000000000000000,
            10,
            "simple product",
            "https://product.example.com"
        );

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] _products;

    function setProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public {
        // _products[_products.length] = Product(owner, price, title, image);
        _products[_products.length].owner = owner;
        _products[_products.length].price = price;
        _products[_products.length].title = title;
        _products[_products.length].image = image;
    }

    function getProduct() public view returns (Product memory) {
        return _product;
    }
}
