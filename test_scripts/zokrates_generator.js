import { createRequire } from 'module';
import {exec, execSync} from 'child_process'

const require = createRequire(import.meta.url);
const fs = require('fs')
const readline = require('readline')
// import * as fs from 'fs'
// argv[0] = node
// argv[1] = path

// process.argv.splice(0, 2)
// const input = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70]
const input = [1, 2, 5, 10]

let provingKeySize = `num,provingkey,out\n`
let proofTime = `num,time (ms)\n`

for(let arg in input) {

    const size = input[arg]
    const zokfile = `./${size}attributes.zok`
    let cmd

    console.log(`*** zkABAC script: ${size} attributes ***`)

    // Generate zokrates program
    console.log("*** zkABAC script: Generating zokrates program ***")
    let zokrates =
    `import "hashes/sha256/512bitPacked" as sha256packed

    def main(private field[${size}] b, private field salt, field[${size}] h1, field[${size}] h2, field target) -> (bool):

        for u32 i in 0..${size} do
            assert(b[i] >= target)
            field[2] h = sha256packed([0, 0, b[i], salt])
            assert(h1[i] == h[0])
            assert(h2[i] == h[1])
        endfor

        return true
    `
    fs.writeFileSync(zokfile, zokrates)


    // Compile zokrates program
    console.log("*** zkABAC script: Compiling zokrates program ***")
    cmd = `zokrates compile -i ${zokfile}`
    console.log(execSync(cmd).toString())


    // Setup and generate proving/verification keys
    console.log("*** zkABAC script: Performing Setup ***")
    cmd = `zokrates setup`
    console.log(execSync(cmd).toString())


    // Compute witness
    console.log("*** zkABAC script: Computing witness ***")
    let witness
    const value = `28`
    const salt = `123`
    const h1 = `247057619414512340575091042953344278943`
    const h2 = `45785832029177946190796587969520538188`
    const target = `27`

    let a = Array()
    a = a.concat(Array(Number(size)).fill(value))
    a.push(salt)
    a = a.concat(Array(Number(size)).fill(h1))
    a = a.concat(Array(Number(size)).fill(h2))
    a.push(target)
    witness = a.toString()
    witness = witness.replaceAll(",", " ")

    cmd = `zokrates compute-witness -a ${witness}`
    console.log(execSync(cmd).toString())


    // Generate proof
    console.log("*** zkABAC script: Generating proof ***")
    cmd = `zokrates generate-proof`
    let sum = 0
    const trials = 10
    for(let i=0; i<trials; i++) {
        console.log("\tTrial " + i)
        const start = Date.now()
        console.log(execSync(cmd).toString())
        const end = Date.now()
        console.log((end - start) +  " ms")
        sum += (end - start) 
    }
    proofTime += `${size},${Math.ceil(sum/trials)}\n`
    console.log(`${proofTime}`)


    // Verify
    console.log("*** zkABAC script: Invoking verify to double check ***")
    cmd = `zokrates verify`
    const ret = execSync(cmd).toString()
    console.log(ret)
    if(!ret.search("PASSED")) {
        console.log("*** zkABAC script: WARNING: PROOF VERIFICATION RETURNED FALSE ***")
        console.log("*** zkABAC script: WARNING: PROOF VERIFICATION RETURNED FALSE ***")
        console.log("*** zkABAC script: WARNING: PROOF VERIFICATION RETURNED FALSE ***")
        console.log("*** zkABAC script: WARNING: PROOF VERIFICATION RETURNED FALSE ***")
    }
    else
        console.log("*** zkABAC script: verification correct ***")


    // Export Solidity Verifier
    console.log("*** zkABAC script: Exporting Solidity verifier ***")
    cmd = `zokrates export-verifier`
    console.log(execSync(cmd).toString())


    // Modify zokrates verifier (remove Pairing code and import it (clash of names), change name of contract)
    console.log("*** zkABAC script: Changing verifier code ***")
    let verifier_contract = fs.readFileSync("./verifier.sol")
    let arr = verifier_contract.toString().replace(/\r\n/g,'\n').split('\n'); // Split text in lines
    arr.splice(7, 137) // Remove Pairing code from line 7 to line 144 (always identical)
    arr.splice(7, 0, `import "./Pairing.sol";`) // insert the import line


    // Reconstruct contract
    let code = ``
    for(let i=0; i<arr.length; i++)
        code += arr[i]+"\n"
    code = code.replace("Verifier", `Verifier${size}`)
    fs.writeFileSync("./verifier.sol", code)


    // Store proving key size
    const key = fs.statSync("proving.key")
    const out = fs.statSync("out")
    provingKeySize +=  `${size},${key.size},${out.size}\n`

    // Rename files and cleanup
    console.log("*** zkABAC script: Cleanup zokrates files ***")
    cmd = `mv proof.json proof${size}.json && mv verifier.sol verifier${size}.sol`
    console.log(execSync(cmd).toString())

    cmd = `rm proving.key &&`
    cmd += `rm verification.key &&`
    cmd += `rm out &&`
    cmd += `rm witness &&`
    cmd += `rm abi.json`

    console.log(execSync(cmd).toString())

    console.log("*** END ***\n\n\n")
}

fs.writeFileSync("./provingkeysize.csv", provingKeySize)
fs.writeFileSync("./proofTime.csv", proofTime)
