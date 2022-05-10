// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier1 {
    using Pairing for *;
    struct VerifyingKey {
        Pairing.G1Point alpha;
        Pairing.G2Point beta;
        Pairing.G2Point gamma;
        Pairing.G2Point delta;
        Pairing.G1Point[] gamma_abc;
    }
    struct Proof {
        Pairing.G1Point a;
        Pairing.G2Point b;
        Pairing.G1Point c;
    }
    function verifyingKey() pure internal returns (VerifyingKey memory vk) {
        vk.alpha = Pairing.G1Point(uint256(0x0facd5d1bf702759ab1d11af163477d4832b227643cd6c7fe0ff347df5e39250), uint256(0x18bd9954e64f63aa802ff95fbbda3cdc63eec1a667cb6fcd2fc9b8e60e2c1a1d));
        vk.beta = Pairing.G2Point([uint256(0x203a51320f81e2be81b2830eca4b1bf55e5198ec41d60e6155df133df90a6d77), uint256(0x14c41b0f29e2eaeaaa1a03bfc0c426a3e2a868f28ce9bd8fbf38368bab82fa2a)], [uint256(0x023004b08208d3b2596472a9d66ec363e3786530a25358045dbc69624371f2a9), uint256(0x13354680caf6fa22e2ecf25f553737ee67e7f3fafa3afee6dd90f4ecada78107)]);
        vk.gamma = Pairing.G2Point([uint256(0x016c9488e816e568faa88db9603a93c80e7acad7b13189cae0ae3beb1159b00f), uint256(0x2c2070629f7341d9baad232c0b0af0167280cd2e2231a71f0f1f180dd096189a)], [uint256(0x0c274b9a67b1068ad560ca399f92af545bd1a2e8283dfd43cd4488bb5be183e3), uint256(0x17cf81805fc7d7fc003045df5a440c0f0db22b3ffc31e099ffa823ca32f5dad4)]);
        vk.delta = Pairing.G2Point([uint256(0x1df83a9c22e0f1cf810c65c4ae9fab3f8a9ed03828740558ed94fe5cc304e4df), uint256(0x2bd1d1b57341b89580b15e4277345e73e60d139f40b7637ae6d795d31f143323)], [uint256(0x1a62a632cab2b9260b6f5ad3bb41c7925acb59fbe87a7348400c044dc7e197a3), uint256(0x20a2e75691fca9e50ef161b436583244c09f7dfec9d7c8699bde877b6a414c20)]);
        vk.gamma_abc = new Pairing.G1Point[](5);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x236d8c9b4eaf186b6ad2722360e5fdb2cdd411ea5cde2f8bfb7a37e8a1ee55d6), uint256(0x1677793c2ee1fbb7f6c8dc3e1bad907b000a9a7f087506857155d2acec82415d));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x04326d5f6b026058caf077d65985a4f1cf103d5dd93a8de5c9e323cd8ed5773c), uint256(0x22d1866c68ead275b217cf1aa16c93ad22c016c16329f33253b6e21a3da359ad));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x048538abe6bbaebd0a8a2b1d69755cc19f4c5011b0ff5e3c8b6bc1b4459f29e4), uint256(0x089771492096fe320655b4e79675191b7ab361e0346e9fc0aa976bc679b8d32c));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x270a6b6baea9bada696bc6bf948a9f4ab92080b8c447c66232637553b17db860), uint256(0x0834f356c00f0c14c70cde0c1fa89519414ce27ded06eb2531925cc497439c07));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x2aa3ff726362f3f1d8db45f1e6bb03097789cf2351d858d65cee179260131b55), uint256(0x0cb8d0b9c45e11c45a9b726e06e4ac8325791dfb93bc0c58545c889eb82d3046));
    }
    function verify(uint[] memory input, Proof memory proof) internal view returns (uint) {
        uint256 snark_scalar_field = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
        VerifyingKey memory vk = verifyingKey();
        require(input.length + 1 == vk.gamma_abc.length);
        // Compute the linear combination vk_x
        Pairing.G1Point memory vk_x = Pairing.G1Point(0, 0);
        for (uint i = 0; i < input.length; i++) {
            require(input[i] < snark_scalar_field);
            vk_x = Pairing.addition(vk_x, Pairing.scalar_mul(vk.gamma_abc[i + 1], input[i]));
        }
        vk_x = Pairing.addition(vk_x, vk.gamma_abc[0]);
        if(!Pairing.pairingProd4(
             proof.a, proof.b,
             Pairing.negate(vk_x), vk.gamma,
             Pairing.negate(proof.c), vk.delta,
             Pairing.negate(vk.alpha), vk.beta)) return 1;
        return 0;
    }
    function verifyTx(
            Proof memory proof, uint[4] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](4);
        
        for(uint i = 0; i < input.length; i++){
            inputValues[i] = input[i];
        }
        if (verify(inputValues, proof) == 0) {
            return true;
        } else {
            return false;
        }
    }
}

