# zk-ABAC

This repository contains the codebase to implement a zero-knowledge attribute based access control (zk-ABAC).

## Abstract

TODO

## How to use the repository

The repository contains the Solidity smart contracts and the test files in javascript following the structure of Truffle project.

**This repository supports a scientific paper currently in peer review.** Most of the information will be on the paper once it is published.

## Requirements

- Truffle, to compile and deploy the contracts: [link](https://trufflesuite.com/)
- ZoKrates, to generate zkSNARKs proofs and deploy verifier smart contracts: [link](https://zokrates.github.io/)
- The NodeJs modules in the package.json

## Contracts

The **contracts** folder contains into ZoKrates verifiers adapted to be imported together (for example, removing the Pairing structure and change the name to avoid re-definition compilation errors) and the zk-ABAC contracts. The contracts implement a reference example. The **test** folder hosts the smart contract used for the stress test.

### Testing the contracts 

**Reference example testing**

To execute the tests you need to run ganache with an high block gas limit, e.g.: 

    ganache -l 100000000

Assuming you have defined a Truffle network called "localtest" in truffle-config.js, you can execute the tests of the reference example with: 

    truffle test --network localtest

These tests are used to check if the smart contracts work as intended.

The folder **usecase_scripts** contains the script to integrate the verifiable crendentials with the smart contracts. Install the dependencies with

    cd usecase_scripts
    npm install

and execute the **main.js** script with

    node main.js

(remember to have ganache up and running). If the end the verification of the proof returns TRUE, everything worked well.

The **ptp.js** is an example of policy translation point of the XACML policy in the same folder.

**Stress testing**

The stress testing is done by checking "how far the system goes". The contracts used are in the **contracts/test** folder and they are generated as follows:

    truffle migrate --network localtest --reset
    truffle compile
    truffle exec test_scripts/exec_testModular --network localtest
    truffle exec test_scripts/exec_testMonolithic --network localtest

The migration script calls the js smart policy generators in **test_scripts** to generate smart policies. The ZoKrates verifiers are already generated because they require a lot of time and storage for complex ZoKrates programs (they are in **contracts/test**). The proofs used are in the **zok** folder. Be careful to use those proofs because using other proofs won't work with the verifiers in this repository (due to the zkSNARK setup).
