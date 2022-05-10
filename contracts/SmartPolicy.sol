// SPDX-License-Identifier: MIT
import "./NeltenygVerifier.sol";
import "./GreaterOrEqualThanVerifier.sol";
import "./AM.sol"; 

pragma solidity ^0.8.0;

contract XACMLSmartPolicy {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;

    AMContract public AM;
    GreaterOrEqualThanVerifier public gradeAvg_verifier;        // Verificatore generale, >= decontestualizzato
    NeltenygVerifier public enrollment_verifier;              // Verificatore dedicato all'anno di iscrizione

    uint8 public targetGrade;
    string public targetRole;

    constructor(AMContract _AMcontract,
                GreaterOrEqualThanVerifier _gradeAvg_verifier,
                NeltenygVerifier _enrollment_verifier,
                uint8 _targetGrade,
                string memory _targetRole) {

        require(address(_AMcontract) != address(0) && address(_gradeAvg_verifier) != address(0) &&
                address(_enrollment_verifier) != address(0), "Input address cannot be 0x0");

        owner = msg.sender;

        gradeAvg_verifier = _gradeAvg_verifier;
        enrollment_verifier = _enrollment_verifier;
        AM = _AMcontract;

        targetGrade = _targetGrade;
        targetRole = _targetRole;
    }

    /////////////
    // TARGETS //
    /////////////
    function evaluateTarget_studentRole(address _subject) public view returns (bool) {

        string memory _role = AM.getPublicAttributeOf(_subject, "uniStudent");

        // Utilizzare keccak permette di salvare tutti gli attributi pubblici come bytes32, sennò è complicato definire tutti i tipi
        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked(targetRole)))
            return true;
        else
            return false;
    }    

    ////////////////
    // CONDITIONS //
    ////////////////
    function evaluateCondition_avgGrade(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) public view returns (bool) {

        uint[] memory _inputs = AM.getMetadataOf(_subject, "gradeAverage");

        // Gli hash sono 2
        if(_inputs.length != 2)
            return false;

        // l'"1" in fondo all'array è per ZoKrates
        if(gradeAvg_verifier.verifyTx(_proof, [_inputs[0], _inputs[1], targetGrade, 1]))
            return true;
        else
            return false;
    }

    function evaluateCondition_enrollment(address _subject, NeltenygVerifier.Proof memory _proof) public view returns (bool) {

        uint[] memory _inputs = AM.getMetadataOf(_subject, "enrollmentYear");

        if(_inputs.length != 2)
            return false;

        if(enrollment_verifier.verifyTx(_proof, [_inputs[0], _inputs[1], 1]))
            return true;
        else
            return false;
    }

    ///////////////
    // COMB_ALGO //
    ///////////////
    function combining_algorithm(RuleEvaluation[2] memory _evaluations) internal pure returns(bool) {

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
    function evaluateRule_prize_right(address _subject, GreaterOrEqualThanVerifier.Proof memory _proofGrade, NeltenygVerifier.Proof memory _proofEnrollment) public view returns(RuleEvaluation) {

        if(!evaluateTarget_studentRole(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        else {

            bool resultGrade = evaluateCondition_avgGrade(_subject, _proofGrade);
            bool resultEnrollment = evaluateCondition_enrollment(_subject, _proofEnrollment);

            if(resultGrade && resultEnrollment)
                return RuleEvaluation.PERMIT;
            else
                return RuleEvaluation.NOTAPPLICABLE;
        }
    }

    function evaluateRule_deny_rule() public pure returns(RuleEvaluation) {

        return RuleEvaluation.DENY;
    }

    //////////////
    // EVALUATE //
    //////////////
    function evaluate(
        address subject,
        GreaterOrEqualThanVerifier.Proof memory _avgGradeProof,
        NeltenygVerifier.Proof memory _enrollmentProof
    ) public view returns(bool) {

        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof, _enrollmentProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return combining_algorithm( [prize_right, deny_rule] );
    }

}