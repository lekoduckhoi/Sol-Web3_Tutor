pragma solidity ^0.8.3;

contract controlStructures {
    uint a;
    function dosmt() public {
        if(a == 0){
            a=1;
        } else {
            a=0;
        }
    }
    function xema() public returns(uint){
        for(uint i=0; i<11; i++){
            a+=i;
        }
        return a;
    }
}