// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier30 {
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
        vk.alpha = Pairing.G1Point(uint256(0x19db7ae63e66d930c1b5d2eae011dc2d9eebf0a2547a6eccaa336f4e31118af9), uint256(0x2a15b3cf7f16f4922ebcb8da5e536d18f31efce116454e73be3ea47f4dd2c2a0));
        vk.beta = Pairing.G2Point([uint256(0x2934909c0d5ec9383974ecae6580e247ac84c271eeee35d227ba69bbaa144055), uint256(0x23106ba819beccae7998e728e7d74c5a08d8141be232c3ece7f49ab9cbe4d257)], [uint256(0x27f93f798c250f631f6affcfeb4cf4d5c6f418fd10158c04aca1f9080c4aa1da), uint256(0x1d4acbc7263d8e8bf3c235f57d13538528f28c0ada24ec0cfc9176ad4d43c985)]);
        vk.gamma = Pairing.G2Point([uint256(0x047d6f30a4b60d1ca5832d0cb1da89e0e65726a78d6be0165b1b9af6e538c034), uint256(0x013ee972400f069cb9e9228220c6e758294bc2ae567b56d1c2f249675f953c55)], [uint256(0x1007a479ff57c1787bd3175bce7b14cbb9d1aae0ebd785d9b4f1e42ad5d2bc87), uint256(0x0349aaccd9f28df0a7a1ec6640f733c81cbde078892b91ae1ccaf8825348a99b)]);
        vk.delta = Pairing.G2Point([uint256(0x094a2f79de958a6a7fa4b5986e745ae57b461caaa1681c4d430fa774152fd35c), uint256(0x1a4aea7727ec4038e33596207a9b83e1e34a5631d69c2dadf0f21458f02ceebb)], [uint256(0x144752f8bfd613d4a97f197b5ea0af9843cf30bd98b4c1014bb07a412111c634), uint256(0x2607d22d6e6fd3cf246fc6ebf788d376795c32291947d568ef77656a98698b73)]);
        vk.gamma_abc = new Pairing.G1Point[](63);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x255bf15ff1d5f72facb1e660e4a24f37d98812b1d4b074a08235311c017bdb3f), uint256(0x0d4b3ae1f9c1cbdfa18d882d4959226d82077bf8e903e974e20eaf0ae86e46f6));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x1e1b25ae263ab76c87aad5e7468bb4cbd09770567a86de6c55c2fcf3279924b6), uint256(0x1e69017ad78092d0bd5df4fb243075b21a46a666120ed824b490caa8d4e84d26));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x29158f3d8e86ea444353bbf30b59e2101d2cfd7b9b6632fbf1684291b7c3896a), uint256(0x04e03bf5b22db9868f93b95f7c76f90a2fa50b739f3a7995a0df5ddab50567fd));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x12f3fcb9ecb83c71aab41a332654f3a3f9b99e9d6e994d566f2b8622c73eb31d), uint256(0x0bb9c07ae7a495f625f2d60dce6e64e7a01f40d6fcba699170ee08b9c7d20ed9));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x2aa4143f0398f5e44a0597fbf3c82228357e54f719cab473602bbe21485d05de), uint256(0x26512283647ecc8377750a6a2cb6c161044ecb904b8f46f42ce602341e17626d));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x0fa86f1d6ef9c1105fb38a1b8e042c89d344b3ed9bcbdef9125344720e17c1ce), uint256(0x19c3334508b1c3b10c6de160edb0838293130c5b49b27f8eaabe30e725571e5e));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x2a4fd2047de248b28cce2ee0cbd5ff458b08a580f2d174cdc7cd7c7e9c2a9e35), uint256(0x0ccaaef885e00edbc132a805fa34b03006956f1db292218de88d83bd340623e2));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x2f16bba733e9652161d0322cdfc312f69aff7e32c11d0ed4c223a3a7d4bb6224), uint256(0x1ef14aabbe936d9e50c540f825b36ed66ceb38600b90a5c903dbc63d7a451ac4));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x0e9e381bb023d5c4c8940dbfdc8d070372dae7a8a4914d92a03779983484a881), uint256(0x304136dbc5d66bfbc643d1c0cc358b2c63b50a6075f1a7d108e1b8a0335cd8d7));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x22bf56ae0cbb74ce32a868d3b7d90cf55fca06cae8eeb1a7dff74cdbe04977b1), uint256(0x0c55178de96b7a3e67ab01de418978302ae239c5226a2930982007cfc3f8528e));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x167ea3701e5054cd9dd4cde3cbdfb0bd05205911f445f2dc365b0dcf0111a66b), uint256(0x0d0af7da233f5064d491089ab89c07bfe1c3a456d8dfcd26998e03c1b6ff42fd));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x1ba1269209f08afbc3c335dc95862911b0db80f8a629414f8fb29ccbedec0596), uint256(0x038ad9feb1c1c71e986c085746d378bca92c4d91ce867277ad48883ed1584222));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x082d35412ddd0da71992118ad49e333e4ad6e7cc1b91e5d57d9ea9818303b568), uint256(0x183c3420b04291b4b1af6e5472176e4db33337ad2be5822d3eee7468033e8d53));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x1cede05b73a924db32431dd3b1fe4d394d839f631ac98a9c524d73066de0649c), uint256(0x1278e4eb68747b84b7b88967e814311d1713306b0d7e7d6bb1824d189497522d));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x1fb84bf763d33131f33976899c66395e53cb26382526fc183a5223343737a572), uint256(0x14662ecbe5a367891dc3a390131d178574572f57684141c35a8727ad3410a034));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x08d9d832a4095c43590f1b3f148240e2d04406a6f7c9edfb3f8ebcc86301ae92), uint256(0x23096dc7c20f473fdd4cc919d91f0d12993b947e5adb04840a1303b72dd8cbc8));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x2fb83099989b27594b9adc443af80441ca26b5d42d28ae0b96d11a4410164b4a), uint256(0x0e9ace7933828cedea980eb48dac6ebb7b93ea98ead9a8f954b8533be3f0569f));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0ef56acdf9073dee5a00a14dcb671c738a7e16c995085727fc890787dc5dfbf1), uint256(0x1362faee3cf7ae40c73076929fc0f49ff8c48c898afaa8609e57b2f58c7d3c21));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x24258ec5881f7f929c4c4a902fe6a1bac10fc103d45345ad0808ab5bb540ee4e), uint256(0x1869396553efb4841b095b71ee78553a26b15e449d7b4fa68c52f29240f3a9cb));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x291f12166ea0341e335d8a76f67aa571648d03ffc698eb8fed157eb96b62480b), uint256(0x0a8f348f35a00ed6653b2b964995bb3e986a6a0afa60a24601d8b647833b3a29));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x2e736e1a7d9226274b5bc37e953cf527886e476f25bc812000cd8f2edbb62a4e), uint256(0x2625653c61688522fe8bc912b5e26343f214858bdeae556207ab1a017c44563f));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x258e3b054a1db4e773ca25f849ccfff7b818c1bb9504cefac5abb17bcdf299e4), uint256(0x1191b549ec2cf21eb8149dc1488b03d750524ba23d3214bdaf35334865ac0933));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x12ea32fffd4605cf9a5937ece19ae7cd6cd47173599780f08cd1b851ae9a38a7), uint256(0x0417b06b009ba67c974f006828e24b8e13075c01b368cbfbe55a42b1bfa391ab));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x283f119fc37557878f2560ab791abb966c0e875add149a679fb554b6b873d247), uint256(0x22d9ddef0ad5a5705da38c48e0dd02b282c982f35e39e6d640ad49c621b5093a));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x11b5e81ba7a25d0f20aa03e55231927e6cfca00c8da92cf9c3e50e1f8050180d), uint256(0x13a54efcdc9a1b6726182e66cba8f83cf63af2bf571605a547ea60597bb236cb));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x2ab213fcf34a42db3e35a7d133136d3066f1e0b0fc5c0ff9965cdb8322da9c82), uint256(0x08db94188ad0a5bc2bbbe6eeae89d38d5e61830552b5ccc6f32233ff640136ee));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x138096cd9b0562579cc9a3eab270e067f7679bc761da3999374c8389370f13e5), uint256(0x0b08a3e5ff80f6029dae24cce6f5389465d228a138c6a9d01643d04c3f4e9c95));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x244e4edafa69b4500c5e0d43ffc1de741f39dfbfbdf5c064a329f88d587ed964), uint256(0x181d7b0b0af55aafa750f62d9da93f52487112b8f91bd327964ad326613406fa));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x1dba7329baeb4dcaeb26af4e369c139029787cd2f46fad38665ba4f955bc3b60), uint256(0x1bdda621c06d3be4eb2a72718df269f35c073ae6b64936db2cae395e1c24ca56));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x1e6b0d3b027cc22b8286c5be916fa725f885b0ec42791420c219bf5b6c7cf4ea), uint256(0x1889d2fa1d09bc75827f7ff82d12ea53cfc8356da7590e090ebe942c872c59bc));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x1069b3315b5ff923a969076a6b903d14dfa922d12354442c7b0b0903e7606d56), uint256(0x0f5cb61bf71845d4bee9aed5940e5b0c6297dd14c8a47a4858bea20897459d08));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x1e5a83b4cc9e02d6ab553c006c63e9624ddc13773ddaa750526f690027a69ec2), uint256(0x22807a8c188591d112d1760134c4d771d1103330883388ce98d36cfcca7dde20));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x047fca8e4d2de26363baa8c539e85600d7db487e3942e1c74b2266077abe5103), uint256(0x3037ae3f15cac67086cbf2f1e511f28457859384f038b1ddfcf693fbe57c96d4));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x1172c4f2fc2c68acbb7141819d266614aee4f4effd059683ea0ea347548aa715), uint256(0x05a915f7d117006cd3f9afb5fe792e0676757dad751d11cb2ea9f3d67b045eb3));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x178658b01f8e2f68128e6479f905051e42fdf1aa0287dfbac73bce76db0a46ca), uint256(0x19893621ce99237b5b6078158fcbe13b46e698d858cc46b31a811a2d6debcc5b));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x06b8e521d9965043febfa132db598fa77069e2ccba3e95214cbc95d4f993365d), uint256(0x05891409f3ebf4caf277448ca30824d7c4fedbcbb282a25a691319ea06b6910f));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x2d128986c4294cdc7efad05a19e28b6634c584fd199f4cc895dddc28b42baa05), uint256(0x25c0be35f941a738b72228d0e48e35ea67183eb1e3fca53818dccb98da5dc2c6));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x1903fc1f748f30af1b283a4c15eec0a669a464f021db1e79145fe92c7d8f38cd), uint256(0x10c5ca0e42ad40451845693065f2026b73915535ec6a0f24a6763052aa9e7bce));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x15cdc12a6213d34b2cd80c2bd72d814501b39ca54eb4958179cfe49e980d2942), uint256(0x1fbf58fdde5a38c8c52566cac66e88f8c5e98e2046aecf8744d1f959f66830ba));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x22c21288b008f77772be66f733ddd16c7de999033aa02557c92129297d5905d5), uint256(0x06621ab059998ec3356ed81c40ac4eba7533e31b468ce7f4fa8aff6c39e51efc));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x1f9cc72a86f4728c06065e8d4109cf6a9458ae1f824106be1050a9c8d0691348), uint256(0x1e576b1ce3b624e43ff39dbfc8f1aebd16f6f39896331736471df263166b17d5));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x0cd0e2afb0051b09919c1a8899c44cc99f7e5b38d20dd21fa5b3751e3527bb5a), uint256(0x1a4e44cca7d652470d64a78fb04bff11dad16004100f56d9a55568e120deb646));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x1592836be8b5c204420c479f84cf614f4aefbe9cbb486c97fe63c10fc166eabe), uint256(0x01a10026f1924dde140a9141dd8014e583ae8ab4774f1abd55d1296192676b49));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x0dd5823e2909827c062c4fd8c48a7654335a32f416d6dbae26a6797faeaf975a), uint256(0x14d52136b64750b6454282aa4a9c3df2118201713d0bb7e4afa3bb9564851b3a));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x073699570955f6afc1461d415014bd83fcf35b4c4dc9f4efa23992ba31acb418), uint256(0x1cb95eae507af1879c4f662931e0815e33421fcbad3ad2c338622aa90cf9ffcb));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x1f0995714e18ed3c87401fe307ec62fa484be998ed64e54ffb945ac1557bb537), uint256(0x062d5a44a4126f46295fe3d0f27a7a64423e4fd050044ca28fb2959abd436167));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x16a96b3e46fafdc72c25edaf3ec2459065b72f1ccdb5d906aa13efc6c4e3385c), uint256(0x1cff5291701aa14b1163d041041a6299dd2fef8e51c81fc0a76ba818eb0249c3));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x062d417bc570ee65f16269a16e3fde740b9034353057b2c6653b9a36c787e71e), uint256(0x21f2f59a35de7a420a32d970504ded073e63d09c879192daa181a0c5fc9d0f15));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x002882187e26ac8fe1284ddfdc2221435b9022ed3fb9c90f4b07b74639863f0f), uint256(0x246f08602e4a5c888640a14f4aa3f107cc27bad36dbe712ee2dd324a3703b32c));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x08611c4706f170adae57ff849d059ce4941320e5fcac40d83d352a3209a8f21f), uint256(0x2f48096832436a1dbfdc57a6f7c422607af73eb83d5e2183614433c91f0489fe));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x0934cd671d4c667c39c2c0c0b04f0c2dd706ffb12eca22a883ccd16c62ba90de), uint256(0x01ac059e72ebf3c9a93d0aa2c79402f3e619d8be3e8be3502957cc2c53c1bc1f));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x002bd34eca366e84d54e8d5536ad40c2fb3a261790b7b034aed248c832bc947e), uint256(0x000f8c07d34bdbf39a4644153155279ccbb301b3bb519a6e6841a7be372ec86d));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x164f7c8084d37230366cc8674499aea6a08d9845f4fb6d96c5ca0329842df192), uint256(0x09a6478a477ae884fea6808313c4cdcc983dead0e5498a997835b091894a88a1));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x1f06141f2ff9d47c20648c4ada4c32468e1afcbd69c6300e5eaf08d50b7e9a64), uint256(0x2e43d99b157a08929a473669a1dbc5421f316bee1d861b2ae57735c7115a4090));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x16e4afdece827927aeacdfbf02231d0e99369da7cb1c16707cc836cce1a4b845), uint256(0x25f6a8bc8ef07e6ac1c5691c8cd6223f05b615b988e7d3b02ce850be3a9e93d9));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x0812adaa0043c3027ca15eb6517605a2040efd2f153512a2796298d701df73f5), uint256(0x1d100f6ea80adfc62d0e973e68b66a830a89b806a55877bc6e2496d12c88a336));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x1376bfbbb94c223cf3cffba83cc46fcdd5be16a5e1e07156bba48af32d22c680), uint256(0x2f9d88b3444a4b6ca3add3caebd6acbaead0112611cc9c35c80f1dd9afcd2e89));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x134c4ed1a138a8cb4d14021aad143470dd33648689d653945063d3090a96b9eb), uint256(0x2190621eaa24f88b9952d65fdab2d2762b91f44d9cb8f68526558faeb59e86c8));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x19636ebf5fadd883cdcaa37ff128dbe71e35ed3e3e8a4f022f9f5df1178bac62), uint256(0x0dc9c47019baa217220e11741e5e15b625a8272fb5e46727e5215f823e195a8f));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x2894dffe7c92947acfb14346f06e5a2c0698d4b296c434e24e038cae30df0b34), uint256(0x113275c779a440c106a5be17da51e290de2b00a800158154c0865836465ba53b));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x2a39b6859ca3afaa9600edf7a4fe1e2a7fa439bd9f2f643cd00ef9bf44872b86), uint256(0x0def40e746694b0eade4c4700c0b0f293396930beb2e08220769680fed774b5b));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x25c69fdf61a1e0236881f13a6439546eabec1d049271312778c4b5a79abff248), uint256(0x0aa19ebcdac6f0eb5f691448afccf2cbe129100960edf3a79362e7a75f7f54fc));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x2bb71980e1d9ac2af2d60fefc397a1167cee120f5a69637866bcefa4322e6cfb), uint256(0x0f1c397e238c3217b09525b9b6e4d5c013b645f74dd14da4128da31d24d72ac1));
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
            Proof memory proof, uint[62] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](62);
        
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

