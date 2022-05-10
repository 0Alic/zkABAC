import { createRequire } from 'module';
import { exit } from 'process';
const require = createRequire(import.meta.url);

const { XMLParser, XMLBuilder, XMLValidator } = require("fast-xml-parser")
const fs = require("fs")

//////////
// HELPERS
//////////

function union(setA, setB) {
    let _union = new Set(setA)
    for (let elem of setB) {
        _union.add(elem)
    }
    return _union
}

// Parse target
function exploreTarget(target, ruleName) {

    const Match = target.AnyOf.AllOf.Match

    let matchId = (Match.$MatchId).split(":")
    matchId = matchId[matchId.length - 1]

    let attributeValue = Match.AttributeValue["#text"]
    let attributeType = (Match.AttributeValue.$DataType).split("#")
    attributeType = attributeType[attributeType.length - 1]
    if(attributeType == "string")
        attributeValue = `"${attributeValue}"`

    let attributeRole = (Match.AttributeDesignator.$AttributeId).split(":")
    attributeRole = attributeRole[attributeRole.length - 1]

    let issuer = Match.AttributeDesignator.$Issuer

    let code = `
    function evaluateTarget_${ruleName}(address _subject) public view returns (bool) {

        string memory _role = AMContract(${issuer}).getPublicAttributeOf(_subject, "${attributeRole}");

        if(keccak256(abi.encodePacked(_role)) == keccak256(abi.encodePacked(${attributeValue})))
            return true;
        else
            return false;
    }    
    `

    return {
        function: matchId,
        attributeValue: attributeValue,
        attributeType: attributeType,
        attributeRole: attributeRole,
        issuer: issuer,
        code: code
    }
}

// Parse condition
function exploreCondition(condition, ruleName) {

    let conditionBoolExpr = (condition.$FunctionId).split(":")
    conditionBoolExpr = conditionBoolExpr[conditionBoolExpr.length - 1]
    let code = ``
    let codeExpr = ``
    let codeInput = {}
    let importTypes = new Set()

    let conditionMap = {}
    conditionMap["attributes"] = {}
    if(conditionBoolExpr == "and")
        conditionMap["conditionBoolExpr"] = "&&"

    for(let c in condition.Apply) {

        let attribute = {}
        const applyFunction = condition.Apply[c]

        const functionParams = (applyFunction.$FunctionId).split(":")
        const functionAddress = functionParams[functionParams.length - 1]
        const functionType = functionParams[functionParams.length - 2]
        importTypes.add(functionType)

        const attributeDesignator = applyFunction.AttributeDesignator
        const attributeId = attributeDesignator.$AttributeId
        const attributeIssuer = attributeDesignator.$Issuer
        const attributePrivate = attributeDesignator.$Private

        attribute[attributeId] = {
            issuer: attributeIssuer,
            private: attributePrivate,
            function: {
                address: functionAddress,
                type: functionType
            }
        }

        const attributeValue = applyFunction.AttributeValue
        if(attributeValue != undefined) {
            const valueParams = (attributeValue.$DataType).split("#")
            const valueType = valueParams[valueParams.length - 1]
            const valueVal = attributeValue["#text"]

            attribute[attributeId]["type"] = valueType
            attribute[attributeId]["value"] = valueVal
        }

        let thresholdAttribute = ``
        if(attribute[attributeId]["value"] != undefined)
            thresholdAttribute = `, ${attribute[attributeId]["value"]} `


        if(attribute[attributeId]["private"] == "true") {
            // Private attribute, create code for verifier
            code += `
                function evaluateCondition_${ruleName}_${attributeId}(address _subject, ${functionType}.Proof memory _proof${attributeId}) public view returns (bool) {

                uint[] memory _inputs = AMContract(${attributeIssuer}).getMetadataOf(_subject, "${attributeId}");

                if(_inputs.length != 2)
                    return false;

                if(${functionType}(${functionAddress}).verifyTx(_proof${attributeId}, [_inputs[0], _inputs[1]${thresholdAttribute}, 1]))
                    return true;
                else
                    return false;
                }
            `

            if(codeExpr == ``) {
                codeExpr = `evaluateCondition_${ruleName}_${attributeId}(_subject, _proof${attributeId})`
            }
            else {
                codeExpr += `${conditionMap["conditionBoolExpr"]} evaluateCondition_${ruleName}_${attributeId}(_subject, _proof${attributeId})`
            }

            Object.assign(codeInput, {type: functionType, attributeId: attributeId})     
        }
        else {
            // Public attribute, invoke AMContract contract
        }
        
        Object.assign(conditionMap["attributes"], attribute)
    }

    conditionMap["codeDeclaration"] = code   
    conditionMap["codeInput"] = codeInput
    conditionMap["codeCall"] = codeExpr
    conditionMap["imports"] = importTypes

    return conditionMap
}

//////////
// BEGIN
//////////

const options = {
    ignoreAttributes : false,
    attributeNamePrefix : "$"
}

const parser = new XMLParser(options)

const obj = parser.parse(fs.readFileSync("policy.xml"))

const Policy = obj.Policy
let combiningAlgorithm = (Policy.$RuleCombiningAlgId).split(":")
combiningAlgorithm = combiningAlgorithm[combiningAlgorithm.length - 1]

// Target of the policy
const PolicyTarget = Policy.Target

// Rules of the policy
const Rules = Policy.Rule

// Create data structure of the rules of the policy
let ruleMap = {}
let importSet = new Set()

for(let r in Rules) {
    const Rule = Rules[r]

    let entryRule = {}
    
    entryRule[Rule.$RuleId] = {
        ruleEffect: Rule.$Effect                
    }

    const Target = Rule.Target
    const Condition = Rule.Condition

    if(Target != undefined) {
        const targetMap = exploreTarget(Target, Rule.$RuleId)
        entryRule[Rule.$RuleId]["target"] = targetMap
    }

    if(Condition != undefined) {
        const conditionMap = exploreCondition(Condition, Rule.$RuleId)
        entryRule[Rule.$RuleId]["condition"] = conditionMap
    }

    Object.assign(ruleMap, entryRule)
}


//
// Create Smart Policy Code
//

console.dir(ruleMap, {depth: null})

// Portion of code
let importCode = ``             // Code with "imports"
let combining_algorithm = ``    // Code with the combining algorithm
let rules = ``                  // Code with the rule declarations
let evaluate = ``               // Code with the evaluate function
let conditionCode = ``          // Code with the condition evaluation
let targetCode = ``             // Code with the target evaluation

// Helpers
let ruleCall = ``
let evaluateInput = ``

for(let r in ruleMap) {

    let effect
    if(ruleMap[r].ruleEffect == "Permit")
        effect = "PERMIT"
    else if(ruleMap[r].ruleEffect == "deny")
        effect = "DENY"

    // Rule target
    let callTarget = ``

    const target = ruleMap[r].target
    if(target != undefined) {

        callTarget = `
        if(!evaluateTarget_${r}(_subject)) {
            return RuleEvaluation.NOTAPPLICABLE;
        }
        `

        targetCode = target.code
    }

    // Rule condition
    let conditionInput = ``
    let callCondition = ``
    let ruleCallInput = ``

    const condition = ruleMap[r].condition
    
    if(condition != undefined) {

        // Import any verifier used in the condition
        importSet = union(importSet, condition.imports)
        
        if(condition.codeCall != undefined)
        callCondition = `
            if(!(${condition.codeCall}))
                return RuleEvaluation.NOTAPPLICABLE;
            `

        conditionCode = condition.codeDeclaration


        // Check for private attributes
            // The proofs must be provided as input of
                // Conditions, targets, rules

        for(let a in condition.attributes) {
            let attr = condition.attributes[a]
            if(attr.private == "true") {
                conditionInput += `, ${attr.function.type}.Proof memory _proof${a}`
                evaluateInput += `, ${attr.function.type}.Proof memory _proof${a}`
                ruleCallInput += `, _proof${a}`    
            }
        }
    
    }
    
    if(ruleCall == ``)
        ruleCall = `evaluateRule_${r}(subject ${ruleCallInput})`
    else 
        ruleCall += `, evaluateRule_${r}(subject ${ruleCallInput})`


    rules += `
    function evaluateRule_${r}(address _subject ${conditionInput}) public view returns(RuleEvaluation) {

        ${callTarget}
        ${callCondition}
        return RuleEvaluation.${effect};
    }

    `

}

/////
// COMBINING ALGORITHM
/////
if(combiningAlgorithm = "first-applicable") {

    combining_algorithm = 
    `function combining_algorithm(RuleEvaluation[${Object.keys(ruleMap).length}] memory _evaluations) internal pure returns(bool) {

        for(uint i=0; i<_evaluations.length; i++) {
            if(_evaluations[i] == RuleEvaluation.PERMIT)
                return true;
            else if (_evaluations[i] == RuleEvaluation.DENY)
                return false;
            // else skip
        }
    
        return false; // Means either DENY, NOTAPPLICABLE, ERROR
    }

    `
}
else {
    // Todo
}

/////
// EVALUATE
/////
evaluate = `
function evaluate(address subject ${evaluateInput}) public view returns(bool) {
    
    return combining_algorithm( [${ruleCall}] );
}
`

/////
// IMPPORTS
/////
for(let el of importSet)
importCode += `
import "./${el}.sol";
`


const contract = `
pragma solidity ^0.8.0;
import "./AM.sol"; 
${importCode}

contract TranslatedXACMLSmartPolicy {

    enum RuleEvaluation { DENY, PERMIT, NOTAPPLICABLE, INDETERMINATE }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /////////////
    // TARGETS //
    /////////////
    ${targetCode}

    ////////////////
    // CONDITIONS //
    ////////////////
    ${conditionCode}

    ///////////////
    // COMB_ALGO //
    ///////////////
    ${combining_algorithm}

    ///////////
    // RULES //
    ///////////
    ${rules}

    //////////////
    // EVALUATE //
    //////////////
    ${evaluate}
}
`

fs.writeFileSync("../contracts/TranslatedXACMLSmartPolicy.sol", contract)