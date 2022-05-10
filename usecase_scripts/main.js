// If there is the "type": "module" in package.json, certain CommonJS variables can't be used
// https://nodejs.org/api/esm.html#no-require-exports-or-moduleexports
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

// Execute: ganache  -m "family dress industry stage bike shrimp replace design author amateur reopen script" -l 10000000

/**
 * This script implements the zkABAC use case.
 * 
 */

// Imports
import {exec, execSync} from 'child_process'
import { Resolver } from 'did-resolver'
import getResolver from 'ethr-did-resolver'
import { EthrDID } from 'ethr-did'
import { ethers } from 'ethers' 
import { getPrivateKeyFromMnemonic } from './utils.js'
import { computePublicKey } from '@ethersproject/signing-key'
import pkg from 'did-jwt-vc';
const { createVerifiableCredentialJwt, createVerifiablePresentationJwt, verifyCredential, verifyPresentation  } = pkg;

const fs = require("fs")
const Web3 = require("web3")
const Web3HttpProvider = require('web3-providers-http')
const didJwt = require("did-jwt")
const gas = 10000000

// Helper functions
async function generateKeysAndSigner(mnemonic, ganache_index, config_file) {

  // Need private key (from mnemonic)
  const pair = await getPrivateKeyFromMnemonic(mnemonic, ganache_index, config_file)
  const publicKey = computePublicKey(pair.sk, true)
  const signer = didJwt.ES256KSigner(pair.sk)

  return {keys: {public: publicKey, private: pair.sk}, address: pair.addr, signer: signer}
}

async function deployContract(buildPath, web3, deployerAddress, input=undefined) {

  const compiled = JSON.parse(fs.readFileSync(buildPath))
  const c = new web3.eth.Contract(compiled.abi)
  let instance
  if(input == undefined)
    instance = await c.deploy({data: compiled.bytecode}).send({from: deployerAddress, gas: gas})
  else
    instance = await c.deploy({data: compiled.bytecode, arguments: input}).send({from: deployerAddress, gas: gas})
  return instance
}

// Global variables
const config = JSON.parse(fs.readFileSync("config.json"))

const web3Url = config["localhost"]+":"+config["port"]
const web3Provider = new Web3HttpProvider(web3Url)
// const web3Provider = new Web3.providers.HttpProvider(web3Url) // <== With this did resolver does not work

const ethrsprovider = new ethers.providers.Web3Provider(web3Provider) // To integrate with did-jwt
const web3 = new Web3(new Web3.providers.HttpProvider(web3Url)) // To deploy contracts and call functions

/**
 * Main function
 */
async function test() {

  // Get accounts
  const accounts = await web3.eth.getAccounts()
  const [subject, attributeManager, resourceOwner] = [accounts[0], accounts[1], accounts[2]]

  // Deploy registry contract
  console.log("Setup: Deploying DID registry contract")
  const registry = await deployContract(config["registryPath"], web3, attributeManager)

  // Create DID Resolver
  console.log("Setup: Creating DID resolver")
  const didResolver = new Resolver(getResolver.getResolver({
    rpcUrl: web3Url, 
    registry: registry._address, 
    chainId: config["chainId"],
    provider: ethrsprovider
  }))

  // Create DIDs
  console.log("Setup: Creating DIDs")
  const subjectKeys = await generateKeysAndSigner(config["mnemonic"], 0, config)
  const attributeManagerKeys = await generateKeysAndSigner(config["mnemonic"], 1, config)
  const resourceOwnerKeys = await generateKeysAndSigner(config["mnemonic"], 2, config)

  const subjectDid = await new EthrDID({
    identifier: `did:ethr:${config["chainId"]}:${subjectKeys.keys.public}`,
    registry: registry._address,
    provider: ethrsprovider,
    chainNameOrId: config["chainId"],
    // privateKey: pair.sk, // <== this causes error "missing provider"
    signer: subjectKeys.signer
  })

  const attributeManagerDid = await new EthrDID({
    identifier: `did:ethr:${config["chainId"]}:${attributeManagerKeys.keys.public}`,
    registry: registry._address,
    provider: ethrsprovider,
    chainNameOrId: config["chainId"],
    signer: attributeManagerKeys.signer
  })

  const resourceOwnerDid = await new EthrDID({
    identifier: `did:ethr:${config["chainId"]}:${resourceOwnerKeys.keys.public}`,
    registry: registry._address,
    provider: ethrsprovider,
    chainNameOrId: config["chainId"],
    signer: resourceOwnerKeys.signer
  })

  // Attribute Manager: Deploy verifier contracts
  console.log("Attribute Manager: Deploying verifiers and AM Contract")
  const verifierEnrollmentYear = await deployContract("../build/contracts/NeltenygVerifier.json", web3, attributeManager)
  const verifierGreaterOrEqual = await deployContract("../build/contracts/GreaterOrEqualThanVerifier.json", web3, attributeManager)
  const AMContract = await deployContract("../build/contracts/AMContract.json", web3, attributeManager)

  console.log("Resource Owner: Deploying SmartPolicy")
  const targetGrade = 27
  const targetRole = web3.eth.abi.encodeParameter("string", "bachelor student")
  const smartPolicy = await deployContract("../build/contracts/XACMLSmartPolicy.json", web3, resourceOwner, [AMContract._address, verifierGreaterOrEqual._address, verifierEnrollmentYear._address, targetGrade, targetRole])

  // Attribute Manager
  
  // Create public attribute "bachelor student"
  console.log("Attribute Manager: Issuing public attribute bachelor student")
  await AMContract.methods.modifyPublicAttributeOf(subject, "uniStudent", targetRole).send({from: attributeManager, gas: gas})

  // Create verifiable credentials

  // Create credentials with proofs
  // Grade credential
  console.log("Attribute Manager: Issuing credentials")
  console.log("Verfiable Credential about average grade")
  console.log("\tPrivate attribute value: Average Grade: 27")
  console.log("\tPrivate attribute value: Nonce: 123")
  console.log("\tPublic attribute value: Hashes: 247057619414512340575091042953344278943, 45785832029177946190796587969520538188")

  const grade_private = {
    attribute_value: 28
  }
  const grade_public = {
    hash1: "247057619414512340575091042953344278943",
    hash2: "45785832029177946190796587969520538188"
  }

  const vcGradePayload = {
    sub: `did:ethr:${config["chainId"]}:${subjectKeys.keys.public}`, // DID identifier of Subject
    nbf: 1562950282,
    vc: {
      '@context': ['https://www.w3.org/2018/credentials/v1'],
      type: ['VerifiableCredential'],
      credentialSubject: {
        private: grade_private,
        public: grade_public
      }
    }
  }

  console.log("\tStore hashes in AM Contract")
  await AMContract.methods.modifyMetadataOf(subject, "gradeAverage", [vcGradePayload.vc.credentialSubject.public.hash1, vcGradePayload.vc.credentialSubject.public.hash2]).send({from: attributeManager, gas: gas})

  // Enrollment credential
  console.log("Verfiable Credential about enrollment year")
  console.log("\tPrivate attribute value: Average Grade: 27")
  console.log("\tPrivate attribute value: Nonce: 123")
  console.log("\tPublic attribute value: Hashes: 247057619414512340575091042953344278943, 45785832029177946190796587969520538188")
  const enrollment_private = {
    attribute_value: 1,
    nonce: 123
  }
  const enrollment_public = {
    hash1: "176699728877476889697869080671450289272",
    hash2: "82349988007426159823739410640435529997"
  }

  const vcEnrollmentPayload = {
    sub: `did:ethr:${config["chainId"]}:${subjectKeys.keys.public}`, // DID identifier of Subject
    nbf: 1562950282,
    vc: {
      '@context': ['https://www.w3.org/2018/credentials/v1'],
      type: ['VerifiableCredential'],
      credentialSubject: {
        private: enrollment_private,
        public: enrollment_public
      }
    }
  }

  console.log("\tStore hashes in AM Contract")
  await AMContract.methods.modifyMetadataOf(subject, "enrollmentYear", [vcEnrollmentPayload.vc.credentialSubject.public.hash1, vcEnrollmentPayload.vc.credentialSubject.public.hash2]).send({from: attributeManager, gas: gas})

  // Nonce credential
  console.log("Verifiable credential with the nonce, unique to the subject")

  const vcNoncePayload = {
    sub: `did:ethr:${config["chainId"]}:${subjectKeys.keys.public}`, // DID identifier of Subject
    nbf: 1562950282,
    vc: {
      '@context': ['https://www.w3.org/2018/credentials/v1'],
      type: ['VerifiableCredential'],
      credentialSubject: {
        private: {nonce: 123}
      }
    }
  }

  const options = {		
		header: {
			"typ": "JWT",
			"alg": "ES256K"
		},
	}

  const vcGradeJwt = await createVerifiableCredentialJwt(vcGradePayload, attributeManagerDid, options)
  const vcEnrollmentJwt = await createVerifiableCredentialJwt(vcEnrollmentPayload, attributeManagerDid, options)
  const vcNonceJwt = await createVerifiableCredentialJwt(vcNoncePayload, attributeManagerDid, options)

  // Subject: Create presentation with credentials
    // This code is executed to test everything is correct
  console.log("Subject: creating presentation")
  const vpPayload = {
    vp: {
      '@context': ['https://www.w3.org/2018/credentials/v1'],
      type: ['VerifiablePresentation'],
      verifiableCredential: [vcGradeJwt, vcEnrollmentJwt]
    }
  }

  const vpJwt = await createVerifiablePresentationJwt(vpPayload, subjectDid)

  // Verify presentation
  console.log("Resource owner: Verifying presentation")
  const verifiedVP = await verifyPresentation(vpJwt, didResolver)
  console.log(`Is presentation signed by Subject: ${verifiedVP.issuer == subjectDid.did}`)

  // Create zk-proofs
  console.log("Subject: Create zk-proofs from attributes")
  // Extract VCs from VP
  // const VC1 = verifiedVP.verifiablePresentation.verifiableCredential[0].credentialSubject
  // const VC2 = verifiedVP.verifiablePresentation.verifiableCredential[1].credentialSubject

  let cmd
  const VCNonce = vcNoncePayload.vc.credentialSubject
  const VC1 = vcGradePayload.vc.credentialSubject
  cmd = `cd ../zok/greaterOrEqualThan && zokrates compute-witness -a ${VC1.private.attribute_value} ${VCNonce.private.nonce} ${VC1.public.hash1} ${VC1.public.hash2} ${targetGrade} && zokrates generate-proof`
  console.log(execSync(cmd).toString())
  const VC2 = vcEnrollmentPayload.vc.credentialSubject
  cmd = `cd ../zok/enrollmentYear && zokrates compute-witness -a ${VC2.private.attribute_value} ${VCNonce.private.nonce} ${VC2.public.hash1} ${VC2.public.hash2} && zokrates generate-proof`
  console.log(execSync(cmd).toString())

  // Retrieve proof
  console.log("Subject: Retrieve proof from file")
  const avgGradeProof = JSON.parse(fs.readFileSync("../zok/greaterOrEqualThan/proof.json"))
  const enrollmentProof = JSON.parse(fs.readFileSync("../zok/enrollmentYear/proof.json"))

  // Send proofs to the Smart Policy
  console.log("Subject: Send proofs to the Smart Policy")
  
  const bool = await smartPolicy.methods.evaluate(subject,
                                                [avgGradeProof.proof.a, avgGradeProof.proof.b, avgGradeProof.proof.c],
                                                [enrollmentProof.proof.a, enrollmentProof.proof.b, enrollmentProof.proof.c]).call({from: subject})

  console.log("Smart Policy: Verification returned " + bool)

}

// Call function
test()