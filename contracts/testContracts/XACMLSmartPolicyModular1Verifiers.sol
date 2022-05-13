
// SPDX-License-Identifier: MIT
import "../GreaterOrEqualThanVerifier.sol";
import "../AM.sol";

pragma solidity ^0.8.0;

contract XACMLSmartPolicyModular1Verifiers {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }
    address public owner;

    constructor() {
        owner = msg.sender;
    }    

    /////////////
    // TARGETS //
    /////////////
    function evaluateTarget_studentRole(address _subject) public view returns (bool) {

        string memory _role = AMContract(0xC8c45aA0fA6203d60b4382a90B60B5644eD7F5B7).getPublicAttributeOf(_subject, "uniStudent");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked("bachelor student")))
            return true;
        else
            return false;
    }   

    ////////////////
    // CONDITIONS //
    ////////////////
    
    function evaluateCondition_avgGrade0(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0xC8c45aA0fA6203d60b4382a90B60B5644eD7F5B7).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x7d3b67da2913A317c13D3274C57f54bedEE84E47).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
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
    function evaluateRule_prize_right(address _subject, GreaterOrEqualThanVerifier.Proof[] memory _proofGrade) internal view returns(RuleEvaluation) {

        if(!evaluateTarget_studentRole(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        else {

            bool result = false;

            
    result = evaluateCondition_avgGrade0(_subject, _proofGrade[0]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
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
        GreaterOrEqualThanVerifier.Proof[] memory _avgGradeProof
    ) public returns(bool) {

        // assegnamento a variabili fuori dalla funzione
        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return first_applicable( [prize_right, deny_rule] );
    }
}
