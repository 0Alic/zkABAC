# zk-ABAC

This repository contains the codebase to implement the zk-ABAC.

## Abstract

...

## How to use the repository

The repository contains the Solidity smart contracts and the test files in javascript following the structure of Truffle project.

### Requirements

- Truffle, to compile and deploy the contracts: [link](ww.com)
- ZoKrates, to generate zkSNARKs proofs and deploy verifier smart contracts: [link](ww.com)
- The NodeJs modules in the package.json

### Contracts

The **contracts** folder contains into ZoKrates verifiers adapted to be imported together (for example, removing the Pairing structure and change the name to avoid re-definition compilation errors) and the zk-ABAC contracts divided into two folders:
- ---nome---: a first version that does not support the revocation of a credential;
- ---nome---: a second version that supports the revocation of a credential.

### Testing the contracts 

The tests utilize a private key to sign a message. You can change the private key in the testing code, or initiate ganache with this seedphrase

    ganache  -m "family dress industry stage bike shrimp replace design author amateur reopen script" -l 100000000

Execute the command

    truffle test path/to/testfile.js --network localtest

You can find "localtest" in truffle-config.js.

### Execute the simulation script 

... with did-jwt