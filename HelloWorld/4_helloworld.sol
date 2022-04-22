// SPDX-License-Identifier: GPL-3.0-only
// Decentralized Future in Motion Limited Training Contracts v0.0.1 (HelloWorld/4_helloworld.sol)

/**
 * @title Hello World Solidity Smart Contract
 * @dev A Simple Hello World Solidity Smart Contract
 * for demonstrating array and overloading.
 * @author Decentralized Future in Motion Lab Limited
 */

pragma solidity ^0.8.3;

contract HelloWorld {
    /// @notice A variable that holds the ids
    /// @dev A state variable that holds an array of uint8 values (ids)
    /// this is a variable length array
    uint8[] _ids;

    /// @notice A variable that holds the oids
    /// @dev A state variable that holds an array of uint8 values (oids)
    /// this is a variable length array
    uint8[2] _oids;

    /// @notice a function that sets the ids on blockchain
    /// @dev a function that sets the state variable ids.
    /// This is a public function can be called internally and externally
    /// @param ids the values to be set
    function setIds(uint8[] memory ids) public {
        _ids = ids;
    }

    /// @notice a function that sets the ids on blockchain
    /// @dev a function that sets the state variable ids.
    /// This is a public function can be called internally and externally
    /// @param oids the values to be set
    function setOids(uint8[2] memory oids) public {
        _oids = oids;
    }

    /// @notice a function that gets the ids
    /// @dev a function that gets the state variable ids.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint8 [] memory
    function getIds() public view returns (uint8[] memory) {
        return _ids;
    }

    /// @notice a function that gets the ids
    /// @dev a function that gets the state variable ids.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint8 [] memory
    function getIds(uint8 id) public view returns (uint8) {
        return _ids[id];
    }

    /// @notice a function that gets the oids
    /// @dev a function that gets the state variable oids.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint8 [] memory
    function getOids() public view returns (uint8[2] memory) {
        return _oids;
    }

    /// @notice a function that gets the oids
    /// @dev a function that gets the state variable oids.
    /// This is a public function can be called internally and externally.
    /// a view function will not modify the state of the blockchain
    /// @return uint8 [] memory
    function getOids(uint8 id) public view returns (uint8) {
        return _oids[id];
    }
}
