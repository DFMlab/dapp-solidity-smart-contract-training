// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MarketPlace {

    struct Product {
        string name;
        address payable owner;
        uint256 price;
        string image;
    }

    mapping(uint256 => Product) public products;

    mapping(address => uint256) public balance;

    uint256 public productsCount;

    receive() external payable {}

    function addProduct(
        string memory name,
        uint256 price,
        string memory image
    ) public {
        products[productsCount++] = Product(
            name,
            payable(msg.sender),
            price,
            image
        );

    }

    function buyProduct(uint256 id) public payable {
        require(msg.value == products[id].price);
        address owner = products[id].owner;
        balance[owner] += msg.value;
        products[id].owner = payable(msg.sender);
    }


    function withdraw() public payable {
        address payable account = payable(msg.sender);
        uint256 amount = balance[msg.sender];
        balance[msg.sender] = 0;
        account.transfer(amount);
    }


}
