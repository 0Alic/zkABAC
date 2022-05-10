// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier20 {
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
        vk.alpha = Pairing.G1Point(uint256(0x152ac5439ee1a67ace015d51efbafed654b73958a64595b53341d841f03ee35d), uint256(0x22f6e05e01ea5477a7578621298e50b4b2b967949e4000ec85b189ab06501120));
        vk.beta = Pairing.G2Point([uint256(0x02cb4fb2be79260bd60659288b0fabe8f78ec7e50980428fc3fd48ecfedff767), uint256(0x0dbe6f5907a7251a352255bbf14c3446cbb903086c368c281583f5df009862ec)], [uint256(0x0a372f929bb03f1cd846b93b334f8b7759055c221ff285c1b59fbc6692b7c1bb), uint256(0x066afa2d12c4ae99aa5f840bb6ca001480c7d0957e7422c27cdde335eda7bcde)]);
        vk.gamma = Pairing.G2Point([uint256(0x09fe5d4f23cbbc3f9d33a52da0a4ec45484f20a0fd1ea3d309987d49462977b8), uint256(0x18e12bbd0fa4e78342978de8d8f614f8fdd0c4d0856a9756904262de1596d65b)], [uint256(0x28339c6f38338d1e928aa119629a48efe48ef4e164363c24dba9b6dc1249f0d9), uint256(0x1a8cb129286de2545b54c7671f8daac4f5e6ca980bf9b7aece11faa7c23032f3)]);
        vk.delta = Pairing.G2Point([uint256(0x0f743959f0996f1cf02c6b0b544e1ad31517bdabf9632bfb9795960dc16d4b29), uint256(0x0a3ba6038cbc26f2492ef00ec108218046010794285d9debd82659bd01b8c598)], [uint256(0x2306acd5071cd5fe4df200ac55c8e2b010157b749e879310c0e3b135c35a5fb1), uint256(0x0a078581dace6fe29e80abb9ec685770eb273529c0365f34085355ba72e701ab)]);
        vk.gamma_abc = new Pairing.G1Point[](43);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x074102d3661770631ef9e822c71e497ddf2d18964319e03bc3579129ab743744), uint256(0x11389aa0b77fc467cd2a2139d36c07e845361dca36beb66c4d4a39bd647a1324));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x1f11c93341b255ebed642087372d0101ea989369e1db5036c0784cfa446342d6), uint256(0x057d18f18ad738a4b267f8eba9ecf7b655f98a564aa2dba15233dccf9623f481));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x2453ca439932cd3e96df16a12e46fd6c1cbb69aca94467d2e79a743144441200), uint256(0x29b63f60406459e92e9fa48a73f624efe60bad79748d8dd25165b944fe5dd1ff));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x1a03979ab2fe2c26544e7bb0cc1ab7078dbe5ffa19f057f690e738236e3afb12), uint256(0x06b824aab4781c46e4fd69bb526374b648d7e02e0621f2f64645d0ed42eca461));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x2a127f82a2b9faa8be06590664eadeacb392c2c2317fd91c7afd9f30c5151fd6), uint256(0x1bdcd09ead49bbcd9013af9d1ec965b1a7570053c5c280682abb3b01f4a2d7fc));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x0747fddec7c2e80d9c7bbe57cf3b129e14bb58bfc2cb20a495a67a492ed46eed), uint256(0x10bd063f54d313f0011c2340ba852cf9846b2a01110ac221f064dc5066f187cb));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x2506c8490e5f1b1e57db9246e4f487453b19cfcd572f5f5dd2569d28c8315e56), uint256(0x13183145e875611553ec8d3438cadb3e9fa8b067b6121230a95a72a0e4061a63));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x120d8b216edc4c8804878337a5459de30c77a17c35d41b81bd2bf2ea010e1c4b), uint256(0x274db7255376641e2927cd955ddaf21a55193a457d3007b61cad718f61204a4c));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x2b531692ed3a9f28e682ac247246943c3a1adaa332c45e79efd193061f8fd1d8), uint256(0x22b2ae041692d4d5608d5d49514e3b91606729605a1847007015522074c3c4fc));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x241c2963cb64288f7186dd283de486256e8900b645f429d6aaa64a1031943046), uint256(0x05969517ff68c190709afc999ed5ada917d09a00a00cced9062de602d996c14a));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x104abbef37322066cf59956d59f48679c2570f642d80736223f59b115163e952), uint256(0x2cd88701dead23a04c2889a473caa7f0695b54a9185f65a83c98f228dc8d777d));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x0c6331087f27b5020fbd45502410b8e0e36739e7cab41f23bab9fa8dcfc4a4cb), uint256(0x0af80468088c13b67d97157f96bc27299d454d43fac2cc0aade4a3fbf166111a));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x2440212c52ce6ce6dfc46d241a76e95cfcf93d4545a701fec30890e5e61684af), uint256(0x243017542de0b9914cdf559f18964925e1b0cfea13b718a0140ed2a8a41757c9));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x052e92fe2de94b4e0ff9f3c548b6e5a43a9e00afa33e044e6e64e4f0654aa2df), uint256(0x0eec09c937ebaefda46d730c6da7f60174a76fb2dcd55fe114f0f6c602ad0af8));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x0f3ae0cef90be1ba63d529fe8578562ee19d923b802b2d98b84982e487e657d8), uint256(0x1556dac99a94bce0d7ed4d2245c42b8e98e743d02fe6cb307316476c35941258));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x2abd3ac7b933bda0d014693e0a7c989b49f77a45602fa9aa08bd8c726691dfdb), uint256(0x2ef9d2b23e17c3357a81fb8eeb39b050189e150d81f9aaf06d4effa1e806f01e));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x29bf80d8c806d0aa8f51b5ccee283f25709aa2013f4b03aded6a7045c31c3915), uint256(0x089fe897bf00cd97be4b67376e7a26ed15a825fa5ce5b0d3b816c12d61ff67ec));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0f1b494ac03e85184db0340f9ca487309ffdaac41a000bb752534c33d06c4276), uint256(0x296510ae3be83dfc5f0137392773271f67fcd1a250c90824f86390c0b59cd9ea));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x109c852c52ab486104fbd611edf4c66cb421a4ec7578abd6afcbf538af5db951), uint256(0x1c5e8ece44ea5ebff9dfdd94d6d43b76f833c06a26daaa937bd02245e40e7ea0));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x23a2134fd4c2de749bfaa66acd70a17ada977a613dc2f082fd6592fd0661b010), uint256(0x18c7d47534bb4ad3d1508cc29de735da59c451834bb571b75be74ff1dd56c101));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x1fdc2294565ef24ce997711894c3eec3529b7bd74b491ed4601e600fd0abce3c), uint256(0x233ebc3d2f5c8dd08a1cf08d74977bcd49e88c76d49b4d07b8c41ac9b1c5b0a2));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2513ddd4431d4f00e7499c9e27744e39093efb144955abd9056f004963839411), uint256(0x0859b7df975042e5548a1dbacab44b446acabcce3b07a579596450eba6d5e2fa));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x1cae4b61e83a1f03d2867d8672cd459a98128746ae013b2e5bbd268736241f2c), uint256(0x22e93e22fac4c8c7e2b74644db7b6c14debc66056cd6fd32b33540d875139862));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x1c031832894ffdfd02cd318adfc2053a7c4f5cbb20289f18ac9cdf165c41ea8e), uint256(0x1cce529d1b74f4576132e110c6c9b32ca00e40086f7905c3d029dda2556f5d06));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x1ba24e8643a339c80d9842ff3c134cba5c5580cd60c6603b78cd3fef1f0b2e78), uint256(0x20da0d63fb48aecde97dbe3fbf53bde04d99ca1d45f9efb8b30d1100e18c7e85));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x199613277c61e41e3199bb23afb13f6740f9619a72f67642a57b37160384d9e1), uint256(0x0c94ab41729563f167d30f15e8b92f6701567beac2a677b808465f1eef0a1c60));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x2f5d9b4b6871b1378a8982736ed877e900fb7b1af22f62434e2d2744b1bf4aab), uint256(0x1548423872b622d8ed18ba4496f4fd51043f4ad9d96b5276f2b0246ac003c088));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x248b3ba060e7b3594b26aad0ada8af5b9a6a0782b6044dc25244d662e695fa73), uint256(0x21cad54194d9cf334fcaf3b3f1201c88011bb9ba7b801b43fc4f95809a04d5d2));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x0179e66c066a75e811348cfe470f664ba8d011b9618d615af4481aa53a4dac49), uint256(0x1188df9360c974d6c525f3b90a4585c4e924d2bd77d114c1b738681959d8bb20));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x129db76a1ce831ce017341cbf39d1f1d2dcfbd3e94c1dea019557d80bf3f6e06), uint256(0x03350925dc0bab2acf11f020b29bfcc8a543dfa9c336dffb26f4d21540bacd17));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x1eafef52786201a3eb97c4de39b1448971289ea005e6dc069f8c89564fe352bb), uint256(0x24ba9d1e256f133d1ef236183a25b8cb051c4132ae7847a8fd3e51ed005b1763));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x010e2eae5b747223bf9c834795a78adf52fe8f995525733234577f2f24b41c86), uint256(0x0513866521236a2c74dffa5bb28bedb044948638fc29c1e571d664135bb50616));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x23c19f7c9c8fc16412738f03c91bdeebd971f18db776075485f9a021b82d51d3), uint256(0x2b105e1e06296a245b056a7723d62ffa6a5308c2b90bfeebdf4885fdcf258f5a));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x1e0e5b85ffeddd7f8e86f89c7fa7821d3c9bd83a556cb90314578401f34fa95a), uint256(0x05510513a643f39d2a5b5aa54f596b1b42ebeea7037beafa99e93ce25784498e));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x1fd1a68f3df6562dbd0c55b5343cfa6ff28dca9bdb5e8b7bbe27005b30eef7ff), uint256(0x04c20098c67d18e06bca63bd70277a353d0791bd90946ddf808d09a7fdcd56cd));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x1c126276879df01d14353236729e9de0a39344bceed57e180dad0fd7c5d1648d), uint256(0x0c8f6498edfca277b11412e5aa30068261d215de0936280e1b0713db9bbcfacb));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x3048d8c9b423c3db8e19886c53308c7be1692c1667becdf87aecaa2a5d4e714d), uint256(0x04d3032ed41584b3faef75650b4b82264c754339e373be571330b49788688bfd));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x2b8fcdf0fac4fe6f877b4b6a8ba45ccb0314b81930ed9281bb08ff8f2b06807f), uint256(0x22a2d72a4a214327f75916ce1d089165cab5152024b27b6a7919be57974d82a2));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x19e2054e6e6092d769bc724252c7321be679987a0c89d4026b254d59354e5077), uint256(0x124326ea527b95a1692444ee28e833e9f1d7e5f7de386d2034bbe55ec85e3bf6));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x2e3a6a5b96c755864a488be66acb57d7646761ba322c3b3413cb410d9c3f2f78), uint256(0x088a83777e970581d8c1c36b188a6187d173b60a34328adafc7314673ad3d765));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x058bbeccb407cae465144aead60bcdf81340de38522c2370ff6411a7116dbadf), uint256(0x2f73722f461909a2c4d8fcb253dbb0639497c0f96701dfc108f4f8b7d0bb3d12));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x1705f048587a1806e03ac36a6c18f3e7c38b58e020e951bd2461da7a57fe9e1a), uint256(0x1f2bc0c2fa67469911828003aabe66889bdbf1e02b21ee407e56bdae0fb4ece7));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2735c642b0082c664ccee551e241278f774aef1de0d30045a302a26c12538844), uint256(0x28839d418eaecbfb2808a47d61891a7dc8b2d006804baa2f30b02e28c8769244));
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
            Proof memory proof, uint[42] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](42);
        
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

