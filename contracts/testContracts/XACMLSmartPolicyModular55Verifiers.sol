
// SPDX-License-Identifier: MIT
import "../GreaterOrEqualThanVerifier.sol";
import "../AM.sol";

pragma solidity ^0.8.0;

contract XACMLSmartPolicyModular55Verifiers {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }
    address public owner;

    constructor() {
        owner = msg.sender;
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
    
    function evaluateCondition_avgGrade0(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade1(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade2(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade3(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade4(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade5(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade6(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade7(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade8(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade9(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade10(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade11(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade12(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade13(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade14(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade15(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade16(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade17(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade18(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade19(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade20(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade21(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade22(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade23(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade24(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade25(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade26(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade27(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade28(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade29(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade30(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade31(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade32(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade33(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade34(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade35(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade36(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade37(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade38(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade39(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade40(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade41(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade42(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade43(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade44(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade45(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade46(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade47(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade48(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade49(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade50(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade51(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade52(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade53(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
            return true;
        else
            return false;
    }
    
    function evaluateCondition_avgGrade54(address _subject, GreaterOrEqualThanVerifier.Proof memory _proof) internal view returns (bool) {

        uint[] memory _inputs = AMContract(0x1dd0B5b3E207C7fB0A8dE897E89c1f85E487c5E0).getMetadataOf(_subject, "gradeAverage");

        if(_inputs.length != 2)
            return false;

        if(GreaterOrEqualThanVerifier(0x6a38BfDEd33EfA5Ef4dc5c4a600A58e2B530781E).verifyTx(_proof, [_inputs[0], _inputs[1], 27, 1]))
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
    
    result = evaluateCondition_avgGrade1(_subject, _proofGrade[1]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade2(_subject, _proofGrade[2]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade3(_subject, _proofGrade[3]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade4(_subject, _proofGrade[4]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade5(_subject, _proofGrade[5]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade6(_subject, _proofGrade[6]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade7(_subject, _proofGrade[7]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade8(_subject, _proofGrade[8]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade9(_subject, _proofGrade[9]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade10(_subject, _proofGrade[10]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade11(_subject, _proofGrade[11]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade12(_subject, _proofGrade[12]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade13(_subject, _proofGrade[13]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade14(_subject, _proofGrade[14]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade15(_subject, _proofGrade[15]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade16(_subject, _proofGrade[16]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade17(_subject, _proofGrade[17]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade18(_subject, _proofGrade[18]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade19(_subject, _proofGrade[19]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade20(_subject, _proofGrade[20]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade21(_subject, _proofGrade[21]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade22(_subject, _proofGrade[22]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade23(_subject, _proofGrade[23]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade24(_subject, _proofGrade[24]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade25(_subject, _proofGrade[25]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade26(_subject, _proofGrade[26]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade27(_subject, _proofGrade[27]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade28(_subject, _proofGrade[28]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade29(_subject, _proofGrade[29]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade30(_subject, _proofGrade[30]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade31(_subject, _proofGrade[31]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade32(_subject, _proofGrade[32]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade33(_subject, _proofGrade[33]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade34(_subject, _proofGrade[34]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade35(_subject, _proofGrade[35]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade36(_subject, _proofGrade[36]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade37(_subject, _proofGrade[37]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade38(_subject, _proofGrade[38]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade39(_subject, _proofGrade[39]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade40(_subject, _proofGrade[40]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade41(_subject, _proofGrade[41]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade42(_subject, _proofGrade[42]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade43(_subject, _proofGrade[43]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade44(_subject, _proofGrade[44]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade45(_subject, _proofGrade[45]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade46(_subject, _proofGrade[46]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade47(_subject, _proofGrade[47]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade48(_subject, _proofGrade[48]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade49(_subject, _proofGrade[49]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade50(_subject, _proofGrade[50]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade51(_subject, _proofGrade[51]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade52(_subject, _proofGrade[52]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade53(_subject, _proofGrade[53]);
    if(!result)
        return RuleEvaluation.NOTAPPLICABLE;
    
    result = evaluateCondition_avgGrade54(_subject, _proofGrade[54]);
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
