pragma solidity ^0.8.3;

import "/";

contract setUsername {
    
    address admin;
    TutorToken Token;
    
    constructor() {
        admin = (msg.sender);
    }
    
    mapping (address => string) usernameOf;
    
    string[] usernames;
    
    event Set(address indexed _address, string _username);
    
    function setTokencontract(address _address) public {
        require(msg.sender == admin);
        Token = TutorToken(_address);
    }
    function withdraw() public {
        require(msg.sender == admin);
        uint _amount = Token.balanceOf(address(this));
        Token.transfer(admin, _amount);
    }
    function set(string memory _username) public {
        require(Token.balanceOf(msg.sender) >= 5000*10**18);
        Token.transferFrom(msg.sender, address(this), 5000*10**18);
        usernameOf[msg.sender] = _username;
        usernames.push(_username);
        emit Set(msg.sender, _username);
    }
    function viewUsername(address _address) public view returns(string memory) {
        return usernameOf[_address];
    }
    function viewUsernameList() public view returns(string[] memory) {
        return usernames;
    }
}