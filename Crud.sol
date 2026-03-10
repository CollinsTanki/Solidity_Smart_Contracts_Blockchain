// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crud {

    struct User {
        uint id;
        string name;
    }

    User[] public users;
    uint public nextId = 1;

    // CREATE
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }

    // READ
    function read(uint id) public view returns (uint, string memory) {
        uint i = find(id);
        return (users[i].id, users[i].name);
    }

    // UPDATE
    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
    }

    // DELETE
    function destroy(uint id) public {
        uint i = find(id);
        delete users[i];
    }

    // FIND USER INDEX
    function find(uint id) internal view returns (uint) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i].id == id) {
                return i;
            }
        }

        revert("User does not exist!");
    }
}