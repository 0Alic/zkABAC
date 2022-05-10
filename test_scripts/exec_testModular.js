const AMContract = artifacts.require("AMContract")
const GreaterOrEqual = artifacts.require("GreaterOrEqualThanVerifier")

const fs = require('fs')

module.exports = async function(callback) {

    const gas_limit = 1000000000

    let accounts = await web3.eth.getAccounts()
    let attribute_manager = accounts[0]
    let subject = accounts[1]
    let resource_owner = accounts[2]

    let AM

    const roleStr = "uniStudent"

    const targetGrade = 27
    const targetRoleBytes = web3.eth.abi.encodeParameter("string", "bachelor student")
    const targetRole = "bachelor student"


    const sizes = [1,5,10,15,20,25,30,35,40,45,50,55,60,65,70]


    let deploycost = ``
    let evaluatecost = ``

    const avgGradeStr = "gradeAverage"
    const json = JSON.parse(fs.readFileSync("./zok/greaterOrEqualThan/proof.json"))
    let inputs = json.inputs
    inputs.pop() // remove "1"
    inputs.pop() // remove "target"

    AM = await AMContract.deployed()

    for(let i in sizes) {
        const s = sizes[i]
        console.log(`Modular policy with ${s} verifiers with 1 value check each`)

        const policyArtifact = artifacts.require(`XACMLSmartPolicyModular${s}Verifiers`)

        let proofs, gas, tx

        proofs =  Array(s).fill([json.proof.a, json.proof.b, json.proof.c])

        gas = await policyArtifact.new.estimateGas({from: resource_owner})
        smart_policy = await policyArtifact.new({from: resource_owner})

        tx = await smart_policy.evaluate(subject, proofs, {gas: gas_limit})
    
        console.log("\tDeployment cost: " + gas)
        console.log("\tEvaluation cost: " + tx.receipt.gasUsed)

        deploycost += `${s},${gas}\n`
        evaluatecost += `${s},${tx.receipt.gasUsed}\n`
    }

    fs.writeFileSync(`modularDeployCost.csv`, deploycost)
    fs.writeFileSync(`modularEvaluateCost.csv`, evaluatecost)
        
    callback();
}

