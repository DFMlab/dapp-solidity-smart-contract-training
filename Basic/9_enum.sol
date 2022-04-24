// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/9_enum.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating struct.
 * @author Decentralized Future in Motion Lab Limited
 */
pragma solidity ^0.8.3;

contract Enum {
    enum ProductStatus {
        IN_STOCK,
        OUT_OF_STOCK,
        BACK_ORDER
    }

    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
        ProductStatus status;
    }

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] _products;

    function setProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image,
        uint8 status
    ) public {
        _products.push(
            Product(owner, price, title, image, ProductStatus(status))
        );
    }

    function getProduct(uint256 id) public view returns (Product memory) {
        return _products[id];
    }
}
