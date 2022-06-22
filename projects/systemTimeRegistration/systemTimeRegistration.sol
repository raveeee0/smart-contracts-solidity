// SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract Agent {

    struct Data {
        uint enterDate;
        uint exitDate;
        bool isIn;
    }

    address private coordinator;
    address[] private addrRegister;
    mapping(address => Data) private agents;


    constructor() public {
        coordinator = msg.sender;
    }

    event TrueFalse (
        address indexed lastInvoker,
        address indexed _id,
        bool _success
    );

    modifier onlyCoordinator() {
        require(msg.sender == coordinator);
        _;
    }

    function register(address authorized) public onlyCoordinator {
        authRegister.push(authorized);
        return;
    }

    function logStatus() view public onlyCoordinator {

    }

    function start(address agentAddress) public {

        bool isAuthorized;

        while(a)

        Agent instance;
        instance.address
        instance.isIn = true;
        instance.startDate = now();
        agents[msg.sender] = instance;
    }

    function exit(string identifier) public onlyAuthorized {
        
    }

    function invoke() public {

    }

    function state() view private {

    }


}