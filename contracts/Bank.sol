// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    struct Account {
        address owner;
        uint256 balance;
    }

    mapping(address => Account) public accounts;

    function createAccount() public {
        // check if account already exist
        require(accounts[msg.sender].owner == address(0), "Account already exists");

        // create account if does not already exist
        accounts[msg.sender] = Account(msg.sender, 0);
    }

    function deposit(uint256 amount) public {
        // check if account has been created
        require(accounts[msg.sender].owner != address(0), "Account not created");

        // increase the account balance if account exists
        accounts[msg.sender].balance += amount;
    }

    function withdraw(uint256 amount) public {
        // check if account has been created
        require(accounts[msg.sender].owner != address(0), "Account not created");

        // check if there is enough balance to withdraw
        require(accounts[msg.sender].balance >= amount, "Insufficient balance");

        // decrease the account balance if account exists
        accounts[msg.sender].balance -= amount;
    }
}
