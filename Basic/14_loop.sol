// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Basic/14_loop.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating loop.
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
    Product[] public _products;

    function addProduct(
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

    /// @notice function that adds a products to the
    /// products variable using for loop
    /// @dev function that adds a products
    function addProducts(
        address[] memory owners,
        uint256[] memory prices,
        string[] memory titles,
        string[] memory images,
        uint8[] memory statuses
    ) public {
        uint256 ownerLength = owners.length;

        require(ownerLength > 0, "ZERO_LENGTH_ERROR");

        require(
            ownerLength == prices.length &&
                ownerLength == titles.length &&
                ownerLength == images.length &&
                ownerLength == statuses.length,
            "LENGTH_MISMATCH"
        );

        for (uint24 i = 0; i < ownerLength; i++) {
            addProduct(owners[i], prices[i], titles[i], images[i], statuses[i]);
        }
    }

    /// @notice function that adds a products to the
    /// products variable using while loop
    /// @dev function that adds a products    
    // function addProducts(
    //     address[] memory owners,
    //     uint256[] memory prices,
    //     string[] memory titles,
    //     string[] memory images,
    //     uint8[] memory statuses
    // ) public {
    //     uint256 ownerLength = owners.length;

    //     require(ownerLength > 0, "ZERO_LENGTH_ERROR");

    //     require(
    //         ownerLength == prices.length &&
    //             ownerLength == titles.length &&
    //             ownerLength == images.length &&
    //             ownerLength == statuses.length,
    //         "LENGTH_MISMATCH"
    //     );

    //     uint256 i = 0;

    //     while (i < ownerLength) {
    //         addProduct(owners[i], prices[i], titles[i], images[i], statuses[i]);
    //         i++;
    //     }
    // }
}
