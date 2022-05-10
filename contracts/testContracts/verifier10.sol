// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier10 {
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
        vk.alpha = Pairing.G1Point(uint256(0x12e354aafbecb03f605d5fcb6ed0522b932ebab45547209fe6182190c40ce747), uint256(0x1ab5c22f8a4caac5f79c7fd812c89066588fe7397b84fe228a593f5bd3f0eb06));
        vk.beta = Pairing.G2Point([uint256(0x28f8fde08d3137ccd0f3c98ddc4bcce6ed0655af55aedb06235456c86fa2ece7), uint256(0x12e9cd20b872348e90bbf438df8e9a0b7f44a20fae9a5033ac5ec5878cd1a84f)], [uint256(0x0a098b6ea44ce6b3a4dfe82e0894e44c47e7a17446fd8f845f66f8218e8a4868), uint256(0x1998563afc23478dc0b7418edac6e241eeda04880ef2c08bee524b2d92d5002e)]);
        vk.gamma = Pairing.G2Point([uint256(0x0847512a9ae7e91a5ba59b596680c0bccc635457e048c4385f68d8d84ace1c09), uint256(0x11626c15fd4f7a8d4e1b7f65f788fb1e9c7ff2cd22263f18ebb2d298bac166fa)], [uint256(0x2b1cec7fe2f843071259855f06c2826534a612529688e5ad9b399c229584c44f), uint256(0x1a0a846bb76c2ec679aaa6ad1d47557783d27cc994e6e639b72135f4cecc1bae)]);
        vk.delta = Pairing.G2Point([uint256(0x2f1abc2063f8e0ac53b68be40a61d91b98cd58e4e70d9ce90c045b8ef1b71b08), uint256(0x0d1f18ccea519a5223dcfd8894324ad78be6f71635f97207ba612016d45e1ed3)], [uint256(0x0ba39baa27ce7746db0e76a851d20ba046b7c421d35229e96910f6f492c18f50), uint256(0x10122245a6586c64ea9222bb9a37ba25bfc2b64dee4ec14c93121c156750799f)]);
        vk.gamma_abc = new Pairing.G1Point[](23);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x0a22fb3c89ebe17f9bccb89427712d1e390049c94ed09414b3360435a79e88ea), uint256(0x1263d3170c43be2659c2b1d98c81e860d7e5ef76ba13aaf760e7b4fefa6419fb));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x15af06e772066d7e93a01327734b2ade29d2c0aebba0061f1e31184c0504c2a4), uint256(0x0abe207232bc8787d142473a1e2cc1ef4e129c02b74f47551a1e2472fff9733b));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x2e39e01ab82022ddd8430b36d6df26a77cef4906a259f12dd3e9e22cf92bc713), uint256(0x18cf06536c78a99b807a24f6a97af398d034b603f25ef051e5fa3b6788c70791));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x242599203d97ec8b7eaed685b903ff1152f0fc295c440ad76b7c924d2fc6bd30), uint256(0x016afb7d427e6042e9703305b74952863568cfd0e77a25d9c185cd42417043b2));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x277125d376125cd818bf7aff1ed2392ff56fea40a7e49471e6cd574618d0c205), uint256(0x1d36607817f5c4bdea877a6344f2dacb5cc42b7758d336de5b74214cd6278e67));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x14dd83f287234e6d06bf838c475a45ff9e21dccb85b38a8f0e8fe137aff90379), uint256(0x25bc4f66c606c60071338a812d3bcca73bc46921ec1a6fe2fbf381f18367406c));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x23552175e9ec0be2229fe5ab7d81ffad938e63a2c6fbb5691bf8d76feee7018d), uint256(0x22d666dacf74f98c5643891c15987feca465e9202cdfde45a2ad9c2e1a9218b6));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x2905dd6847d12b835e4ddb28bff6209b63c34ec3b0a4e997311c79a5e716b393), uint256(0x203e1e3aef3615fce9cb17324ad764d6cbb7e8c91ba6bff93ed15032df6e7361));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x142d071e8cd651f816c1072b101489ddbcdf33f6a68e0127274213fb05c001ff), uint256(0x1b88f534aee1772d4572ec4cc5f5d05c15218ab3eabfaf9ed8a7d6a0a1815b8f));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x28fd890508fd4cfacc60c2a04a9a1310019780cd89d2e96fa01b0e0c2283128e), uint256(0x095ed3785e829ebc9fc11b2c87f3bad3ea1f9bddf1d7c14d5b2a51e68bd9df84));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x1765cc6beb689c81b978b0e4b8c0966f193aeebee9ed2b8406df0ce4d49d5510), uint256(0x16a913a233551298845ce1f9b668c7840544de2a9beb02e5ab3b1c8a7006aa63));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x1af65fa8c04013ebfff39e018bb4fe653e2b2cd71ee01934b661d31a83cf7d4b), uint256(0x1d9fae0eca345a13d5944d7c7769cd2933f914fa59f466e74b9962bdf06526bf));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x0c5bb670ab6f3ea3edb5a37bb817a85eee145f0ce349262ac305e6bed2c47adb), uint256(0x161a3233f8fe50cf5df7aa621ed1a012e6faa447469266eac074fdd41c3774c3));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x199742ce85af5ebb5c4821876409be84fc225ea3f37cf56c0838ae36afbc62f1), uint256(0x1ef127425c9defd607b4e30aa3506f7ecdc5d12715d16291305870bb46da2b66));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x0b3358423a4ae54bc867d7f159783525908c871c00941447dd346f65fde897fd), uint256(0x24898643b07d4c3934d87d87a6ab9108a528458b18215956d8c7f382fefd6e9d));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x22863cd462ef4789900e6854e4aab3c3d872aee43cc5ccc6b1ad27d06f19dba4), uint256(0x2b53f14d8461e7e7d35d3492cb543adc57ef71a2a470e63a19ea422e08cffe46));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x04c50eab603a36a9d070f5d62e76cfcd558833d131f308b0d6a4b28d35d86471), uint256(0x296981ab01c8229d4333295482fc88b6b4e1d421b3b00543bbf76df584f6c79c));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0df396e29392f1cb37172832e97fb24fd8e6416b67901ba5cdf2b32b9f7e3c0a), uint256(0x16460205d635345f0d763fecb417f3c926f6b52ea769b059e0366f41d9b8baa9));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x2809d219e35ab29dca174d93e854fed0b1bb7038f1b3cac27ccd800fca93046e), uint256(0x092e177d429bd8532d8a20d26b111a6368f91cfa52aabe8c95e609c906897042));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x0798f4061ba17a9f98b22d421302b6b2253712f47f8ff453cd1396911657083c), uint256(0x2fd8734660d231e38c109b6c1d27fd2bdce380b22ab07f59647e6c28ca148a2b));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x08c1acaecb3e018bfa91d27ff8cb612500e257b5edb5464afc97587d2263e890), uint256(0x0980b015b2bf95dff908dc8031485aeeb32afad5dfd2d3f393de021c0ab3565b));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x1ecda6712f61940e37cf983c10e2397e561c77ab1c034d50f29aa6acdc2bc77c), uint256(0x2ed7fcbf98a660da3a49f09dcd500b4a606dc1c706f7b8d6df6e2650355d5c20));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x262d09f03adad9f65179dc5a967a5c501512fbacd40b5da9e06ef43d0deca3be), uint256(0x2f21a6e31f30981f90319280cf378d5ac3f4f8c44d80703dd91b807dfb1258e0));
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
            Proof memory proof, uint[22] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](22);
        
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

