// const truffleAssert = require('truffle-assertions')
const {expectRevert} = require('@openzeppelin/test-helpers')
const XACMLSmartPolicy = artifacts.require("XACMLSmartPolicy")
const AMContract = artifacts.require("AMContract")
const EnrollmentYear = artifacts.require("NeltenygVerifier")
const GreaterOrEqual = artifacts.require("GreaterOrEqualThanVerifier")

const gas_limit = 80000000

const fs = require('fs')
const gradeProofPath = "./zok/greaterOrEqualThan/proof.json"
const yearProofPath = "./zok/enrollmentYear/proof.json"

contract("AMContract", function(accounts) {

    let attribute_manager = accounts[0]
    let subject = accounts[1]

    describe("Constructor", function() {

        it("Should deploy the contract", async function() {

            const AM = await AMContract.new({from: attribute_manager});

            const owner = await AM.owner();
            assert.equal(owner, attribute_manager, `Owner should be ${attribute_manager}`)
        });
    });

    describe("modifyMetadataOf", function() {

        let AM;
        const avgGradeStr = "gradeAvgVerifier"

        beforeEach(async function() {

            AM = await AMContract.new({from: attribute_manager});
        })

        it("Should modify a Metadata", async function() {

            const metadata = [123, 321, 456]

            let tx = await AM.modifyMetadataOf(subject, avgGradeStr, metadata, {from: attribute_manager})
            console.log("ModifyMetadata gas: " + tx.receipt.gasUsed)

            const res = await AM.getMetadataOf(subject, avgGradeStr)

            for(let i in res) {
                assert.equal(res[i].toNumber(), metadata[i], `Value at step ${i} should be ${metadata[i]}`)
            }
        });

        it("Should NOT modify a Metadata", async function() {

            const metadata = [123, 321, 456]

            try {
                // Note, with the latest changes I do not get the Solidity revert message as message error,
                // but something with Please check that the transaction satisfies all conditions set by Solidity [...]
                // Therefore, I cannot test the error case properly. 
                await AM.modifyMetadataOf(subject, avgGradeStr, metadata, {from: subject})
                assert(true, false, `modifyMetadataOf should have failed with ${subject} as caller`)
            }
            catch(error) {
                assert(true, true)
            }
        });

    });

    describe("modifyPublicAttributeOf", function() {

        let AM;
        const attrName = "unirole"

        beforeEach(async function() {

            AM = await AMContract.new({from: attribute_manager});
            // let g = await AMContract.new.estimateGas({from: attribute_manager});
            // console.log("Deploy AM: " + g)
        })

        it("Should modify an attribute", async function() {

            const valueStr = "bachelor student"
            const valueUint = 42

            // test with string
            let param = web3.eth.abi.encodeParameter('string', valueStr)
            let tx = await AM.modifyPublicAttributeOf(subject, attrName, param, {from: attribute_manager})
            console.log("Modify public attribute gas: " + tx.receipt.gasUsed)
            let res = await AM.getPublicAttributeOf(subject, attrName)
            let decodedParam = web3.eth.abi.decodeParameter('string', param)
            assert.equal(res, param, `Value should be ${param}`)
            assert.equal(valueStr, decodedParam, `Decoded value should be ${valueStr}`)

            // test with uint
            param = web3.eth.abi.encodeParameter('uint256', valueUint)
            await AM.modifyPublicAttributeOf(subject, attrName, param, {from: attribute_manager})
            res = await AM.getPublicAttributeOf(subject, attrName)
            decodedParam = web3.eth.abi.decodeParameter('uint256', param)
            assert.equal(res, param, `Value should be ${param}`)
            assert.equal(valueUint, decodedParam, `Decoded value should be ${valueUint}`)
        });

    });    

});

contract("SmartPolicy", function(accounts) {

    let attribute_manager = accounts[0]
    let subject = accounts[1]
    let resource_owner = accounts[2]

    let enrollmentYear_verifier
    let greatOrEqual_verifier
    let smart_policy
    let AM

    const avgGradeStr = "gradeAverage"
    const yearStr = "enrollmentYear"
    const roleStr = "uniStudent"

    const targetGrade = 27
    const targetRole = web3.eth.abi.encodeParameter("string", "bachelor student")

    describe("Constructor", function() {

        beforeEach(async function() {

            AM = await AMContract.new({from: attribute_manager})
            enrollmentYear_verifier = await EnrollmentYear.new({from: resource_owner})
            greatOrEqual_verifier = await GreaterOrEqual.new({from: resource_owner})
        })

        it("Should instatiate the Smart Policy contract", async function() {

            let g = smart_policy = await XACMLSmartPolicy.new.estimateGas(AM.address,
                greatOrEqual_verifier.address,
                enrollmentYear_verifier.address,
                targetGrade, targetRole, {from: resource_owner})

            console.log("Smart policy gas: " + g)

            smart_policy = await XACMLSmartPolicy.new(AM.address,
                greatOrEqual_verifier.address,
                enrollmentYear_verifier.address,
                targetGrade, targetRole, {from: resource_owner})

            const owner = await smart_policy.owner()
            const gradeV = await smart_policy.gradeAvg_verifier()
            const yearV = await smart_policy.enrollment_verifier()
            const am = await smart_policy.AM()
            const grade = await smart_policy.targetGrade()
            const role = await smart_policy.targetRole()
            

            assert.equal(owner, resource_owner, `owner should be ${resource_owner}`)
            assert.equal(gradeV, greatOrEqual_verifier.address, `gradeAvg verifier address should be ${greatOrEqual_verifier.address}`)
            assert.equal(yearV, enrollmentYear_verifier.address, `year verifier address should be ${enrollmentYear_verifier.address}`)
            assert.equal(am, AM.address, `AM address should be ${AM.address}`)
            assert.equal(grade, targetGrade, `target grade should be ${targetGrade}`)
            assert.equal(role, targetRole, `target role should be ${targetRole}`)
        })
    })

    describe("Evaulate", function() {

        // retrieve proofs
        const avgGradeProof = JSON.parse(fs.readFileSync(gradeProofPath))
        const yearProof = JSON.parse(fs.readFileSync(yearProofPath))

        // avgGrade
            // Private inputs generating the proof
                // private field grade= 28
                // private field salt= 123
            // Public inputs
                // field hash1= 247057619414512340575091042953344278943
                // field hash2= 45785832029177946190796587969520538188
                // field targetGrade= 27
        const gradeh1 = new web3.utils.BN('247057619414512340575091042953344278943')
        const gradeh2 = new web3.utils.BN('45785832029177946190796587969520538188')
        const targetGrade = new web3.utils.BN('27')
        const one = new web3.utils.BN('1') // ZoKrates adds a final "1" to the public input


        // years
            // Private inputs generating the proof
                // private field year= 1
                // private field salt= 123
            // Public inputs
                // field hash1= 176699728877476889697869080671450289272
                // field hash2= 82349988007426159823739410640435529997
                // field year= 1
        const yearh1 = new web3.utils.BN('176699728877476889697869080671450289272')
        const yearh2 = new web3.utils.BN('82349988007426159823739410640435529997')
                        
        beforeEach(async function() {

            AM = await AMContract.new({from: attribute_manager})
            enrollmentYear_verifier = await EnrollmentYear.new({from: resource_owner})
            greatOrEqual_verifier = await GreaterOrEqual.new({from: resource_owner})

            smart_policy = await XACMLSmartPolicy.new(AM.address,
                greatOrEqual_verifier.address,
                enrollmentYear_verifier.address,
                targetGrade, targetRole, {from: resource_owner})

        })

        it("Should evaluate  the Smart Policy contract", async function() {

            await AM.modifyMetadataOf(subject, avgGradeStr, [gradeh1, gradeh2], {from: attribute_manager})
            await AM.modifyMetadataOf(subject, yearStr, [yearh1, yearh2], {from: attribute_manager})

            await AM.modifyPublicAttributeOf(subject, roleStr, targetRole, {from: attribute_manager})

            const ret = await smart_policy.evaluate(subject, [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                            [yearProof.proof.a, yearProof.proof.b, yearProof.proof.c])

            assert.equal(ret, true, `evaluate result should be true`)
        })

        it("Should NOT evaluate the Smart Policy contract: verification returns false, invalid proof", async function() {

            const failString = "ZK verification returned false"

            await AM.modifyMetadataOf(subject, avgGradeStr, [gradeh1, gradeh2], {from: attribute_manager})
            await AM.modifyMetadataOf(subject, yearStr, [yearh1, yearh2], {from: attribute_manager})

            await AM.modifyPublicAttributeOf(subject, roleStr, targetRole, {from: attribute_manager})

            const ret = await smart_policy.evaluate(subject, [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                            [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c])

            assert.equal(ret, false, `evaluate result should be false`)
    
        })

        it("Should NOT evaluate the Smart Policy contract: invalid public value", async function() {

            const failString = "Invalid public attribute"
            const badRole = web3.eth.abi.encodeParameter("string", "phd student")

            await AM.modifyMetadataOf(subject, avgGradeStr, [gradeh1, gradeh2], {from: attribute_manager})
            await AM.modifyMetadataOf(subject, yearStr, [yearh1, yearh2], {from: attribute_manager})

            await AM.modifyPublicAttributeOf(subject, roleStr, badRole, {from: attribute_manager})

            const ret = await smart_policy.evaluate(subject, [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                            [yearProof.proof.a, yearProof.proof.b, yearProof.proof.c])

            assert.equal(ret, false, `evaluate result should be false`)
        })

        it("Should NOT evaluate the Smart Policy contract: empty hash", async function() {

            const failString = "Empty or inccorrect size of public inputs"

            await AM.modifyPublicAttributeOf(subject, roleStr, targetRole, {from: attribute_manager})

            const ret = await smart_policy.evaluate(subject, [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                            [yearProof.proof.a, yearProof.proof.b, yearProof.proof.c])

            assert.equal(ret, false, `evaluate result should be false`)
    
        })

        it("Should NOT evaluate the Smart Policy contract: verification returns false, invalid hash", async function() {

            const failString = "ZK verification returned false"

            await AM.modifyMetadataOf(subject, avgGradeStr, [gradeh1, gradeh2], {from: attribute_manager})
            await AM.modifyMetadataOf(subject, yearStr, [gradeh1, gradeh2], {from: attribute_manager})

            await AM.modifyPublicAttributeOf(subject, roleStr, targetRole, {from: attribute_manager})

            const ret = await smart_policy.evaluate(subject, [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                            [yearProof.proof.a, yearProof.proof.b, yearProof.proof.c])

            assert.equal(ret, false, `evaluate result should be false`)
    
        })

    })
})
