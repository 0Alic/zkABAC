// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "./Pairing.sol";

contract GreaterOrEqualThanVerifier {
    using Pairing for *;
    struct VerifyingKey {
        Pairing.G1Point alpha;
        Pairing.G2Point beta;
        Pairing.G2Point gamma;
        Pairing.G2Point delta;
        Pairing.G1Point[] gamma_abc;
    }
    // struct Proof {
    //     Pairing.G1Point a;
    //     Pairing.G2Point b;
    //     Pairing.G1Point c;
    // }
    function verifyingKey() pure internal returns (VerifyingKey memory vk) {
        vk.alpha = Pairing.G1Point(uint256(0x1c610f317c3c696de960854467202c5c9431758d97f55f98394b591d0f5de3a4), uint256(0x0aece9c54af770d8c41a33b23666be1db5db01182218cea78cafbaac07921255));
        vk.beta = Pairing.G2Point([uint256(0x28d73f239361de2948c6bb93c51c8b9ed5ccc42d69e18bdd4948e5ac626ea6b4), uint256(0x26e3d4e50aa96013cc07d05d237dad342e33b6783afa5f33381a94d5db987af9)], [uint256(0x059cabe2816a8dc952fbc0d6049fb4d50f8c8f866c323fdcc10bd0618efde4b4), uint256(0x1dfe99476db79a75a64bba3224d3ac289dc35ee68bcdf2327d9762d034c882c4)]);
        vk.gamma = Pairing.G2Point([uint256(0x2a8b1f95d08ff0afe7478447f7106120fa14679b662eb947e8c62f7daa1c1d92), uint256(0x03bae7568524d7371bcd0b92e82005f817ea5d18e43610f015a4a482eee2e0d4)], [uint256(0x07f878fa9e23080cb0afb0023d7168f11ad2357dea22c64f71f6a02513e9d582), uint256(0x02c95847f4e9568472dbc0ca59cce271f11015e9b65e545f9270ab6773221948)]);
        vk.delta = Pairing.G2Point([uint256(0x1073d7b7eed1d72ed6c48e0eab08063440a3c342a030e91adcc4185fad144084), uint256(0x1c7aa101904262d10ff949108413184dd918971ecaa44a47d8b3154db19324bd)], [uint256(0x1f43d8fedde4a0c897b6914d9285b777860a519540f1a1df76eec92b5b978147), uint256(0x112fe56867b5ea0ec5c9d3f016654f7ed79f96f9904b6a06444fd2e50f46ca6a)]);
        vk.gamma_abc = new Pairing.G1Point[](5);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x2ff26fcb866b9876658b368c9541052034e54853502f78f214004b24bdb2d72e), uint256(0x03f91b7a09e3f1819b3d15424909ed2894bbc0336a209664fba4ec766d84bf11));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x11ded9435b506289ede58746407dce4c4fe3c3e50356cd0c220a6d2cd98e084b), uint256(0x2c85879b431ad7cf6aefd6bac53469ba1c56edfc2acd7f59fb656449abdc1681));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x023fda4cf03eedfca7bda194273af479d37d1dd810b40c442919efcc60a8f3af), uint256(0x0a428196d8abb4decd718b24e377ffc4144d4cb3b341af025c442a5be3989886));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x081214969228b7e58e92feeb6d997253b8ff7db047e0cd645845c660f262d029), uint256(0x2008931d39bfbd34a56addf06eaaa524730e8186756550a785eaac96b28b632b));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x09de8a90c43a965330ec2b2fd843dcd28e3377eeeec95317aa669eac8a1aa567), uint256(0x14a6ff7a328e5b99319aead659b3609518b5333952afb29c0a6316eca4310974));
    }
    function verify(uint[] memory input, Pairing.Proof memory proof) internal view returns (uint) {
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
            Pairing.Proof memory proof, uint[4] memory input
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
