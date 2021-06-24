pragma solidity ^0.8.3;

contract array {
    uint[] dayso;
    string[] daykytu;
    
    function add(uint smt) public {
        dayso.push(smt);
        dayso[0];
        dayso[0] = 1;
        delete dayso[0];
    }
    
    mapping(uint => address) a;
}