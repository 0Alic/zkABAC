import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const fs = require('fs')

// import * as fs from 'fs'
// argv[0] = node
// argv[1] = path
const size = process.argv[2]
const verifierAddress = process.argv[3]
const thresholdGrade = process.argv[4]
const amAddress = process.argv[5]
const targetRole = process.argv[6]

const contractName = `XACMLSmartPolicyModular${size}Verifiers`
let evaluateCondition = ``
let callVerifier = ``
for(let i=0; i<size; i++) {

    evaluateCondition += `
    function evaluateCondition_avgGrade${i}(address _subject, Pairing.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(${amAddress}).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(${verifierAddress}).verifyTx(_proof, [_inputs[0], _inputs[1], ${thresholdGrade}, 1]))
            return true;
        else
            return false;
    }
    `

    callVerifier += `
    result = evaluateCondition_avgGrade${i}(_subject, _proofGrade[${i}]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE\;
    `
}


const contract = `
// SPDX-License-Identifier: MIT
import "../GreaterOrEqualThanVerifier.sol";
import "../AM.sol";
import "../Pairing.sol";

pragma solidity ^0.8.0;

contract ${contractName} {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }
    address public owner;

    constructor() {
        owner = msg.sender;
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
    ${evaluateCondition}


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
    function evaluateRule_prize_right(address _subject, Pairing.Proof[] memory _proofGrade) internal view returns(RuleEvaluation) {

        if(!evaluateTarget_studentRole(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        else {

            bool result = false;

            ${callVerifier}
            return RuleEvaluation.PERMIT;
        }
    }

    function evaluateRule_deny_rule() internal pure returns(RuleEvaluation) {

        return RuleEvaluation.DENY;
    }


    //////////////
    // EVALUATE //
    //////////////
    function evaluate(
        address subject,
        Pairing.Proof[] memory _avgGradeProof
    ) public returns(bool) {

        // assegnamento a variabili fuori dalla funzione
        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return first_applicable( [prize_right, deny_rule] );
    }
}
`;

console.log("Policy Modular generated")

fs.writeFileSync(`../contracts/testContracts/XACMLSmartPolicyModular${size}Verifiers.sol`, contract)


































// import { createRequire } from 'module';
// const require = createRequire(import.meta.url);
// const fs = require('fs')
// // import * as fs from 'fs'
// // argv[0] = node
// // argv[1] = path
// const size = process.argv[2]

// const contractName = `XACMLSmartPolicyModular${size}Verifiers`
// let state = ``
// let assignment = ``
// let evaluateCondition = ``
// let callVerifier = ``
// for(let i=0; i<size; i++) {
//     state += `
//     GreaterOrEqualThanVerifier public gradeAvg_verifier${i};
//     uint8 public targetGrade${i};
//     `
//     assignment += `
//     gradeAvg_verifier${i} = _gradeAvg_verifier;
//     targetGrade${i} = _targetGrade;
//     `

//     evaluateCondition += `
//     function evaluateCondition_avgGrade${i}(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

//         uint[] memory _inputs = AM.getMetadataOf(_subject, "gradeAverage");

//         if(_inputs.length != 2)
//             return false;

//         if(gradeAvg_verifier${i}.verifyTx(_proof, [_inputs[0], _inputs[1], targetGrade${i}, 1]))
//             return true;
//         else
//             return false;
//     }
//     `

//     callVerifier += `
//     result = evaluateCondition_avgGrade${i}(_subject, _proofGrade[${i}]);
//     if(!result)
//         return RuleEvaluation.NOTAPPLICABLE\;
//     `
// }


// const contract = `
// // SPDX-License-Identifier: MIT
// import "../GreaterOrEqualThanVerifier.sol";
// import "../AM.sol";

// pragma solidity ^0.8.0;

// contract ${contractName} {

//     enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }
//     address public owner;

//     AMContract public AM;
//     ${state}
//     bytes public targetRole;

//     constructor(AMContract _AMcontract,
//         GreaterOrEqualThanVerifier _gradeAvg_verifier,
//         uint8 _targetGrade,
//         bytes memory _targetRole) {

//         require(address(_AMcontract) != address(0) && address(_gradeAvg_verifier) != address(0), "Input address cannot be 0x0");

//         owner = msg.sender;
//         AM = _AMcontract;

//         ${assignment}

//         targetRole = _targetRole;
//     }    

//     /////////////
//     // TARGETS //
//     /////////////
//     function evaluateTarget_studentRole(address _subject) public view returns (bool) {

//         bytes memory _role = AM.getPublicAttributeOf(_subject, "uniStudent");

//         // Utilizzare keccak permette di salvare tutti gli attributi pubblici come bytes32, sennò è complicato definire tutti i tipi
//         if(keccak256(_role) == keccak256(targetRole))
//             return true;
//         else
//             return false;
//     }   


//     ////////////////
//     // CONDITIONS //
//     ////////////////
//     ${evaluateCondition}


//     ///////////////
//     // COMB_ALGO //
//     ///////////////
//     function first_applicable(RuleEvaluation[2] memory _evaluations) internal pure returns(bool) {

//         for(uint i=0; i<_evaluations.length; i++) {
//             if(_evaluations[i] == RuleEvaluation.PERMIT)
//                 return true;
//             else if (_evaluations[i] == RuleEvaluation.DENY)
//                 return false;
//             // else skip
//         }

//         return false; // Means either DENY, NOTAPPLICABLE, ERROR
//     }    


//     ///////////
//     // RULES //
//     ///////////
//     function evaluateRule_prize_right(address _subject, GreaterOrEqualThanVerifier.Proof[] memory _proofGrade) internal view returns(RuleEvaluation) {

//         if(!evaluateTarget_studentRole(_subject)) {
//             return RuleEvaluation.NOTAPPLICABLE;
//         }
//         else {

//             bool result = false;

//             ${callVerifier}
//             return RuleEvaluation.PERMIT;
//         }
//     }

//     function evaluateRule_deny_rule() internal pure returns(RuleEvaluation) {

//         return RuleEvaluation.DENY;
//     }


//     //////////////
//     // EVALUATE //
//     //////////////
//     function evaluate(
//         address subject,
//         GreaterOrEqualThanVerifier.Proof[] memory _avgGradeProof
//     ) public returns(bool) {

//         // assegnamento a variabili fuori dalla funzione
//         RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
//         RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
//         return first_applicable( [prize_right, deny_rule] );
//     }
// }
// `;

// console.log(contract)
 
// fs.writeFileSync(`../contracts/testContracts/XACMLSmartPolicyModular${size}Verifiers.sol`, contract)

