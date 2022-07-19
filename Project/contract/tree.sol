// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract TreeProject {

    struct Tree {
        uint256 id;
        uint256 price;
        address payable owner;
        string image;
    }

    mapping(uint256 => Tree) public _trees;

    uint256 public _treeCount;

    function addTree(uint256 price, string memory image) external {
        _trees[_treeCount].id = _treeCount;
        _trees[_treeCount].price = price;
        _trees[_treeCount].owner = payable(msg.sender);
        _trees[_treeCount].image = image;
        _treeCount++;
    }

    function buyTree(uint256 id) external payable {
        require(msg.value == _trees[id].price, "invalid amount");
        _trees[id].owner.transfer(msg.value);
        _trees[id].owner = payable(msg.sender);
        _trees[id].price +=  _trees[id].price / 5; 
    }

}