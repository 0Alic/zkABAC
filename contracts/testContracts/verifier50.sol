// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier50 {
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
        vk.alpha = Pairing.G1Point(uint256(0x2df2039afc9834afd24c35c3a4f228a229ab5a780f68175b9cb4dd3ecbeb860f), uint256(0x0d53c3bf42394818b4b51ae3d558cbd7c0780230d93d17e275d2c83a4ca001f9));
        vk.beta = Pairing.G2Point([uint256(0x158950ebcf2baf8ba07be0ae7693774587b9736b98af6e96a0d60bcdbd40e701), uint256(0x118312cb0e634b6ac3ffa71b97d84ca6bab629e06a80e7fb8a13377a6014adc8)], [uint256(0x2a5d867dd103d906a458b66b3cf6c12a78df266e901463ce26e8719127bc65d4), uint256(0x137009c1a31794435ebaa0f35775ed5899a772bc54d1f61b8b0169e0c64cf87a)]);
        vk.gamma = Pairing.G2Point([uint256(0x177d455a3d43b1e42851d609dbe844d9f1f966a40e0d14dec5efd13320dfe115), uint256(0x1ac7e04b5b4845ec766e05a82842b60f289e6d470476e80296a6b1ff4797b701)], [uint256(0x0d846f1485830e68c1eb9ad7d01673d1a5ed3c1be40292db972bb14bf1a10b07), uint256(0x26252626eb265cf0a377be72d9eb024f4512a13e3a694a18ee5db83b44db0773)]);
        vk.delta = Pairing.G2Point([uint256(0x230e0fc59d0cdeb9ba9961d1cdd69f560a5f0c7c734e4db53d078a08d6daf240), uint256(0x2cb046e5e692b88b9e882c4b34e8a9478a81128e8b43ccf337e29a7c464df0f7)], [uint256(0x0a47a2782937b64e3fabfb0a1f5df769b30c70a5a6c80f606869cd2f7c1b44af), uint256(0x02d55e18668fc152b1b49b917a5c19dd8f9fe03baeb4cd9197c52a6f0fb78384)]);
        vk.gamma_abc = new Pairing.G1Point[](103);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x0aa606cd24ecf95e7a7e8ea5358e391509f55465a4d88f90b2e91ee9f43d9f48), uint256(0x2dc7b82578aad2c35e9c3c0c9a81ee9f3b71b2d744bd1c5193afc94e524758af));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x23b6124912ef0eb992bddadc32f56e179068476b4ab33ccd899d67c55660ab69), uint256(0x02f5302d4d12f0acd11bb2e4244336dde70c9000610e7cedf5b7a78019d0afda));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x192bc72f08510e9217043b0b9e2c795d6b96b73178ef078e2d97c174a5515c46), uint256(0x04560c7a82e174c237dd3067a7a8203658680737f15e5750d6ae31ddfb663bc2));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x1032b8eda94ad1af8789250f00bf41fe5eaa0fba02fbf6f0baeb9c9b2d0e46ef), uint256(0x2922be28f1f7970127107a8de995e5d5d7e67c00f2bd4135447fc528e5ab9601));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x1c461f1822bde53717e752fde9818b8f4556a4ee858dbb0a68f08acc2286f3b9), uint256(0x13b305e12aa8ebdb7e24bca2e03338b4d6cc6ceaa8a78e800293a9c12a15a6e7));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x2c5b10dd83585e4d0923e93cb52452b8d9f5170dbde588e416b3bf0e8fb73f1e), uint256(0x2e145d73cf0597d0e3121849e1eaf959222a62fe9e0d2f1cf8850c797d6f0508));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x0729074d1e93386b14776da4bac83ad11dc45bd2e52f6a6a2be0fb764c09ef88), uint256(0x2cd70d226484614e27b9f316f12ff5f95070ac001ab8ed4f439563ebf4c73d9e));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x08fc1fdb9008dc381a902786199eb9ab2514f16da107de6cc9cde0aa9d1e27a1), uint256(0x21cf9225b423a1713523700c1d44d9a0dd2a12773f9316a65ecba8e939968b5c));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x1f0fd1be09cb1e5a34f3a5ce5c4984701ac6148ef103b4112845716ee58f8b00), uint256(0x2cadd8ab692429470002f0cb19d5edb55411c211017874a348f6c18897c8f977));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x1c454a41a252d9ff899e2cdb549c2e47ba82ca6c2e5131abe0946c566aa85c80), uint256(0x1896b630391bb0fc46ea93b6d563ffced4c8fb11c07807d3021505f18bbdd3ef));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x2a4eb84f2c066b7ada032f032eb0f228dd9bf23de264062609fc75c94a5421d2), uint256(0x2bd5e918be9a126badbe5e19ab2e164d975f28d09d9be5c05b8767a3588444ea));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x2f559bae3634694a0780c031924727f64b9a726f527fcc5f814ebc5ea4ead56b), uint256(0x223f63e6f6a4b9283bc73fc9e50abfca9ae00062465eba2ba23b527d64349dc0));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x2ed601f24b2d0b85f613dfa28f037a0875c423b2c7eee02a0f3c04e95805b8cc), uint256(0x2aaf487cb49cac572e364250f9f6ab55a57ba68c835a0a6fb158e2872df6742c));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x0c4f0efd50b405885842a6927f156d9e3a7cdec79bb857254068d2d649b108ec), uint256(0x2db27528edc7506b5e4d62b332d72ade99f3398241c8c40f722752faf1f6844d));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x221b7337c3aaf1e0a8358dfd2d5fded9eacdc87e1358267d9eda2a88f8f9d8a8), uint256(0x17fe86c761eaebc7cfeb40c7bd0a2d6bf063842855cb46a7d1e450c1859e8f36));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x0f79f9347a36593aa90d17807dd34eafdcae2f0d196048becb9fd1d54e68aa1d), uint256(0x21eef5dcb5df419acf3ec4c8077c85de53dc2e62dc8e81329da9881e3e4cf345));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x1713e8406268182acece18707ca8b59e6a8e8e5d48b8c786ff9ddb50ffa9722c), uint256(0x0a73dc75adabe0a9c45bc3abd0d04289c8e6ac43bf32a8c333c84e713e3fdd75));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x1fc9be8c6bc4b560a28d0dc7a55ed56ef1844460d106b25a9e6d0989b84a4223), uint256(0x24b40bd61fcd7da4727e5cfa71b11dd1ed0a08f7d4be8364c81f0fa601191e5c));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x1241a9fd413a67c8f9956ac6cae507b022d12ef38f776f1da9b0a38cd9b522a3), uint256(0x230a43adc0df8a51a947b79146384022f71fcbcc99fcb4fe745e5147df0c655a));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x0198e8b1f0571eba625796d5256b285d4a37359bb2eda4e070c125b397365b14), uint256(0x215c79364e06fd5ac00b8943009815d55a4d9c245118a4840c8f29160ba2ff6c));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x1b1e61199e7ddacfd0367a1167a4f1d9af62284d22164f1aa75d067950ab2eb5), uint256(0x195e4bddc4effc399a33f14b12d39feca6dc33740e2d61b1ab168048c19b1c79));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x0a000326c65dbc1810f8c810994e238034ab748c705f6fe9ee83c18d48d3026f), uint256(0x2b74b24119459544bf07f7c0fae9ba91ad44384e893fc7a01a1a77f9d5c00c6a));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x1c69229213f01ec89b1f9ca8c9078e28ab1a19e8c7ad998221f22f85b24a6922), uint256(0x1b923097b793ae88e971ef92bf6f034d268ccef0c6d6560010b2cfe377860623));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x2a5e89bd46b16ff4aa1303cc50708e4aacfeb020926cd81d8a47e93779a8e857), uint256(0x18562bf2280c8b3c72ce3c9da72daf39091ce6585215114ef8c0c1e3c07f8205));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x27a7a324da786c15e157cfad7b927103fd191dc1081ca2b27341a0453ea3f15c), uint256(0x2732f81bc7bcdc96301ad2d418faa3ce6f6dc662f57a7f8fcb017e2c94ebaae6));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x0b4b39ee0427a29c756bcd37cdfb328b8e5ae52922b3ef056bd74cf4ab97b39d), uint256(0x164f10d6685ba6490d8a3361ccfc4a592c681c9f76dfd7a0e699b26e08abed20));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x1d5a7278e4aeb2cc88a2c98c41d233f4617a68348085c9238d71a5051f755e0d), uint256(0x00d4a3cae452e10acb3f7055a494a5dd4bc5b8f20c98369088351a631dab0400));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x21442e68f8cf05f857507e2a683ca525aa6044dc815934feeeda325ea986a08f), uint256(0x2d648b9f732a8e7cbd768ae71e518f41ac6c52bf9b8dbed7049022bbd9637ec0));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x298aff62cb77c884f3d38eba3ec1f093f4d1644c4123971d0358f0c16caababd), uint256(0x18d318d9f7280f6fcc88743d828067070ef0a7a116611985bb6fa23821e1e8f3));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x16a7c53b2151402815e420059fb7bb8e26e528ef252048b257b988676923fa91), uint256(0x2a34be8cd9724eba6b48efdccb726eeee2d018942926543be7c83f782cc0fa55));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x1ec64dfbce5c5648a81c068b25c146aec0bf45952c17ec2f419861ba70243afb), uint256(0x29c98667527b7fd196037623911eb2b75bbb658854766a9c0ba759b00f58c83f));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x20c8833b1a5b465361216912829895d16b852487514a93ca21b7b87e66b0172f), uint256(0x092f4832699a78e1c3b79d05e4c8cccded7db9d19f7be068b4fa2f296be1418c));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x22816546f413b78cb703945b39322c67e4c4e37de558e1e544f61a190f4bb8bc), uint256(0x03273e56a21d2be488b51fbb7cb135b51a3035e83e892a45904c08dd465f3862));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x0f02d7c7f8dcbc73d82dd8f541567777411ccfd039e4f96637c0be79b2e3eae5), uint256(0x0112fbadb71f4a728d945b19ddf942d71d9dc671efc8bbe5ae35d36907267e4a));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x0a373d19933735e5e3d003b79b6ef96878c62a98dcf56b2c50e71d7f602bd3c1), uint256(0x2c9c8d5c594ace679e59f4d4eab1166272783df7392cf93ca92c63fa00497b52));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x1bbc2122a24d7843ce8b8c94dea74078384decf84d985fd589a3b587d246d9f9), uint256(0x15c855d4817039d5ff6ee102a65c93f67c51a5a6fb860843bbec2e1a6237e918));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x1017f8fdf74bd7fe31fbadf5215b19d31be4c041167bc9b810139712160bc5c0), uint256(0x271ef7efd96b54cff496e3ddee2e62ce16a83be804621e57959aee49448c7520));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x0eb8ae5119af3b4ab1b037d9b4a806befc2cd5f75709f3b954240516be3cef0c), uint256(0x231bfaaa4ec9932da39c3ba506d63eb33e60ca7c4fcbbb3eb13a8e9603ebfdc0));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x18955380f469fe07e2f46ff098affae4e5e8c8b292e38bd1682cebf95b2df653), uint256(0x05e3434915656e7f2e7b50b2a633059a16de1d3d200ab9032d377df387251057));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x199e22d5c42a832355000e387358a6915d409820f01f7e5e1b3af6290a4a637a), uint256(0x14f7ef87a684b774c0b31fc646134657e6416073d0c288a21ee1656ef3072ea7));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x1c2c25a380112425971372a247bdeb8bf34cd53dc18220ded75ce687651ac1b5), uint256(0x22f9a2a7306ddd0d45bf2ca3861c170babfc607992a671203daa24944fd4a43c));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x14c1109741e341d8c69a36323bc010de9d609b68b2ddc308134c0c6590bffffc), uint256(0x27b8ec45bdf6a472ad3185799f8766740825189900a2b79af90e56f36b2586c7));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x06276570fce1e77d9ac6bb5ac2e504f31ed02c7b52e15d6add7724b780ce6587), uint256(0x0b63ff0fdf0c00fc2a3fb078a17806c98c2be92a4df165271a3211c743f73572));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x204bcd4243f8bc20f92f55f5e3ed5fb3ad1246bd0acfb9aa3c93624c8757739b), uint256(0x0b4c6cc0be983c5ae7d50117018de81fb314e2f39a37d9408272afcec4d33009));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x2c4410ff4ba43b35b573ee8ecda164039f6c71bc3f4e3bdf7eee40d5bd84bb84), uint256(0x0b3d269bd36d6e3f33cef24f3dfd69e240a543c51d97ffb001ebf618b55132ab));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x19be54267e76ffb014239bdbc7de01897f4b080da6f9f446ecdb424a677bd8e9), uint256(0x00fa474d6fd6a1aa8efe7f0e4db3b2d1f041b8ed05a180d40a4b0fd5f67ff09c));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x11b4c0ed12b8df16fe36d281f3189caf0272315bfe1e5402f9930da764e513c2), uint256(0x2a1a8b17cc709142199cc3e7b4cf4af3ee2646792a56a4fefb682cb839748275));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x303466621b2c0ac391c3aceadf9ae8a866dd81601a68a73134a811d5b2ebe433), uint256(0x20e58021541b0008389f53773db9bd3ef30f11c6517af5e2fb0370c3cdd8b8a2));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x04566e1906af92e73108e558be1eb6dba97f37231dfad65094b877d00289aa3e), uint256(0x21897a1c731faccd61580c57603b004835371ad1800609fe46920b136d6ddedf));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x15289ba94d233a59d9bbce265be2bb0d93e5d25593029458fbde90a78d632044), uint256(0x239ae2f2f0344f709075e750270e5aa325a51a898473c03b3d20b80c98a289f7));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x17aa39b50ed5ab9d3f5a31956fb7707b47ee794575fd892e9d175e7bddbd1e77), uint256(0x0dd621f6882c13c100568e2a7ddfae89bce6f2acc969dc1234dcdf1d4eec1bc8));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x138d2acadad2980f47b138fc0e82ad00bd1ab25aba7387dfe01765e9c8cf3680), uint256(0x1cd62c0a684f10623037666ae07661432b2fca07646b02693708d4bd72dcffaf));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x16a932bae126bdb57c9cd78aac20ffd62d7db1dc54ae27594c8d91638fa6f50d), uint256(0x1b075f7061dee2a27861bdc79afbfa08702a42a7bad861f65191157ffa40195a));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x176f9f2fe43a94e8d6e8eae5f007a90e728abd99aa63a97ebb9c008ece8f5618), uint256(0x1e89f6f82d29241471eaa024b24782aca7efe3fb95f15e857e41e1ba41cac18b));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x126556cdbb8f4b610aca17090cd49000aa2be3d1c21452b9c91268173cb9585e), uint256(0x0159f6d83efffc8ae636d84761f5645c48b678374986be0e76101b63d74718e2));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x2a23d8010e52902d6563dd9ab83ac196305c965dddecc7c16c2678800aa99126), uint256(0x0980784b909bfb5f53af6505ce3d80d34d1794d85805b2b249433608a04c2de6));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x1c54e29647fa6df558aa46142e053771f2dc4acd033cd0af2a78fc52cee367e3), uint256(0x1165cb7f521d05d0fdc3e1eef933da5f443b577825a4e04ff6046fe3e5914628));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x2d82b58950d470848f47bd125b5733e7c656dfbe52e53e239463358b588b9cf1), uint256(0x16e09aef762a948ada7bf56c839dffafb19a5353817373ede787e9b488236657));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x2184caa4c50dbb52f0af331dcaa0513dba6ab7cedc78de4aab781d23b9ec7ce9), uint256(0x2a2ec5e48f39ca04bb15e2943e42b1bc31d56a0e605063a64587fb8fc6fe3010));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x0793038f63eae8cb1bb11dbfe0dbaad9ba60e3aa22d768165869d0299ccc1f16), uint256(0x0bc35f744efe9209a96e8e855c83440559b4b5d526fc96b9b9c4495464defa72));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x1adad69fd1fc9dcda10c8291d2d57be95337fda9bf19044f2e86fe2e4830b4f3), uint256(0x1e5d989ec346b6ae4dafd1e2a7262752a997bb1d4e55089770aa7981f07517c9));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x0d7bae3a89138180234de8c5c05897de0946d785d6a503cd8d29e2efb22c6df2), uint256(0x27522b3d24f1555d0959a3bf1c25c718ee41cc47d7a0f4d5f7517c17305fa17e));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x2b4e40d086e399aa11e37399c65400cb4a51250e076f95fc4216db7c918f5e0a), uint256(0x136e2d81870679e1ba0afe117d2fe87c3f2c50c3019827595ae29a8214a873f3));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x146b3a43e8588e4734fd3d43b582f92c2d5464606030df60d4eb6d11506d1b96), uint256(0x0fa4fe3048236265457a0f8f0217444fcb30047ab44d655b5a42bc353b5b1358));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x1742ad11a3d3b0bfa43a82ebf0e1959bb989f7fd0c8b040e4c1b0f319b84c067), uint256(0x1385307de5a8c126cbf34ba70385e8f8e1e093ef0ae217eca476e502c740eb4c));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x2387faa0c0b156809b19499240bfe1fc09ac908e67df23e97cd2a5b768a67c36), uint256(0x017afed0fd716f45dd8596b4f9d830b6ac350384899a6a25d165917f06c87261));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x025acd1b48a03ac7b6bd948219ed7935b224dd3ec15ea970b68b87dc06e1b1d1), uint256(0x031ea05b41e5af0b2b3af86eebb5edd749f96b6d75fa459370bb5a1ccf0895a4));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x038c70388902a5637a6d2596d498fc8973c542a85fc6e9a12ef4f1d6eaaa8549), uint256(0x23f985c3ed39b09615103110a3598a989e8efeeacdee1f4404fd811e689d8eb6));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x1ede357d7e20ccd9b339f9ce998fc197ec34f2283e8551b53b688a56ddf1592e), uint256(0x0758b5928c5fbae79a9e6b359422740ce215c176154be4b08f52732e9c00e9c4));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x1c04fcd1bd7e5c9b388bd081035e9af00275751806253d14fb839a8872e5ea88), uint256(0x0a9e773555861b58afe040acc55be6af1e63ead7594586158b628ed2dda0d767));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x196135734977552c9c8c3458ec2f577735215dfc94924cd116498c657aa541c4), uint256(0x08a81890467f4a0654856032342ed2566dcd260cae3ca99814eee1ee4767f9d4));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x2fa1dd88a6d53886a478f6b3638980b615657707be67fbb25d097b6d940768fb), uint256(0x1bedabd0acd866c14856d48a3dc3c9d3d91d3fc0fb372578dfba74324e28ea12));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x0ca5cac578198a827be0e3c2f111a3a5761c9573e9c9955d4126884fef5019b9), uint256(0x21ca734de8c7348713a3f98d95d19d2ed0e921d5bf87c2498df05e2222aedc31));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x02c03e2745c987c5a58868969ced34df8d32add8eacaa8015f27e811463013ab), uint256(0x11fddc33d9e0885bc09fcc3d41b9f3fa16bc75aabf91baadc9026fb58de848b9));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x01b1e7684c61a51b29f73e4401648d59d66b15adfd7cfae93725d69febe747b5), uint256(0x080078c530fbc61bc5da321f8300906b335262355005ac28c957bd32cd01c768));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x2497f574a251d9f11eb15ab15f15c1ce9887753d648c5e65001ed8736d652b5f), uint256(0x1e2d36a3951431174677667303d2f3e6e722e336c2d2b831f4c9f9d08a5f2a2c));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x2187e7c44be05c7c031758bd8c5e0f0451c8c6e0770db1491f17b45b22db8478), uint256(0x1c028796aa6a4591c9af2cca1309a7d0056b316452c443e313e24abce35b64c4));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x173344752ee43e1e8026694df897efa3e0182f5af968ada9655f487fe9c19e7d), uint256(0x11404f3dae91cc593afc0137f002a8a5e81638f6ff304b128f14517c12aed512));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x21ee2283d07082ffae07856ede1bc9fbba2f90b757c28b2211fc0f9b7cf45f7c), uint256(0x28cb1b27346eee6118548d4508bd13d01c44bb79d370b41aad916a14f5022aa1));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x0d042826252792a6d06130174ca7f7d9e25d260b32e1888b40e7b174c5e0b2a1), uint256(0x17a44e03a282673dd8516d5c1951230fbe07dca4ed610f0b80c1f335b6632352));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x2019642837a9486c7f1f58b63830be48f4c733f7ec85741f12b458c4f021e5c3), uint256(0x1d6f24ab8796c033618bff3ba89072d44ffa1a8556fb834a4bf4521b4fc66e2b));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x1297046003f2b9c0ba56e48e1bed370e0c01d8c522af5e74dec56cf2ece8a9b3), uint256(0x02c9b69dc86975cba0d74e26741cac2194af28c30c7548be77e58e72c55a4e95));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x244bcf4f20846278b9267266cf34d53255b964b1c91b076bf936d43d0d71e453), uint256(0x07704e8e139f0ca1c4b747544da90936960b81a9e6882988c7a268d63466ac22));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x1aac9f3073b4c079caaa20acc278c5d2ca3083bee7b3c3be0a345872b5a557b0), uint256(0x1d9ff370423dd8e812c186d497bcbe095306210413f92c8bdbc441bf94ba0a26));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x1f53f352910d32b60f4b7d4b403b871d23b548e668fd6fb84a8a8098c61733fa), uint256(0x173c9bb4e71e05782a3d2f1e05157882cc7b08e31e768c6ec392c5c6cb2cff31));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x1fe0cdc266b603afc5a7a2c34b0cf882b2e8c066a5b6e16226e52d855c71479b), uint256(0x20cb71da6736cd84899679007aa4340d118731413812b8b40c7696b23c55edbd));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x07f23f0b3b5d5b0c3837ca9ad78009a3c275080754398611723a963813e795a0), uint256(0x1e858790a642b874c43f4450b79ce12c9e2332799ce239af428831f00feb6ebd));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x27d2fcbc9b008e22564252daddb9a7ecb24afb868e741bb5e7dd2c86be732d3d), uint256(0x05f46cb50991ecdfe0ba91a447141a5ba818c2572b0c9340e6872873b64823c9));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x1b554756c8a6ab4f1e9bedc4346bae5fae2f752fc83feeff455a04eeef7ec7ab), uint256(0x0556aeb2c281cb5b345e541e0fa14e0a92950c61568ea54b5bddb38cc7d45eca));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x1f11d52cc58abd67b4e8010c93fe96597d476d7096a3f72fa153e06b60f6a308), uint256(0x2b822160d8922843c5bf0d170fa5cc95e51bda0a04d498be8e208b9d8f1f9a80));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x1c74a7148b8d507f18f2535f5e1271d7faf65057d6b89ea3a1dcfe03c5b4f927), uint256(0x186c56610cb2c1cc64eb516b4579fd6235c91103c023702fb1b252b0c824407b));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x09eab74f22bface130946cc501a4d704ac8855b61fbba6981ed7c8858eb05373), uint256(0x04d2f531a22fdc76a4291b7429c54b05a5d996afc6616bae4e98eadc854769ae));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x0093bc567a5c93b92656fff94e7686217173609bb15b5d736c15d0db7bd19e5c), uint256(0x085a938e912d832a979cac07979051ebdcc3ee15b2791b145761502f4e9f2839));
        vk.gamma_abc[93] = Pairing.G1Point(uint256(0x2867b700cec374823295d8ee92c224fc16a0c127eea119f946abcdcbfe102374), uint256(0x06b91996d21e59b0d3cf3a3775ffd66456c7e251d50b166807bc05607477f664));
        vk.gamma_abc[94] = Pairing.G1Point(uint256(0x2df295b37a679d181728a41bc883c78d9cffd74b5e31859a8fc2ffff91ecff9b), uint256(0x2ac98f9aefa036a5d4689508cafc2299b3f803e4fbda809a9e171ab1c5450177));
        vk.gamma_abc[95] = Pairing.G1Point(uint256(0x079882b069c37385c06aad4f96db02db151bb09e2d9702566886e6ffe1727f95), uint256(0x12c2cdfce24147944c6bf0210e271e463a4e31166d5525995a000bb235cd675c));
        vk.gamma_abc[96] = Pairing.G1Point(uint256(0x203e43c61ba3c1e2cbed8b6a46788596a028fcb99a97158d7d175aa113df1ed7), uint256(0x1a358484b0906dd91024c9cb2d9dbcd19305b9d8629ac3ff040f1496042650f8));
        vk.gamma_abc[97] = Pairing.G1Point(uint256(0x0898d697fecea53d433f16aed0e788107616bcf46d60f7a89013080979e5b739), uint256(0x0cae85d85149a4e6cd4c0273aa9e17e889dcda632bbacd6b36068b8ffb0d1858));
        vk.gamma_abc[98] = Pairing.G1Point(uint256(0x09e0139b9d327d2219e8d890ac65d5a26a4277a4f0a13d9deff36576302d6331), uint256(0x048d3c961dff187131976c1b5ea03d034f9a817d40c305af46ec589ed22a0838));
        vk.gamma_abc[99] = Pairing.G1Point(uint256(0x01e94d33c2d81465539c63081dbada021ddee93f09a34786cd0e1714d76f3368), uint256(0x2921a014a7133a9f3926c9bfd2b310ab5ed952722a41608160482be9a2685da0));
        vk.gamma_abc[100] = Pairing.G1Point(uint256(0x2a4d3d9ca307f04454b9132391538da8fcce1711889be93fc36fbfd786079002), uint256(0x0e68062b57e9a0b66871ee9703027e7810d0909e8a58edea03a9dc8975d6d724));
        vk.gamma_abc[101] = Pairing.G1Point(uint256(0x23b1edf30f91a05dc661ce9cc9894b30dc176f7159afdd2e8eece4dd5d68eb2e), uint256(0x0500aa964e5fe178bfe68a3d15e47fd29cd43977953e6272bf4388be18679ce9));
        vk.gamma_abc[102] = Pairing.G1Point(uint256(0x1433f14ada77d095062ca5bc2a18b837f5ec49fac7c46a087322248858568ab8), uint256(0x0606b24cfc4ec3ca7e184733dbfc268a0bfd6f19c7b48118460a828da34871aa));
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
            Proof memory proof, uint[102] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](102);
        
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

