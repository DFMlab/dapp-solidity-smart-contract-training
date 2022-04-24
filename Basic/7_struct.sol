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

    function addProduct(
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

    /// @notice a function that gets the product variable from the blocktime
    /// @dev a function that gets the state variable product.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return Product the product structure
    function getProduct() public view returns (Product memory) {
        return _product;
    }

    /// @notice a function that gets a product by id from the blocktime
    /// @dev a function that gets a product by id.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @param id the id of the product
    /// @return Product the product structure
    function getProduct(uint256 id) public view returns (Product memory) {
        return _products[id];
    }
}
