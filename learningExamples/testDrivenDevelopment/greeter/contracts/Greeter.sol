pragma solidity 0.8.14;

contract Greeter {

    /* Private attribute */
    string private _greeting = "Hello, World!";

    // Greet function
    // view means that can only-read the blockchain
    // external means that is part of the interface of the contract ancd can only be called from outside
    // memory means that the vale is not referencing anything located in the contract's persistent storage 
    function greet() external view returns(string memory){
        return _greeting;
    }

    // Greeting setter function
    // calldata means that the parameter is not part of the contract's persistent storage but is given by the function call
    function setGreeting(string calldata greeting) external {
        _greeting = greeting;
    }

}