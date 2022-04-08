//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Defines a contract named `HelloWorld`.
// A contract is a collection of functions and data (its state). Once deployed, a contract resides at a specific address on the Ethereum blockchain. Learn more: https://solidity.readthedocs.io/en/v0.5.10/structure-of-a-contract.html
contract HelloWorld {

    // Declares a state variable `number` of type `uint`.
    // State variables are variables whose values are permanently stored in contract storage. The keyword `public` makes variables accessible from outside a contract and creates a function that other contracts or clients can call to access the value.
    uint256 number;

    // Similar to many class-based object-oriented languages, a constructor is a special function that is only executed upon contract creation.
    constructor(uint256 defaultNumber) {
        // Accepts a string argument `defaultNumber` and sets the value into the contract's `number` storage variable).
        number = defaultNumber;
    }

    // A public function that accepts a uint argument and updates the `number` storage variable.
    function storeNumber(uint256 newNumber) external {
        number = newNumber;
    }

    // A public function that accepts a uint argument and updates the `number` storage variable.
    function retrieveNumber() external view returns (uint256) {
        return number;
    }
}
