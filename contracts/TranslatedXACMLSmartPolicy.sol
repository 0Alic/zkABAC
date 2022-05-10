
pragma solidity ^0.8.0;
import "./AM.sol"; 

import "./GreaterOrEqualThanVerifier.sol";

import "./NeltenygVerifier.sol";


contract TranslatedXACMLSmartPolicy {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /////////////
    // TARGETS //
    /////////////
    
    function evaluateTarget_prize(address _subject) public view returns (bool) {

        string memory _role = AMContract(0xd9145CCE52D386f254917e481eB44e9943F39138).getPublicAttributeOf(_subject, "subjectRole");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked("bachelor student")))
            return true;
        else
            return false;
    }    
    

    ////////////////
    // CONDITIONS //
    ////////////////
    
                function evaluateCondition_prize_gradeAverage(address _subject, GreaterOrEqualThanVerifier.Proof memory _proofgradeAverage) public view returns (bool) {

                uint[] memory _inputs = AMContract(0xd9145CCE52D386f254917e481eB44e9943F39138).getMetadataOf(_subject, "gradeAverage");

                if(_inputs.length != 2)
                    return false;

                if(GreaterOrEqualThanVerifier(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8).verifyTx(_proofgradeAverage, [_inputs[0], _inputs[1], 27 , 1]))
                    return true;
                else
                    return false;
                }
            
                function evaluateCondition_prize_enrollmentYear(address _subject, NeltenygVerifier.Proof memory _proofenrollmentYear) public view returns (bool) {

                uint[] memory _inputs = AMContract(0xd9145CCE52D386f254917e481eB44e9943F39138).getMetadataOf(_subject, "enrollmentYear");

                if(_inputs.length != 2)
                    return false;

                if(NeltenygVerifier(0xf8e81D47203A594245E36C48e151709F0C19fBe8).verifyTx(_proofenrollmentYear, [_inputs[0], _inputs[1], 1]))
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
    
    function evaluateRule_prize(address _subject , GreaterOrEqualThanVerifier.Proof memory _proofgradeAverage, NeltenygVerifier.Proof memory _proofenrollmentYear) public view returns(RuleEvaluation) {

        
        if(!evaluateTarget_prize(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        
        
            if(!(evaluateCondition_prize_gradeAverage(_subject, _proofgradeAverage)&& evaluateCondition_prize_enrollmentYear(_subject, _proofenrollmentYear)))
                return RuleEvaluation.NOTAPPLICABLE;
            
        return RuleEvaluation.PERMIT;
    }

    
    function evaluateRule_denyRule(address _subject ) public view returns(RuleEvaluation) {

        
        
        return RuleEvaluation.DENY;
    }

    

    //////////////
    // EVALUATE //
    //////////////
    
function evaluate(address subject , GreaterOrEqualThanVerifier.Proof memory _proofgradeAverage, NeltenygVerifier.Proof memory _proofenrollmentYear) public view returns(bool) {
    
    return combining_algorithm( [evaluateRule_prize(subject , _proofgradeAverage, _proofenrollmentYear), evaluateRule_denyRule(subject )] );
}

}
