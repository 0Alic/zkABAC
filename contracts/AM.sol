// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AMContract {

    mapping(address => mapping(string => uint[])) public metadataMap;
    mapping(address => mapping(string => string)) public publicAttributeMap;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function modifyMetadataOf(address _subject, string memory _verifier, uint[] memory _inputs) public {

        require(msg.sender == owner, "Only the owner can call this function");

        metadataMap[_subject][_verifier] = _inputs;
    }
    
    function getMetadataOf(address _subject, string memory _verifier) public view returns(uint[] memory) {
        return metadataMap[_subject][_verifier];
    }

    function modifyPublicAttributeOf(address _subject, string memory _attrname, string memory _val) public {

        require(msg.sender == owner, "Only the owner can call this function");

        publicAttributeMap[_subject][_attrname] = _val;
    }
    
    function getPublicAttributeOf(address _subject, string memory _attrname) public view returns(string memory _val) {
        return publicAttributeMap[_subject][_attrname];
    }

}