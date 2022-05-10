// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "./Pairing.sol";

contract NeltenygVerifier {
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
        vk.alpha = Pairing.G1Point(uint256(0x1cef6447db47199c6b365711585827c971bca45a47a05664028dfa32326b657b), uint256(0x1e836779898b91874c2ec469eeadab0332219f0998b0d5515e280a45f7230505));
        vk.beta = Pairing.G2Point([uint256(0x040641c1454d230a33fdb98a7df6da78ce920cc84b390ed2caa331e1e2005a3f), uint256(0x2c10a4e7014d1a16c668c5d4d3742af065f5886fb9b91dd8354a3f4d34753628)], [uint256(0x06e12089894396d771e1d898b4afd2df7a88694b15f8392d4c8d8908776e4413), uint256(0x0653e62e3701ee99ffb5d65fc930b05703e26aa5b8236966bdba3412b99ea221)]);
        vk.gamma = Pairing.G2Point([uint256(0x04401a5de42cc5d798ed03be1ec5e1ebdae5f83017243301260473ff777b733b), uint256(0x02269ee45d76cd6f413182b329c07386b06379bdf73627b7496ae3c8e2f217b8)], [uint256(0x27d10e92b162e599c2f686cff703f7a8e3804841ca2d986aff34e839e8f79f93), uint256(0x10f1e0e3a94355c58839b96b94b4f57ecdfc50aaa2b1f4eb6a42dac0bc3b14cd)]);
        vk.delta = Pairing.G2Point([uint256(0x04220560c5ae76739a9527e31188b1f067a698ad30df7ac2d53c66803c7f6bc2), uint256(0x2dd5436058269738bd9f7a61a0d1b17ac98aac933820c5b44aa9661aa75a6d31)], [uint256(0x2851cc93af1fef67643bc474b0821eb53ef99235e6343cded3f9964b0c9e841b), uint256(0x1bcd5a9e53031ebd08e74f6dff5c6b21ee2d58f855fd38b4973b66a92b163858)]);
        vk.gamma_abc = new Pairing.G1Point[](4);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x01eddf62ba2f6cfc0ab6aa016e2eacefc46cbffcbd4bebf70664480bb4c97b97), uint256(0x2b09f004301bd4876f5487481ab0a09834ae7c3d027228c8620cf595e8f51be5));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x18f09291f73d5c6c455c3f2b848c99168e52a1f4440d248020798845300db74b), uint256(0x1e624949d5be8a30f14b4b91cba4cb7db800e0ef6e2770f4aadcf93bd02bd02b));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x1646d28a40194dcb86c0a3b65bea2cbb3cb31454e07567b18e72c1c5d5f2ad4b), uint256(0x1ce06e33696f72e7be74ab51fd8f82536a95292450a786bbba43861f6983238b));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x0020d77906b6639df240c80bd91c5b17dacf87b8e884a461ea8036d00eac41bb), uint256(0x03f94fde1f77a7b0e73c98aeee2698720956df1187bb05b4aae8afc5287ecd85));
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
            Proof memory proof, uint[3] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](3);
        
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
