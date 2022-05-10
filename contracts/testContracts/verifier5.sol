// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier5 {
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
        vk.alpha = Pairing.G1Point(uint256(0x25c657ffd64eb62235dc290abf8bb8c9f194c3083a7461c7d1c7fdaa0465b565), uint256(0x1f501e5af7d5a77b0cf47e8585a1fe1c01d6625ec70dd93e48f2f33a89bf7e49));
        vk.beta = Pairing.G2Point([uint256(0x0f61dff1b64daf7027963ee9714733be011a5236f3a08c3e729f22903aef7ad6), uint256(0x2aeaa0eb434f4aedc297a62e313bfc32ad58c836f74b96057f9008b7144b4a58)], [uint256(0x090f947dc5ca3c3572350fa450ffecea23718fe8dba847fec7ca766c741fbf0d), uint256(0x1877c7cf50a72b943b70f8de80b484c9fbf2ac2a236a81f43cb1f690520750b9)]);
        vk.gamma = Pairing.G2Point([uint256(0x006f8d84e65dfb6ed3b098c63b3de7a941de7c0ac74acaeb471f4cd4980bb706), uint256(0x1aed555bec4603d4a74b9add80bdfb697c72a7cb3c539c656ecfb9fdbb1ca00d)], [uint256(0x132466826c871cc4b7df0835340c92f24ad499278a342b85cf0eab681934a371), uint256(0x0790ebd3374f8e4fc8847271a6fe1de6fac20683b8e7156b59d4d7365e68cf36)]);
        vk.delta = Pairing.G2Point([uint256(0x214fd8f0c08769f70a3c1b97c442eed1a9183b4122c05c654558a71028773edf), uint256(0x2e8faadf865b8bbe75e4790f0aac59c006f26093f395ac2b15fd5e2930e19b3f)], [uint256(0x133755f1d4a22081f6f363d41e8b469834125182dec9e458eda7baff2cb02fb0), uint256(0x05ffe2c5e80da0d27748be607d2da32436b5b9192185dc93084fadc64dad1fd2)]);
        vk.gamma_abc = new Pairing.G1Point[](13);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x22a51ad38e99d02e1cf5ec8dae229890deb8dbc60f8bd99ff37d4c6e13bf384e), uint256(0x3050c3ba522d6ac7514cec24bc889c378ab6115c36122b6a8495f6a90b68b377));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x0085cd243c57780ec7e2d3937d821ae54d32e93852862ecec30414c85af5cf0f), uint256(0x0b48b26e2314168d4f67bb14106d558e752ecd50a3d7325fca5b95e1ba78397d));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x2d5b518857447a320cae57a20f4eb8fa44222d953d6b83a282bb2b93acefc073), uint256(0x2d95d2ccfa97d78fd745f263c161fc99bcdeb3b7981c1c7475bcea24d5560825));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x27bf6968c2f9090d177d0ed1e81f4e26e96baf016945cd4ff75163e5c67941c0), uint256(0x0a50537ded5353c8f37899e87b0fbc84ef01ff69953b8bf88f96cde09451d2c4));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x0dfab1ef76fb4810125eb37f722c0d22f6ce3f40a7a538fbbf0cf2e90ec354bb), uint256(0x17a493eca80456c5d105b224a4c46f36cad3b87f0f7e61c39cc4a12461b321e5));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x153216503d14b9147921a25e529a5436620516290c8c37a25cc2ecdc935e5f04), uint256(0x1624a52e7b99e74f7a1746b30d561b2a79b0931cf25c7079db04572cae105ec8));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x2c5c50d7c8cce25a7a60dbbb6a6bdef9564af0155b5760083918486528898050), uint256(0x141e9f0bd38ff0881b3cb5395c37802e6cfcae7538e99cedd9ea5b49509d8751));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x15fbf4e63bed091e2d08464753448ca540de892cb3be5ef95494a857a60ec947), uint256(0x2b6f451666125a0075a89c6de3535f1d1dd4ebc99687bc58dd296a6f1442bce9));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x2439e742655b39aed27fc03910741fa3aa950b18378e18bea579eff351eaebe8), uint256(0x23d40f4ef284fa7109570ebb12d1139c2c405e7a48cf199d6908ccf77c3596d2));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x2dd48468c2f822ff6cd8f72c42fffde23ffe56ce8da2d8328fa959555dee9033), uint256(0x2d2ac9d98f75ec9cdff566451919d8dd556bbfb3e574ec0a360fbfd23d51b98d));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x0a81dfcaf46baa00058860c35d4520435c8170300aaa4a85ee751af23ee8c2f0), uint256(0x12abe9621c65f1f9120409ddb01f2f5fa7fb3003fa91a3443a6fbdba8f6c62a6));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x2c11ad405a661a52190317fe93f7836ba4bb67b32b7926f2201fd8869b9e4d20), uint256(0x064d89352d68bca16a510950a983a369888c5c94df308225c1a769450209a2cb));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x00b0e6efa5b6aa901473087c1054c92d88bbae892d09b4db6a8f2f81e460de75), uint256(0x21a2b624f537d720291df251375298e260bd5f63dbb9d1ccb92808752af62e8e));
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
            Proof memory proof, uint[12] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](12);
        
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

