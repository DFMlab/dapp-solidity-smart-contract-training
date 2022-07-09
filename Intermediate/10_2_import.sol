// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (Intermediate/10_2_import.sol)

/**
 * @title A Simple Solidity Smart Contract
 * @dev A Simple Solidity Smart Contract
 * for demonstrating import.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;


import "./10_1_import.sol";

abstract contract Admin {
    mapping(address => bool) _admins;

    constructor(address _address) {
        _admins[_address] = true;
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

    function renounceAdmin() public virtual {
        _admins[msg.sender] = false;
    }
}

contract Inheritance is Admin {

    using Math for uint256;

    /// @notice  A structure that will holds the address of the
    /// owner address, price of the product, title and image
    /// @dev A structure that will hold owner, price, title, image
    struct Product {
        address owner;
        uint256 price;
        string title;
        string image;
    }

    uint256 constant _tax = 10;

    /// @notice A variable that holds multiple products
    /// @dev A variable that holds an array of products
    Product[] public _products;

    constructor(address _address) Admin(_address) {}

    function addProduct(
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyAdmin {
        uint256 tax = price.div(_tax);

        uint256 actualPrice = price.add(tax);

        _products[_products.length] = Product(owner, actualPrice, title, image);
    }

    function editProduct(
        uint256 id,
        address owner,
        uint256 price,
        string memory title,
        string memory image
    ) public onlyAdmin {
        uint256 tax = price.div(_tax);

        uint256 actualPrice = price.add(tax);

        _products[id] = Product(owner, actualPrice, title, image);
    }

    function renounceAdmin() public pure override {
        revert("RENOUNCE_ERROR");
    }
}
