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


    let deploycostVerifier = ``
    let deploycostPolicy = ``
    let evaluatecost = ``

    const avgGradeStr = "gradeAverage"

    AM = await AMContract.deployed()

    for(let i in sizes) {
        const s = sizes[i]
        const verifierArtifact = artifacts.require(`Verifier${s}`)
        const policyArtifact = artifacts.require(`XACMLSmartPolicyMonolithic${s}Checks`)
        const json = JSON.parse(fs.readFileSync(`./test/zok/proof${s}.json`))
        const metadataKey = `Verifier${s}`

        console.log(`policy with one monolithic verifiers with ${s} value checks`)

        let inputs = json.inputs
        inputs.pop() // remove "1"
        inputs.pop() // remove "target"

        // deploy verifier
        const verifier = await verifierArtifact.new({from: resource_owner})
        const deploygas = await verifierArtifact.new.estimateGas({from: resource_owner})

        await AM.modifyMetadataOf(subject, metadataKey, inputs)

        const smart_policy = await policyArtifact.new(verifier.address, {from: resource_owner, gas: gas_limit})
        const gas = await policyArtifact.new.estimateGas(verifier.address, {from: resource_owner, gas: gas_limit})
        const tx = await smart_policy.evaluate(subject, [json.proof.a, json.proof.b, json.proof.c], {gas: gas_limit})    

        console.log("\tDeployment cost Policy: " + gas)
        console.log("\tDeployment cost Verifier: " + deploygas)
        console.log("\tEvaluation cost: " + tx.receipt.gasUsed)

        deploycostPolicy += `${s},${gas}\n`
        deploycostVerifier += `${s},${deploygas}\n`
        evaluatecost += `${s},${tx.receipt.gasUsed}\n`
    }

    fs.writeFileSync(`monolithicDeployCostVerifier.csv`, deploycostVerifier)
    fs.writeFileSync(`monolithicDeployCostPolicy.csv`, deploycostPolicy)
    fs.writeFileSync(`monolithicEvaluateCost.csv`, evaluatecost)

    callback();
}

