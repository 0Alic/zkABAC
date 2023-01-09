const Migrations = artifacts.require("Migrations");
const AMContract = artifacts.require("AMContract")
const GreaterOrEqual = artifacts.require("GreaterOrEqualThanVerifier")

const fs = require("fs")
const child_process = require("child_process")

module.exports = async function (deployer, network, accounts) {

  await deployer.deploy(Migrations);

  if(network == "localtest") {

    let attribute_manager = accounts[0]
    let subject = accounts[1]
    let resource_owner = accounts[2]

    const json = JSON.parse(fs.readFileSync("./zok/greaterOrEqualThan/proof.json"))
    let inputs = json.inputs
    inputs.pop() // remove "1"
    inputs.pop() // remove "target"

    const roleStr = "uniStudent"
    const avgGradeStr = "gradeAverage"
    const targetRoleBytes = web3.eth.abi.encodeParameter("string", "bachelor student")
    const targetRole = "bachelor student"

    const am = await deployer.deploy(AMContract)
    const verifier = await deployer.deploy(GreaterOrEqual)

    await am.modifyPublicAttributeOf(subject, roleStr, targetRole, {from: attribute_manager})
    await am.modifyMetadataOf(subject, avgGradeStr, inputs, {from: attribute_manager})

    const sizes = [1,2,5,10,15,20,25,30,35,40,45,50,55,60,65,70]
    let modular_script = ``
    let monolithic_script = ``

    for(let i of sizes) {
      modular_script += `node policy_generatorModular.js ${i} ${verifier.address} ${27} ${am.address} '${targetRole}'
      `
      // Skip "2" with monolithic
      if (i!=2) {
        const mono_verifier_TEMPLATE = artifacts.require(`Verifier${i}`)
        const mono_verifier = await deployer.deploy(mono_verifier_TEMPLATE)
        monolithic_script += `node policy_generatorMonolithic.js ${i} ${mono_verifier.address} ${27} ${am.address}  '${targetRole}'
        `  
      }
    }

    fs.writeFileSync(`./test_scripts/generateModularPolicies.sh`, modular_script)
    fs.writeFileSync(`./test_scripts/generateMonolithicPolicies.sh`, monolithic_script)

    cmd = `cd test_scripts && chmod +x generateModularPolicies.sh && ./generateModularPolicies.sh && chmod +x generateMonolithicPolicies.sh && ./generateMonolithicPolicies.sh && cd ..`
    console.log(child_process.execSync(cmd).toString())
  }
};
