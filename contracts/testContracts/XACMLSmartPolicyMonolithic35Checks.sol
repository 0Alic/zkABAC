
// SPDX-License-Identifier: MIT
import "./verifier35.sol";
import "../AM.sol";

pragma solidity ^0.8.0;

contract XACMLSmartPolicyMonolithic35Checks {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;
    Verifier35 verifier;

    constructor(Verifier35 _verifier) {

        owner = msg.sender;
        verifier = _verifier;
    }    

    /////////////
    // TARGETS //
    /////////////
    function evaluateTarget_studentRole(address _subject) public view returns (bool) {

        string memory _role = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getPublicAttributeOf(_subject, "uniStudent");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked("bachelor student")))
            return true;
        else
            return false;
    }    


    ////////////////
    // CONDITIONS //
    ////////////////
    function evaluateCondition(address _subject, Verifier35.Proof memory _proof) public view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "Verifier35");

        if(_inputs.length != 70)
            return false;

        if(verifier.verifyTx(_proof, [_inputs[0], _inputs[1], _inputs[2], _inputs[3], _inputs[4], _inputs[5], _inputs[6], _inputs[7], _inputs[8], _inputs[9], _inputs[10], _inputs[11], _inputs[12], _inputs[13], _inputs[14], _inputs[15], _inputs[16], _inputs[17], _inputs[18], _inputs[19], _inputs[20], _inputs[21], _inputs[22], _inputs[23], _inputs[24], _inputs[25], _inputs[26], _inputs[27], _inputs[28], _inputs[29], _inputs[30], _inputs[31], _inputs[32], _inputs[33], _inputs[34], _inputs[35], _inputs[36], _inputs[37], _inputs[38], _inputs[39], _inputs[40], _inputs[41], _inputs[42], _inputs[43], _inputs[44], _inputs[45], _inputs[46], _inputs[47], _inputs[48], _inputs[49], _inputs[50], _inputs[51], _inputs[52], _inputs[53], _inputs[54], _inputs[55], _inputs[56], _inputs[57], _inputs[58], _inputs[59], _inputs[60], _inputs[61], _inputs[62], _inputs[63], _inputs[64], _inputs[65], _inputs[66], _inputs[67], _inputs[68], _inputs[69], 27, 1]))
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
    function evaluateRule_prize_right(address _subject, Verifier35.Proof memory _proofGrade) public view returns(RuleEvaluation) {

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
        Verifier35.Proof memory _avgGradeProof
    ) public returns(bool) {

        // assegnamento a variabili fuori dalla funzione
        RuleEvaluation prize_right = evaluateRule_prize_right(subject, _avgGradeProof);
        RuleEvaluation deny_rule = evaluateRule_deny_rule();
        
        return first_applicable( [prize_right, deny_rule] );
    }
}    
