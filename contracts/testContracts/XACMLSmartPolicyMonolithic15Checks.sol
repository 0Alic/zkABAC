
// SPDX-License-Identifier: MIT
import "./verifier15.sol";
import "../AM.sol";

pragma solidity ^0.8.0;

contract XACMLSmartPolicyMonolithic15Checks {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;

    constructor() {

        owner = msg.sender;
    }    

    /////////////
    // TARGETS //
    /////////////
    function evaluateTarget_studentRole(address _subject) public view returns (bool) {

        string memory _role = AMContract(0x4BBc0cC927e68F0c5C479F434Bc7D65bBDA367d0).getPublicAttributeOf(_subject, "uniStudent");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked("bachelor student")))
            return true;
        else
            return false;
    }    


    ////////////////
    // CONDITIONS //
    ////////////////
    function evaluateCondition(address _subject, Verifier15.Proof memory _proof) public view returns (bool) {

        uint[] memory _inputs = AMContract(0x4BBc0cC927e68F0c5C479F434Bc7D65bBDA367d0).getMetadataOf(_subject, "Verifier15");

        if(_inputs.length != 30)
            return false;

        if(Verifier15(0xDFFD64c691ac88673C33bBae7748480Cf55eb1E5).verifyTx(_proof, [_inputs[0], _inputs[1], _inputs[2], _inputs[3], _inputs[4], _inputs[5], _inputs[6], _inputs[7], _inputs[8], _inputs[9], _inputs[10], _inputs[11], _inputs[12], _inputs[13], _inputs[14], _inputs[15], _inputs[16], _inputs[17], _inputs[18], _inputs[19], _inputs[20], _inputs[21], _inputs[22], _inputs[23], _inputs[24], _inputs[25], _inputs[26], _inputs[27], _inputs[28], _inputs[29], 27, 1]))
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
    function evaluateRule_prize_right(address _subject, Verifier15.Proof memory _proofGrade) public view returns(RuleEvaluation) {

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
        Verifier15.Proof memory _avgGradeProof
    ) public returns(bool) {

        // assegnamento a variabili fuori dalla funzione
        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return first_applicable( [prize_right, deny_rule] );
    }
}    
