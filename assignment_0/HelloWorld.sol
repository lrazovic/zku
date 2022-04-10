//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @author Leonardo Razovic
/// @title A simple "Hello World" contract example
contract HelloWorld {
    /// @dev The value stored in the contract
    uint256 number;

    /// Instanciate the contract.
    /// @param defaultNumber the initial value to store
    /// @dev stores the number in the state variable `number`
    constructor(uint256 defaultNumber) {
        number = defaultNumber;
    }

    /// Store `newNumber`.
    /// @param newNumber the new value to store
    /// @dev stores the number in the state variable `number`
    function storeNumber(uint256 newNumber) external {
        number = newNumber;
    }

    /// Return the stored value.
    /// @dev retrieves the value of the state variable `number`
    /// @return the stored value
    function retrieveNumber() external view returns (uint256) {
        return number;
    }
}
