pragma solidity ^0.8.3;

contract myFunction {
    uint value;
    
    function getValue() public view returns(uint) {
        return value;
    }
    function setValue(uint _value) public {
        value = _value;
    }
    //function modifier
        // pure view
    function xemmsg() public view returns(address) {
        return msg.sender;
    }
    function purefunc() public pure returns(uint) {
        return 1+1;
    }
    //function visibility   
        //internal external public private
}