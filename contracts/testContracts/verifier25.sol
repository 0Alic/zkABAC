// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier25 {
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
        vk.alpha = Pairing.G1Point(uint256(0x1cbd0bdbbe9b083dfb222da711ccf4eff0da620cc4429c879adb35650caadf6c), uint256(0x0d8a893b836bf8fbb343edc3ad617969137cdae0af17ec9fb6695e23300aa6bc));
        vk.beta = Pairing.G2Point([uint256(0x14da4182dae53270767c62848fb50d83f7ac237e89686755e727ea0e07ffb85f), uint256(0x23d43be7a14b4d8b929044fbfbe7df8c5af1898702991b84f5259ae1617b40cb)], [uint256(0x0a80e86d4f897313d83624dd65b1366a34783e00bf23e21d32b8070733891683), uint256(0x223a239fd04f28881135deec1e88fbb3e70bbdd8b83229d18415cc2189eebdf3)]);
        vk.gamma = Pairing.G2Point([uint256(0x246c1c077cf0e0452e6fe7ac879ac76bc961b9b1eaa7c0314b0afa2cd52e141a), uint256(0x202ba28d66316c0984ae2de3a4c3ac8c38ab35a9349b9731abf423345147a742)], [uint256(0x07b8b6b54b2fbe0eb524a4ce7cd1ea38f9727a1488e9884d9e140c60db6f9307), uint256(0x2a5b090c30598b9299f442c7f6317e2d13aeee9678291904665d4648f8f69453)]);
        vk.delta = Pairing.G2Point([uint256(0x25783da82b86973199c46cc18f1d8f22de97b2aa3413ba847467cd3ba08dce18), uint256(0x2ca7c98166a13b48b318d354c085b48801680a387b055fefc356724d9300cf83)], [uint256(0x293176a67bf87f24c05cbc5ec1623ec84ef5314557c28edae3f029df0b133825), uint256(0x07ea91d9d078a2ba85cc77195ef8d06828a2cee4041c12d170761c0eb645dd15)]);
        vk.gamma_abc = new Pairing.G1Point[](53);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x1254325a37a45a8f9c4f5cbb9cf595b0c5e49ac7736183cb20c76f4687c4d960), uint256(0x2fb356ffae4d9001db5cd8fb32d234ce6b27f9eb2157fe2371117f5bab749a59));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x2f3a85548c2c717ac90f0a3fc5d40410dbf0786790a11dc7c0eb2ed22d44e82b), uint256(0x2896d97cf99becebeab28ce730842aaf93d8c7ed6eca1a2884af42590697b9b9));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x0a59ab7c4d6419b3d567f97287fb82f9c708dca5de4965d2e4b790cf810081d0), uint256(0x20d99011e54f0d29cf60befabd60aead4509e6332c2790df46f700264bc07aa8));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x0526b71389755f9c1cd0ed10f572cc18b610aba32b64481d518519e4d69518ba), uint256(0x0b755ea973f886793d6fe74457abe65035d36a22f7a44eadbcf8834468c933f0));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x1d1db467223afe10fbaf68792a2bf03fd517ae3a337170a690f1863ba7832ec8), uint256(0x1be8e9f333a1244923dfb8b4ee57cba30576d974d3c1cc13ec81b52bf71add90));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x13d0e0156244d8dca8274a06cb07937acbf6295d7932181ae02dccbc44ef444a), uint256(0x0b9ab4a1a135640b3f7f3d5cb81c1865db7a6f5d2904c9cbabf625f1d3b42a84));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x25b639c9a5e661723c4cb8c06b4890a7634252e4b8ae5b7abba6e5cdb86c16ad), uint256(0x05a56eb9bc8a94dfa5959d2373294086a285ead446368a748c5e5895977dc802));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x0c7ba5d5d6c99d3e6ee6ec68c741732d8eb65fca1f74f6c59b2c40b264cbcbeb), uint256(0x103ca8c615fa820435fedb7578a098fbcfcdf5e8e744b1ca096bac31dd1f8ccc));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x2295af25a10c51cf108c7f6ea0e73a932fded125722136d308ff5f6ff9e1a876), uint256(0x09c4d6445ca0fba705036a2f8b66aa741ab834a3c148a55809aea4a5e6a5ddcc));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x08a8a488ada0d76dbf18ccb8e81569fd10ac6c06bb29ad407ca514a7d3ae4098), uint256(0x2f2fe7868a5da2cd6a03176baeda7bd0fdb9d7a22b3b59e2752a628200107ce5));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x2c1a96e7bdadb05ecbbc9253d47594ff3d8fbb133c10129f3db7532a98d24001), uint256(0x2e82f3ec7579454a55cb913f0e35f42c7eb49bcf5a70e354366fa0bf586f779c));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x21aa272171c845d56b39815763cee2e5043b872fe17446eab313e274ed7b60c3), uint256(0x02c1bd38f83859d4fd74dd29922ad20691a654d58cd22f5e6fd74c0b29eac512));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x0e4388de23ad9b2518cee5dbee799d22ea88e076b0f17b9ef6013bcf38824ab7), uint256(0x0c4fdcb80988db0acbeba988b9f74015db39268401c803d0e529cf56bfa1dbab));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x03e2ce408136803a2ca18021ef0fa9dcd4c555ffaebf682c245bec1a6fe072ab), uint256(0x2922af8adb73869edfe6312a4285b29e23a19e3e469249119c00ef685bed25aa));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x0eb7eaafb4d3979055a39a1574d2061f94cb7385399f30a11e1eb0687eea2cdf), uint256(0x26d98d8cff666d72eef6fbf8ba150dea0b60ddce4500c0c189e52d20d4b89619));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x236ed8994a03917a5fbd0e095f7b363133ce790e8df35b88ffea56c7e899293b), uint256(0x20c1e732ff16358e010aa4ee8a0b2a32cc568f8f037339e9e569e2ba7eaeb060));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x08b53a9c4610d2bf7f2e96721386e90f479c5880aaeb33114f1dcc8968f0c554), uint256(0x287c8512e5a79857b54240c201e6dc2f9e2b7ec76e9f43b2407c9803d91f553b));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x278d320014af4c6f2e9c069ac4af6c53ddc15d1e5d9bb3f9589e1f243fdf9690), uint256(0x1c54c54646b61dc881b2578e5bf983005dcd0536c9eea225c5c891c4e32c08d4));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x15767614a1602f51ab68e4e196d1917ccdbae711b06a69f2408c61ab1f89d56c), uint256(0x149a0b9b29bb5d4e63db4b1bfbd3218eaf2b4a886b2d2d17b97735ce8c06cd5c));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x2421aabb4b2c86bac1cc5d2ed3f6e90ad4df4e5881a4a5b024d5350359fcc7d6), uint256(0x0ba18c33bd4efc1be034fa3856f2d531796ff40f2cc050970bf1d0a9385b3678));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x0d314a2d045dcb2b7488b96069556f6fad48e9e7e11492c880613d11588b1658), uint256(0x30292d806af3f60cfff4a99ed28947636884b46f8b5391b08737712b333c7199));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x0c64b8daf6fb29f45ba07e0d10e50f927bbbf6a47a71685e847dc379ea7e47f9), uint256(0x1af25d32da8b8c6110287ca25e818e8f9fcc8e03e738cec3e9d840212e87216f));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x15988abc3e7c923ddc475d3beeff2bca551c28495e4d4d2c15351ce35cec6648), uint256(0x2e98680f36f81da53f2b552f64d172c21bb9aaf36436a6fd163fc508b8452968));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x29e2f105475234ea9d09c581169e6f262a3959c50279cecf0d2b02bac668ef3f), uint256(0x12ac9e1321c604c14f07faa626172432ecfcc89b62d042ef889582530dce8665));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x04c1ff6d621bac9fe8f99179692c09df6ab4624bdeb6938097d99b422fad0cbb), uint256(0x04cc732752cb26348547fea3fe1f80d3278ede741627ad67954438a62e24c889));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x1c561ef1dd88ee9eb66c2726ec94885f2a85196f912076b33968fc3ed1b0ba3e), uint256(0x1c229ced10b945d9b9fdb37463881329edc90462b61a74d33ec9f4cf6e13caae));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x2158caf8c1c69d51d137d3c9705a9ed7ab7672ef5e3da770320dda532882a269), uint256(0x12af5876cdd1bd86bed33238609322e989cf53386f2bb388affa38e1fd87d650));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x0fc39560a6eacd9ffdc5b83b5f2491e9e8ef9b03bdc99297bc9be9a966825d7c), uint256(0x10fa2e24abe2a4af4bf2104eb1f3639e24e221e2cad8f9a059b3b9e92a8ec479));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x2e038a7e75fc6b01eb29edc62984a8fcaf9b245b2b8977d13b6104c58ec39d7a), uint256(0x228d476ec9d0a420f1ab84710485cecfbfe7cba094c984113c484aab99f601ae));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x0de29bac773d299a013869dd5f6c7bbaee3c54c5c31babd46c61ebb223a4126e), uint256(0x0036d5b8ed9868afb388578f7865976485ddf1d97125281d5efc4aa92b0fee5f));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x10ff277942d40bc4f3c3516ef7c6ab4dc2a0400492d48c5d1636b7bccf883472), uint256(0x045e34778df8c3c4126b16a27c8eb7de00e6c3af10746101dae1d2608eddca2d));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x1df1b06838eca3132d333fe9f046e9be9aabbad3c080c9f3afcf49dc50f6c7d4), uint256(0x027dc3c949453689392ebc67dd6600dcf241dd1461bbe8564f0d49dc34578ba1));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x18a48908aa49051aa96e078e48f027266641562e0af9a8b2daa772e8a0c6d2f1), uint256(0x1ec96d2930ef0318f5f0b0dc5ff71bca5ad6c1a32760a39b5b09992cad4c3e32));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x048775a90aaedcab7294e9b55d32f1a667d0282d791211d85fac13824939f0c2), uint256(0x08c81fc0d9012c273ced55f7a74fec63dddd1deade321418d32e7efb8aa2f158));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x17a8e757add50be88dc7612ab30bec0a5f841b47279d98902b5815b1297660c8), uint256(0x0d7c1962a303186c8cdee85a346e7b6487b556f973b3365262d54c59bc47dd21));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x0394b3e8fb35f77fb93c305915f340e7fe3d07e5df0cc3177855f08ddea7169e), uint256(0x1e7ffd6b8cb21934a3b79c959f90e71d2989a7fc905786b9d8cc36c090ea18e0));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x22a18f2702c94c3abb9177d44bd800c33749b05f9de0b578229b68be038534b3), uint256(0x191490e15b87f34ae4487335069152e549250401742720c9bf1253868229e1d9));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x257844d5e18d199b91908749fe5ccc591a05e6ff7441063f3a625905096733f1), uint256(0x0ba0f6d2bf14e23eb79307ea5d04cc7b4f2485af5dba6277d3bacba7494c37fb));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x11f2ab8d3c989d8f2ef86d0c6950853f010738b4103f6429c73eec80effa0b9f), uint256(0x1ffa451c8cdd54ba8cd617ba69bbb04067d9f9973703c893dcdae2cdca9ed3ad));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x21ce5f30fa8506a5991314b4716973791c4f1dd16f7c25f4fc949329938a0906), uint256(0x25840d4c13e2ee61e9979513f01db3b8f4a333c3c94e1eacc2dd8e13be297c30));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x0e945cf6e59f3aaa66afb8343116a306c9f6cac5ed01324c0c35217f9880ded1), uint256(0x101adca68bdf7feb269bc213295a6742eefbfc4823c3d49ede2d324efd9b042e));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x28e09564570aa69d402a78541c35784cb4f1921eda8296e016a1e2f1d7a13267), uint256(0x22d4b3f235b4722fd3a7c7c774d615572a24f09e742de35d890213b41e6fe09c));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2e328a1321e6fc0fdd4a93d2d71b2ace65f09f202b320ad4cc3864d99503568d), uint256(0x01922e69420a720be2ad2ebc0a4611a239451389e764c412d2f053e42e9eee22));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x0624e2cdc9a3567035689ca9c45261316d1b81e0ca2c447b8d26711bee35784d), uint256(0x13303c8d1c2212856aa8b4ec643457650a1a5d445ba6b9edaec672dbe202f6b3));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x2c97332db8d526b0849f8bddf888ac6fb1efee306db1db891f1b0abcb583d824), uint256(0x257340b2471acd239f3d307d115b628d2d2c402d87593ad8c8da345707e8d254));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x02c792113dd8bdafbab879261e4e4b2e91e7a5ac407eda947ce49f7369a9ce37), uint256(0x28c026b3c25496f9f4d8f7b3d29f1104c3293cb780064b63fdd2775ab396e6da));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x0d545cbefe9cc6cf119fe3b6eb1c6e5fc67ffd87ec6c06a5544ee394e6e7612e), uint256(0x22fe26182b15f2e09282e22003650433e0eaa67352450d920119fc5a91306355));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x2d433fab901854e3fd0682632fdd4cb151fec5492789dddbf4bdba6c2a2afb47), uint256(0x28c0b2604effb2f58ec6dafc05d79f464b4bcfab53379d6e19d34a9a70e62f70));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x0197c67ee4ee38584ab94a41cb609f1be84bb557f14613ca7c16ca92ecb15a28), uint256(0x1dde6c7e4a73c2dbdc69283af6e8bb1d3b0103bf6dd8c2cebcca62f4c0ac6efa));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x2320c4ed0f3de82c7ebe3f783157f125fd44510c73db9e77330e6eb2eb0ed766), uint256(0x04e91b936ed9d2f79a6c1c1e9b231af3ae96341de9bdbbcb823a0e5b97a46e6c));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x2630266558e0feb01c300f1a0c37c87875ebde925c922c85e1ce7d27b2b3a5a1), uint256(0x0d4d14971e373d4b286f6b7e6434219022d10683c1b64c6c0491cf93dfdd7c95));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x0974275a5f9898e0eb46002ed0c4a620909204391394de8e0bce1a94c66d83ab), uint256(0x291274ad07865466aa547ee081aac31b5ed73ff4702ea69fd560585449ed4cdb));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x293eede279411dc2ad930354a0aebdb447c6277b7c8484d0fc2fa1bb03d968f1), uint256(0x0d84915ce49602c8739d8c9db81365886ba7d812b51b4f64c857131850a9f9d7));
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
            Proof memory proof, uint[52] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](52);
        
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

