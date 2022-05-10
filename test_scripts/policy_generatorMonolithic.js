import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const fs = require('fs')
// import * as fs from 'fs'
// argv[0] = node
// argv[1] = path
const size = process.argv[2]
const amAddress = process.argv[3]
const thresholdGrade = process.argv[4]
const targetRole = process.argv[5]


const contractName = `XACMLSmartPolicyMonolithic${size}Checks`
let verifierType = `Verifier${size}`
let inputs = `[`

for(let i=0; i<size*2; i++) {
    inputs += `_inputs[${i}], `
}
inputs += `${thresholdGrade}, 1]`

const contract = `
// SPDX-License-Identifier: MIT
import "./verifier${size}.sol";
import "../AM.sol";

pragma solidity ^0.8.0;

contract ${contractName} {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;
    ${verifierType} verifier;

    constructor(${verifierType} _verifier) {

        owner = msg.sender;
        verifier = _verifier;
    }    

    /////////////
    // TARGETS //
    /////////////
    function evaluateTarget_studentRole(address _subject) public view returns (bool) {

        string memory _role = AMContract(${amAddress}).getPublicAttributeOf(_subject, "uniStudent");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked("${targetRole}")))
            return true;
        else
            return false;
    }    


    ////////////////
    // CONDITIONS //
    ////////////////
    function evaluateCondition(address _subject, ${verifierType}.Proof memory _proof) public view returns (bool) {

        uint[] memory _inputs = AMContract(${amAddress}).getMetadataOf(_subject, "${verifierType}");

        if(_inputs.length != ${size*2})
            return false;

        if(verifier.verifyTx(_proof, ${inputs}))
            return true;
        else
            return false;
    }


    ///////////////
    // COMB_ALGO //
    ///////////////
    function first_applicable(RuleEvaluation[2] memory _evaluations) internal pure returns(bool) {

        for(uint i=0; i<_evaluations.length; i++) {
            if(_evaluations[i] == RuleEvaluation.PERMIT)
                return true;
            else if (_evaluations[i] == RuleEvaluation.DENY)
                return false;
            // else skip
        }

        return false; // Means either DENY, NOTAPPLICABLE, ERROR
    }

    ///////////
    // RULES //
    ///////////
    function evaluateRule_prize_right(address _subject, ${verifierType}.Proof memory _proofGrade) public view returns(RuleEvaluation) {

        if(!evaluateTarget_studentRole(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        else {

            bool resultGrade = evaluateCondition(_subject, _proofGrade);
            if(!resultGrade)
                return RuleEvaluation.NOTAPPLICABLE;
        }

            return RuleEvaluation.PERMIT;
    }

    function evaluateRule_deny_rule() public pure returns(RuleEvaluation) {

        return RuleEvaluation.DENY;
    }

    //////////////
    // EVALUATE //
    //////////////
    function evaluate(
        address subject,
        ${verifierType}.Proof memory _avgGradeProof
    ) public returns(bool) {

        // assegnamento a variabili fuori dalla funzione
        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return first_applicable( [prize_right, deny_rule] );
    }
}    
`

console.log("Policy Monolithic generated")
 
fs.writeFileSync(`../contracts/testContracts/XACMLSmartPolicyMonolithic${size}Checks.sol`, contract)

