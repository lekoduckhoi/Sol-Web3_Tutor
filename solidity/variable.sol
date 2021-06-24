pragma solidity ^0.8.3;

contract Variable {
    //Fixed-size types
    bool isGOod;
    uint soKoAm;
    int soTuNhien;
    address myAddress;
    
    //Variable-size types 
    string ten;
    uint[] intArray;
    mapping(address => uint) addressToUint;
    
    //User-defined data 
    struct hocsinh {
        string ten;
        uint tuoi;
        address diachi;
    }
    
    //Built-in Variable
        //tx.origin  msg.sender msg.value block.timestamp
        
    function xem() public view returns(address) {
        return msg.sender;
    }
    function xem1() public view returns(address) {
        return tx.origin;
    }
    
}