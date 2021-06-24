pragma solidity ^0.8.3;

contract bettutor {
    
    address admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    //Track one User's profit
   
    mapping (address => int) TotalProfitOfUsers;
    function viewTotalProfit(address _address) public view returns(int) {
        return TotalProfitOfUsers[_address];
    }
    
    // createRandomNumber
    
    function createRandomNumber() public view returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked("leko", block.timestamp, msg.sender)))%100;
        return rand;
    }
    
    function bet(uint amount, uint _winchance) public payable {
        require(msg.value == amount*10**18, "cant take ETH");
        uint _rand = createRandomNumber();
        if (_rand <= _winchance) {
            uint earn = amount*100/_winchance;
            TotalProfitOfUsers[msg.sender] += (int(earn) - int(amount));
            payable(msg.sender).transfer(earn*10**18);
        } else {
            TotalProfitOfUsers[msg.sender] -= int(amount);
        }
    }

}