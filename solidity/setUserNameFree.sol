pragma solidity ^0.8.3;


contract tutorUsername {
    
    mapping (address => string) usernameOf;
    
    string[] usernames;
    
    event Set(address indexed _address, string _username);
    
    function set(string memory _username) public {
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