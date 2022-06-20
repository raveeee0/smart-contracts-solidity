pragma solidity ^0.4.0;

contract Coin {
    /* Minter reference */
    address public minter;

    /* Mapping to balances */
    mapping(address => uint) public balances;

    /* Sent money event */
    event Sent(address from, address to, uint amount);

    /* Coin constructor - the minter is the deployer */
    constructor() public {
        minter = msg.sender;
    }

    /* Coin minting */
    function mint(address receiver, uint amount) public {
        if(msg.sender != minter)
            return;
        balances[receiver] += amount;
    }


    /* Create a coin transaction */    
    function send(address receiver, uint amount) public {
        if(balances[msg.sender] < amount)
            return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }


}