// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "https://github.com/bokkypoobah/BokkyPooBahsDateTimeLibrary/blob/master/contracts/BokkyPooBahsDateTimeLibrary.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";


contract Agent {

    struct Data {
        string name;
        uint enterDate;
        uint exitDate;
        bool isIn;
    }

    address private coordinator;
    address[] private addrRegistered;
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
        addrRegistered.push(authorized);
        return;
    }

    function registerMultiple(address[] authorized) public onlyCoordinator {
        for(uint i = 0; i <  authorized.length; i++)
            addrRegistered.push(authorized[i]);
        
        return;
    }

    function toFormat(uint year, uint month, uint day, uint hour, uint minute, uint second) pure private returns (string _format) {
        _format = string.concat(Strings.toString(day), "/", Strings.toString(month), "/", Strings.toString(year), "\t",
                                                 Strings.toString(hour), ":", Strings.toString(minute), ":", Strings.toString(second));
                                                
        return _format;
    }

    function currentStatus() view public onlyCoordinator returns (string status) {
        uint i = 0;
        while(i < addrRegistered.length)
            if(agents[addrRegistered[i]].isIn)
                status = createCurrentStateString(status, addrRegistered[i], agents[addrRegistered[i]]);
        return status;
    }

    function createCurrentStateString(string status, address agentAddress, Agent agent) view private returns (string state) {
        state = string.concat(status, "\n", string(agentAddress), "\t", agent.name, "\t");
        
        string enterDate = toFormat(BokkyPooBahsDateTimeLibrary.timestampToDateTime(agent.enterDate));
        
        return string.concat(status, enterDate);

        return state;
    }


    function isAuthorized(address caller) view private returns (bool _bool) {
        uint i = 0;

        while(i < addrRegistered.length)
            if(addrRegistered[i] == caller)
                _bool = true;

        return _bool;
    }


    function start(string calldata name) public {
        if(isAuthorized(msg.sender) == false)
            return;
        agents[msg.sender].name = name;
        agents[msg.sender].enterDate = now;
    }

    function exit() public {
        if(isAuthorized(msg.sender) == false)
            return;

        if(agents[msg.sender].isIn == false)
            return;
        
        agents[msg.sender].exitDate = now;
        agents[msg.sender].isIn = false;

        return;
    }


}