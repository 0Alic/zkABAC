// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier70 {
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
        vk.alpha = Pairing.G1Point(uint256(0x094823ab3a494a0758356711902666d159abf14964f8df3c2d0eefe87234626d), uint256(0x1eea4717eb96deb8dc063ffbc33a9c52ec252d0db4d39e0382fece2ae08b17a3));
        vk.beta = Pairing.G2Point([uint256(0x2f1e3e942553a34f263a951cc78c218caacf643913b3c9ba0ecd444f8b97ec67), uint256(0x13262b6de1a7efcc836fd8774a5907782b0dc9cda0d834a069968ec7d2fb0c67)], [uint256(0x0500b08e72290f75c28fd3906eb063e00b0f7a7c94de445c13d6b3ca50fc22f6), uint256(0x0732bf77bbea41b242c3aadcde54797270d26222f6a35264f89756fea0c655dd)]);
        vk.gamma = Pairing.G2Point([uint256(0x10b67fd2899f66144e3b4cce85a8b7a739af533db6e20dd8cea2748aa9e0a63b), uint256(0x23c8fac5d4e30b3ad13158198c14473267c217c289107ddd0490700efa6cf50b)], [uint256(0x1822b14d100e22e4eba8d1538fca167f9aee9819ad47cd4c6be33c968de2882a), uint256(0x293a3adb940733c40d32283477b8c37d6a6e927ee36867a1a0d16473fcde8661)]);
        vk.delta = Pairing.G2Point([uint256(0x2739793e3692b30e36616aabb2d80ecc24e5e65a8351a65e33ef8863417ce5e6), uint256(0x160900891a29391cb78ee36b9a996a4be803f184b2f81aa06200f72d7504d150)], [uint256(0x0dd6ded2680ecd12bb8cfe449f71449b079ae4ca44649486c15ffcc56a3e7f8f), uint256(0x017f91ac7efe534ca5af5a39bf89c4678c531f83df3fa0393ef832b80df9e5f2)]);
        vk.gamma_abc = new Pairing.G1Point[](143);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x2d4bc56bf132886d607a80de752199a79f99f5fffa6a9cf3d30b6406a8ffc0bb), uint256(0x1725fcb9e396a70ec622a4d0629f8ebab461e5816d6c9f4ac5aa1345fe1cc86f));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x14e29e6a267a84ba9bbd36b03b888983adabc88e8ae6cc5183d58f2e3faedcb7), uint256(0x0b5d3179a5f18b0866a8671d6e00a13078d1cca3d2f8967b8187eaf6c7eb5b81));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x15ba5eeee30358c8a00adb2f589d7f57b51fea026e7391b417c6e64c1a35e8aa), uint256(0x22202653db15e2ca416fe349fb6501483c2b7af4fb14bf4f86f9fd57361bd529));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x04a7cb28b1b0d900493c3757b747c06083c6085fbb5bbef750476e3e2835f28d), uint256(0x02ad9014b1d00fdf8728c8415b53ad9bcd995dea97bb51d22e3d83169c9ec07f));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x127b4839af7452e25c26f4403ead8d5ac4c1c62efe36cb678048cf77ef18fedd), uint256(0x039c19fb14f9e60ece9ecade0d2ccc4f126521573d46fc91ec8c226b456225e7));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x2faf98f26f0250994c58ca4749531d2b9ace752e4056969a83ac2068a2628ebe), uint256(0x11d6572d3c832b95f34e2ef50075fe3c1cc9a535161b99fef188b44db3e12407));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x1ac49104b518c9c6cccb19f967491e53aed815eed7bd1ab068ee4fefb407170c), uint256(0x1255b5d1a46e6bc429e64ce9734b299f43de8a8aab4c0edf5e89536510e922f7));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x015bff7cede344761e7867e9da7761cda43f45edbbec9c5563ef8eecc1767a14), uint256(0x131c0a696a3171b05df15f591075b62058c1a90001bc6dea0441a98683108020));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x2eb522fd5a4503568af9e1645782ad37ab22dfca0259edd658d34820d09f6e05), uint256(0x01a69739c7e6a0ceaff9f1fe24e3810af2cb18cea4499e3faf09010b4b36f17f));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x2e65a13589dc2f143424d68c3953dbcfcf8e26274cc9897d5acea4295985739a), uint256(0x18cce5adc47a9e685fab6cf4048726d17c9146d16e1418ba039069af2dc2ae7f));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x2b1ebe6ed525e2fb77d627a964c590b0d67debc3efa5a6d22fd50aac3284304e), uint256(0x1fcd964431fe035125ca97035b28d80586f01e4b34b76f7f644bee4a22367d69));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x02373678bd8837d06de4e33cd3c9909dbcd21555cab5216cb4510e57d8ddea71), uint256(0x22dc0fcb170565d80f019206757517ad6d5d7b8112e4ef78fba5b0ea0d237737));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x05b1689c9b731feb4d6fcfaa0217db3365b609d9875e6ca3a549e08b7b1056d1), uint256(0x218cf92bb9fdeee1d4df9cce9573f73594cf4088b7856967fae0c4c6904ae2b1));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x2fbcf9e45b46d9aa2004b9ce60e21497ace46849570b0064ba9b23ec64111cd6), uint256(0x14b9c95b71d3f8819c3889ddfd845bf6fe5d82903dc4f674a9b4995c35946178));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x0d13c568f8ba0541278aff134b275547e848574c86e4d1a1a501c084ad041a30), uint256(0x2b09bc31382908eda0a6d2d70205455d074cacf7e277dcd5c200a168dd48b30e));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x19cf1a69f70cb3c7ca00af466a673bdf53bb04f7ada2f13a64ff5e18f5b992ba), uint256(0x2b912599a1a4e0b75e0925f1e644895152e1c3f689bdb2e5abf59fe0c8399ff6));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x055d620c53e66547d012bf0893f06058d8f0ab2289cc3af92889ca6173e88f1a), uint256(0x1d57f66aa173d209359dfa0c13895fe0f5f43fa02ce4f2f762325e44243503e2));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x237281dcb1adcecad431eac5551fb0a9aad27360ec62943ff8e2c8ba0d6ca613), uint256(0x05260ed8bc8220a7aee042f614713d46fe80b95fe0153b78defa6c58143e4df4));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x073acf18b2156034492ed3a5fd316a25e580cd0b62740ff91b4cf024ba457f28), uint256(0x1968af577631c1e572f15d4c9e6dc3223029e9ac8d10ee79d4dfae84361bb47d));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x112f986d0bb2b70536ce587ef6b4716c8ef91d10395a7548727d899d2a92d5b4), uint256(0x1205556ac097ff413a4791a3e030fb8252f5ba1c1a546a424d5eda709ee1861f));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x16611c2372429a43621e22d09e4211c6fbfcfe959bd1930517899f7be0bb9a66), uint256(0x198a975ef1e463aa6edba4cd8541a1359aa2a713842a33ad7f0a6c116943e190));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2820f577eadc76c22015ad2dc0bb2b178005c9173b353a429fe4c02dc19dfedf), uint256(0x1c4af5d82af36fccbfc84bcd6dcdb2faa85bb11ffb56b532c9b0fe243facca6c));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x1bd484ff71e75ff27c80070708b1e14b84506b3528da9231284922777ba07fca), uint256(0x1e5446323528f5d6b589736787ced2e2670ae3d6fd380a4704e6ef99e3ea9d7f));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x29f7c179a2fdc0b19eb282c75d7018e15803c62805e21d30c12575d9a553fff1), uint256(0x2894ad11e5cc27dc1390da1db09bdb4a1b3ac03640b786240aa5bf0ca0bee029));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x1393af42bf2be1208407316c9228d8f2a8369ea7c83537b02743e890ba21008c), uint256(0x010cee62ff512feeef731845f9145be11037651cbef2798e9651f08f01cae090));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x232c8e34d6fab83c871b549ac01230c1b9f0c1d9fbfd49637b81d8ce4c105b25), uint256(0x03260e07bafa56056875cc27c4d71cde3fc9979a148a4b3991093966cd9a2e0f));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x09aa2a04bf0b26008b5ef1125a305cd8288b21a3182fad91b6910e5753aeff1b), uint256(0x28243cdf46210a0d0294013a9c792aff40f12036f8bc83f742aef0a4d81bd905));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x0adbf393f1742c39a2ac295705eb2980e3a6b7202bcdde6febd1a422480b94b1), uint256(0x2a59a7310474e8be1bfa35e894ac2f17f4567995bcb224a9bcdcbbfafaf760e7));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x204896b1252a997646cc93f749bc2b1c2a3a92cfb79eb44c1c4faf434626e52d), uint256(0x2930c56b6c007a4aef680f606d7fa68175daf39028d06c60b22ce7113e39dc30));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x108529e8676ba45c4d114199b276f3a7c071d7bcc7b54d6c36db4e1b37d61e96), uint256(0x1e943ddfaf68b8fbc9763b21f9ea22fe9def30697df2d49bfc7476ad023155ed));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x2c726d7d2c64031dab9aa965ca2e1663880b12f1e6f8d2ee813ca1aac04486fb), uint256(0x296866f7d2d7504cb797a649e028f4d2974ff260b4a2da5b4ee5dac9b780779a));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x27df78acf9a56c380e016d73f2e4c6870c4d63c6df8bf921fbc7bc813b00cffa), uint256(0x141f8e34dbffa9e2b6d2afe7726f4a7985a01ef0e5ea8bf347ec0f1273f289ba));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x0864ca31e3cd99d35844b585f6611b1483f9a132922938f921b564594903b598), uint256(0x0169cba3144b21465b484bfc8609a212b27aeea04b4efeeb82c85b75bcd8fee4));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x236c6bfa7c19ba54c7a413b3849022b3c6b588f2ee7e21c4f815726ce865dc21), uint256(0x22796a837df87406235e45c139a8f9b092f6c1781391e1d354326d2633114191));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x04eb19bad2ca3936c7a4ba275fafbbbdcbcf5a381b07df34acc2f5a7a0320c46), uint256(0x266f9b4eee413bf9a1dd19d5eefd4526743fb74ef6fa808bc6a28884888063df));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x11d394c2154bfbb26187a075a9a97e897591f599290d104b997ca5eb2396792c), uint256(0x1e587ba690db1901dafdc6d16f1cbc743baa303192cd156b5bde9bb7289fca2d));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x021ae9e9b662bb7fd5903ed26fb3ed6f5be259808449f242504c923ced6c8ceb), uint256(0x1183c5d93cca0108b8a0f19f9f53361b16e156c9da418873e8fc890a4440e0cc));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x26a9bf7e05d8fb08ec2be91baa61506326ddfa40e098f48ecc54db893c3923ac), uint256(0x0b949263ab51352d6442152c48ba58ceff535387eab35c9401971df31e14fb99));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x2dbf89aa9f31fdbb42859d38f1eae21b1497034ce56144d8f992140656f7401f), uint256(0x0cfc11908e22998b8337493aa25f738e2d6c8c4acf772bd0a802c63fa79ab3b3));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x2bb157e4bae039aafc0e96469fd4aac13e35eb7dc22c831a86307508310f3949), uint256(0x0e312a5e17432222fc952a61b497b09893120b7bc4a844394ff609c79c63c5cf));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x21479e67024c7948bb4351cac566289c2c61ffa52b3c3567ee8d6a51ff7a70b4), uint256(0x1b1180cd4a39b7b1d1ec1afae541094ab21cab088722b36a72c9664ecb89916e));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x1d0872ea01232af0501a75da2ec3d81bbb3fc3d0d043f9b9b9d38dc31c28f805), uint256(0x1ed09fea27dfd8ffe94026d8e25dbac57fde84f71316f93357bdca55b30726c5));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2774814c99ca3ef45b8f86898c52f8b1ca2cc4ec08b22ddba278dd61c110a784), uint256(0x29f3ffea249f6ba66a980b55592846cd00127821ea7253486bd486ebc538e91b));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x099c70921ffd58a241e9c72d5d304e50a00d6a4bda7d2987e5a0b4fe63dbf567), uint256(0x12aa1c7ae02cf1076b2a17f7085daca95349fa1cfa6efda158c39a1927ef3a9b));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x0864adfeee867b8c032da1c2731298640ca19b73fe3bc8eea1cb212f12dac374), uint256(0x10e303d8ee93eacf9366b701716445fce0cd985b3821dcd697139f1c9b309e7d));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x21914e13aac623da5fad7934deb83272600e2aad2d50f991f65d33031a1755c3), uint256(0x093ddd5446a875f62f6431263e31d073319ad508b52a7068041652e849b38886));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x1185fae49c9cbc424e31b5a21e9f02707bc06e104cda509c35fdb606350440a7), uint256(0x1de0ee55aca52aa794aeaffb731127d34f8f661b42bb7cb9d8971dfcfa45fa65));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x0fce78d0202fb525f17b2c0a982a9a74224d2825bbfaadcdc12e9a45a935d672), uint256(0x06e0117f95c98395a2cd513031a9a6dc1757324fe4d8c2ee9a50d38f2360b9dd));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x109b881ca87c73b02176ca454f571ee2eeea266366c21e07161da9571db6cab8), uint256(0x0003ec03af3997e2ce491560e839f3158060409e6d881c6b70c7f634a605d23a));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x12d73a0906a56f798ffeb79842d668dd264543fb2a7df5f1a1f629e289fb913c), uint256(0x0a731088a416744fa8dcb208e0ee973d4df0270f23a9f14fbc33bdbb4c55ba95));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x1427a69e710b325898f970d622eeda29b74f94eec77821dd1fcaea5f806dd111), uint256(0x19097b680bd32a646f12216ed1c7da5a4effb281f4e904a7185f802641ecab24));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x2794b793889dfcee6105d97c2e824bb24a5d093db8b22386209bf541cc568949), uint256(0x1bab1d3140888ba67c442c2499f7e5ab87a42b03975315cbd5f0993a059f3872));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x01ef298d8207b4946ac27b5154d48d3eb53c520ace1d033f6498a4c99df4e531), uint256(0x2b9b621d2ebd3bb604d1cc7708cd2e68c714245276b75882462194d75f9b3e51));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x20203124208bd5c280eaf482a5fc325e98d5c3573e7b3785bc52d513946628ec), uint256(0x183291a4a17245e19e03f36aec3704a69ccbdbbaeeff1acdff22e91ce0e1d564));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x162d6c84a564d6fac4e26a773692661f721128c84275e58166fcfac290524d74), uint256(0x29e1a3180984470af97c9d938808c77f437874cc2e744db4c796ffe80510eb28));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x12671351b19145c473c9d3977610a7c06716638c1d58427374921f39371465e6), uint256(0x01506cf6ce1c182bf0cae273066dfbae78aa866c3e4cb196ca78cc503bdc9cf1));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x09b9366b6e34ad826927bcca059446eeb5304f253111571c5de3cb4bb2a5c0cc), uint256(0x00214dcded7c25e73bd230438d83ef17a75b0a4e5d5749cbf37f2f3d97aa7e36));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x1517df73abd902fca0d15f5e089a1d2b12aebf9cdee6d20f91e322e2a9714a06), uint256(0x2b98ad1f86b9501a6f0c112f8f784cc6ff46e66f1a18129234d864bd1ff9d8d7));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x269d945324e1077fcc7ab2faad990e1572d5ad7c0804990fb92d0a5739e2573b), uint256(0x01a4f560ad2c87e5ef75556e66c421081ee614e5cf80b88f4234b9c1554c01ec));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x1f83fafabc41f154524277a65d2ea7bc8616189be358973d8b2a4c14854a05ef), uint256(0x1785c86522657c4a28c3ce1a14fb3c60e7aaf97ebaa10d69881bc0904fae88e7));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x0023d212b44483aaca76a4d2789b143cdbdc6041c3937ac1ee415ebac32248ee), uint256(0x0cffa9c37e6921d33dd8ba7240fb588c087644eb7be5259343c812b14407118a));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x17caf37a8d3beacc9ebc083a0cd7ceff3f8ec86b3f6d86e58ee54f2f37b7dd89), uint256(0x1f88da33235725a2ade7b89df0fdb41394497b3c1943635c6aa2cb5abf1a2e7e));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x1e2d129b87ec0120cfa0a6edb13e60610c858e23321b6cf9e7de5255ab5030f2), uint256(0x18eb43bea42d68c09d09069b9cb044dc31c86db5f72016c8cbaeddc26daa3518));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x2bfafa5cbcdd35a16799d4a516c606c226e061befa4124175c3f63dc1113c562), uint256(0x12478c818bce206ee6e732ed8aa33edb8559938fd946cb7b76969cae30ee7d51));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x2fd088b765fa561889a98d49f11e58b73d9948689c5cc4281a99551b62136612), uint256(0x156708c863e934a53895cf5d9083e7e51e63040d092d2f32672d9942dd35d26c));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x08ae17bb2eeda6a8052c40bd91a5f52f2be3872f6f6a05bbf6fe82d96552501d), uint256(0x286c19fed51e80f51296230488eb91f3c315f43ae04d1e8bcd748bf124887f80));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x253dd4d767142e106da25b509708eed0b16f54a1a3c5648ae13ab3e0efd799ac), uint256(0x2af69168ea12117b088240a31dedc6c1d113f87800b8bcc0499f5e54682d9fb7));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x27a6dc6e3e0785f7aa5c29bae60a688a66bce3af5b51ec3c046e72c02696789b), uint256(0x075ee7143113064b458e26f4a173bf4f7e63e0ef416ac1c7d7faf0268a30a981));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x20565122ee56cdfaed2c793d27394b3d83bc3c866b19c12fa47c92e0efc75bc6), uint256(0x1e8141188ac1485e85e3b52e633518eeb41595e8458aa48d181f12464790b4a1));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x2cc4f3e538cc5549b44c94083de00a481ae19af2f8d47d51b5f6cfd485ea22b7), uint256(0x12b6093732a7e8c612f6827c16d6971dcf88fc871891b9d41ff0daaeb426dde9));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x2fb86c0d7a2fe670bc15271fa2d3c9ea1560b9500a852db11172dfe311edc4bb), uint256(0x03418368f1406c2fbf3a57f36c8c8cb580efa5a2a0d411b210c5bf7aa6de2a72));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x2a31efe07103803a32a59e94a29f64b2a0c30131f9e46b3d5bf731208d166ccb), uint256(0x274dbc1e7c669f120096ebe700dde99d31e519e89cad69910edc231b03cb93e9));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x27152fdb0389558db1616531e50eb43a8ea0581eacd669df646bf79dac0321ad), uint256(0x01cef2cd37131259b5a3d8e98948e2d7127e9124433a2c7a91a4d5a506366fba));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x007ab9b8b45db0997c384d6ff4fff70327dfbd4ec6c94461df09ccfe8cb8e94f), uint256(0x18b70c57d02d53919e2b44e46a005411f7dc8f961168e5d85652c13c0164b77e));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x24012ae7d2a04b7a80ca0b7941eccc200e96da3a09f78f707adbb14d63daed86), uint256(0x0f53df56417e4dff7262352c816016c3df44fa6b1f8163b7a6e6e934254270ab));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x1d23241f7975efe4dd59f4f5c1c40d39fc5e4006685a435c1bb5924b81650eff), uint256(0x1b7f32d3ac717d375f3efee9d79466199ea3a858947ef97fc0c2598301887ea8));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x05c4b5e44782a5d34a5673f2030595cbe5f99e970e74ba02f48d7cc80ef1c0d1), uint256(0x0d28e3f916d992f464f73000624c4715af483a785e83fc87922a21bec8e2bc88));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x1f4506f8029efc9889d138e7a68670005b80867f1cda7ddc0bc12e8fecab0a77), uint256(0x08776781e8ed2bdf8a04c9ce4ad3244b1e54f1a61c25f219ffdc86a4a4b425b2));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x05f1b121e06d22c5471ff8a33b1fe162a4453cdbee933ba6d9f667cb1650f24a), uint256(0x0ae02aa02ea057aa95c5a60a4e02715828cc4cbced29cb6ad0603699a7b88911));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x162a5bcff1475cc7151334adf1e65b035f9fd3fe9c3dda14626786d1a0a27a2e), uint256(0x2f0259e926685222833175124ad287edc28e1a1ea105c774e19098ccbe09a8a8));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x275122dd0614c474c41292f190651527c27283b4addb8dea9f404c7d88449538), uint256(0x04ddb02ae1edbe45b3e104a4c165124c8826b8f661988d5e91b5ce7e7c1342d6));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x218888f90ae9f923aa5470d627b5568625a8af51e1960837b70dd4c5a840fa25), uint256(0x2f0b10107d6dc3427212b8ef7878a2a29ef37b692c3169cfe560ab12878a5146));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x2fc68814c02d1a1bfd4ff547e11c29294891e72c771c30a37e1bfd63ac347047), uint256(0x195c09e2d9187ce25097e743c0963ed59464158bef95df9b79311c64a6bc2aa1));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x19143ac10851f23dc83092609f38c212bb903925b9832e8b04f6e2184e028a43), uint256(0x3018c8a318a9bec4408d6d21a66c4cb6d9e8cff52d61cfb31405bb3beb34f4ed));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x2161eac2459669d600d185d0e4da193b9e2c1a1bf94479100959e7759c0cfb2a), uint256(0x294bb2ec8fe0bae93158ab7e0bd340355002d7f52e8611d65eb2750d8ae4e561));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x2e1a6ff1bc4a8dce7864ddc65cb525ea33859b539acf011ca8cb6f9db18a7b0d), uint256(0x210dd616d52981d2c6e55c28740441efa81e50166ca5446e9453fcf530635602));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x126e404be1b37bcc742915aef0362b4566dd68bd9fbc8e37a2ab436d5830609c), uint256(0x10774b31ae80d69e5079f82509a74c7a6d77265a14d3ac29d81f5261e000b171));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x2c82db1887725d1f3e6cad58db8dd712d5e4b4e0f04ce0bb3a696888295d0c06), uint256(0x1502477e0708a09d60b7729cebe92e1f31c6d2957c5b71ebe334d22fdfb92dd4));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x0d43a6b11f9317878bf238b4d1e992dca293734dfb5a33b7fb6ca25f5b725ac3), uint256(0x23e17dd1f87afdca252f9900c354e1def45350bdd17b423c3c047a1c65a4e092));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x0b374cecd964e47d15343bdb1c2acb0319266fe3ec6691d3efdad0bfff7645a4), uint256(0x2e4b59731ab848722f29a366d1ae0e703d134b81518f2bd43dc3ef7be68af9e6));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x0a3e12cb0f138d80d866ba9172aa999878e3e5c0b0ebb2622402bfd620433fc8), uint256(0x0d1924f1bb4c827c830665ef2f74946e5170fce8679e16a57156c342d632c0e4));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x0179fe7f6503610703681da3e2eda7f56b789a2969dfb7b0bd464aec3e5a8193), uint256(0x022870f85501ea16e112f6422d109352d90c94e3c367c92391ae0bd61e05a926));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x2ea326a3e42930eae9b7a78e3f7a3b43e84201fb2837e8838d7a39fa52027513), uint256(0x2cb387c9ca02b00d290825b70293bf7bc16c40ff141b152a61760bd91e2c69f2));
        vk.gamma_abc[93] = Pairing.G1Point(uint256(0x0602eacf8bcb5c68ef35dcf582326dba17a366af0e283c418b6fbc4db8aa14bb), uint256(0x14425a2cd7cef06f0331c872cb48aa2d7da289de9fb4d4d60234aa32ef8dab50));
        vk.gamma_abc[94] = Pairing.G1Point(uint256(0x07cb2a808cc70d7e7474ec89db14423bd9bddeb99cd60530820df0c7983778cc), uint256(0x2c87876a61236ced7e9ec9080abe2dd58bd4156bbd785aab3208c7db9b028403));
        vk.gamma_abc[95] = Pairing.G1Point(uint256(0x074e8e53a78ab7a6d5b3359b43779fd652bbd27b618e6b71b734be958fc9ac9d), uint256(0x080de193f0af4a53f7cff6117041d6657b038138c3edc976360ed2c10d8284db));
        vk.gamma_abc[96] = Pairing.G1Point(uint256(0x10fc058d5b583fd3b63102ca8c59b5f871ada0f2996656d3852ea74854a74a93), uint256(0x04611c8893e5e67abc9051b431254af389cfd1331792821c8ae1de44de3f5193));
        vk.gamma_abc[97] = Pairing.G1Point(uint256(0x10cc27cddb1670c2c01fca2accda6c94832d68e78525a45f4d4a8ef874bbbeda), uint256(0x28c01e96184cfa396bbe5aec5df0d579d585960044286328cae11e7f7048fe89));
        vk.gamma_abc[98] = Pairing.G1Point(uint256(0x2e1efb0945e5f6900a887061320d6ce2df581405ab421a6dd2cd645b50d1642b), uint256(0x14908c226d8935472d29df8b9a9148932141a9bb65a77d38c53069a36661aa0d));
        vk.gamma_abc[99] = Pairing.G1Point(uint256(0x03abd0b0ef7324eea6eb1d70d79eee2b9df2d66bb3cf340d1e3feb89d9ba9349), uint256(0x25d2b2a7b3792a4cbe2c665e9bec4d9752fc167f339121e4d7e95592cf24adad));
        vk.gamma_abc[100] = Pairing.G1Point(uint256(0x117e05a89d54860a5d9149bec12f57b8e77af45ff529af8fee89d59595b6748c), uint256(0x17341f3ad3a53a148a1eafd2ff3073dbe077ae8b17f84ebacb1370dc3f2daaa3));
        vk.gamma_abc[101] = Pairing.G1Point(uint256(0x19727a57571caca2ede78dc0fa18d604e75080e73ef43727129fd535cf15c693), uint256(0x2c0ec864e4ade1a7f6393f56470e6be4a415da90d3369fcd7c2da8de97dde5f1));
        vk.gamma_abc[102] = Pairing.G1Point(uint256(0x27f25409f9c8edf6326014c0c3a2cd34e7baf7a83d86539c8dd12d8b8847bae5), uint256(0x0853805aae71ce8be626ae5e51b7c3997c0593dd87dffb3124b7a4ecc44bf83a));
        vk.gamma_abc[103] = Pairing.G1Point(uint256(0x2538ee0f059f7c5b34306dee8cad892a5eac2d0db669c995b7f189e177031506), uint256(0x1f33e7e9a54c5ec0be0f4e13209d7f8d866b7cfaa07b94faad6d64fc6ce8e451));
        vk.gamma_abc[104] = Pairing.G1Point(uint256(0x0984d4669aa1cd3ed50692d35d475aeb423163f327d949a94a5c3cc80997d265), uint256(0x26a4e2ad54314275a4a3074c50705dd7e6791c7b82569bacb97c14a211a26952));
        vk.gamma_abc[105] = Pairing.G1Point(uint256(0x08d233eebfedecc146266ac058a276a8e3ceb84c503e2d7504c2bf8c8c542cbb), uint256(0x0130302ba4897f356c28c59e4e92e95e68ccd2cd9f3cee6bc549005c8e9ed14d));
        vk.gamma_abc[106] = Pairing.G1Point(uint256(0x2ea19f43e7489b16bc36b77ac6c6ae4a184b53233df63a4a56a644333db1a172), uint256(0x1f4653d3781df6d98d39a547254ce5a6eddf1e545576dc96892d81bb5675d7ab));
        vk.gamma_abc[107] = Pairing.G1Point(uint256(0x0d700467fb3bee8fabcc8c304b14819c90d7505dbdd54b6a07e80e2eb1213b75), uint256(0x15401142252845a8b9e26fb9ae06020b548d6775899dc5861c553b1570d95a7e));
        vk.gamma_abc[108] = Pairing.G1Point(uint256(0x241f3655c38702d370981e04d8fe7400a7ea62282c909467f1c8f8cbb103ada8), uint256(0x1209fe4d8e98651d3cd70054e1584e142021a9be8f267f55578d12266d060e45));
        vk.gamma_abc[109] = Pairing.G1Point(uint256(0x1164bd5eb6a87040f1fa077853805be205dd7e66faf20937deccbe03f45aca0a), uint256(0x0121f98c7c88fb961310f5bb989806c48cf346714d9936a210dfb1d1f3440721));
        vk.gamma_abc[110] = Pairing.G1Point(uint256(0x069ed389dfb5b2b0fb5719da5b0a2e124b866a12d682cd04c03a718d34130a4b), uint256(0x11e06bd3ebb3795b2a814bfa982f76646df7cb9d1bd92763529735a727e19ce4));
        vk.gamma_abc[111] = Pairing.G1Point(uint256(0x2b8239b6a299977c9525848f9c593a471db23edec60045d121037d03eb5b48d0), uint256(0x299f3511fb8979746fbdf93c0561f2d6379fa318fd217036ce3e6b17a68da534));
        vk.gamma_abc[112] = Pairing.G1Point(uint256(0x083f24a4118b0c40ca763b5aae7cc88fe7d51bc18aee5f6bb9d778cefa090dde), uint256(0x09d43b6dab83ab15a9d48bf13e87a5123880b0598232088c6007708f8f702401));
        vk.gamma_abc[113] = Pairing.G1Point(uint256(0x20a86b51211be6523635c55b51048058983a6b460a629b48f3d434a6e7c67fba), uint256(0x192750e4763220d9aee64356151c350e2c214df85f30b9227c7e3b8958f0d0d4));
        vk.gamma_abc[114] = Pairing.G1Point(uint256(0x2eb1288bfbfc130ddf199a1ab7fae54a51988b26a8865281269735fee9d50f24), uint256(0x22d11277cb9347aca53827a1b25f52a59b2c33cd2a7d8e4f2ac71904336473bd));
        vk.gamma_abc[115] = Pairing.G1Point(uint256(0x11ccf1a9dd2ab78d1053cb9480f0d9d93a55071ff4d58841f1931128332fe7e8), uint256(0x1001465f18356d076bec6bab92bdc0eb2b65156bb3bb87a615487b11c359c051));
        vk.gamma_abc[116] = Pairing.G1Point(uint256(0x15adc40535e1bcfacb75c028c6faa4d292659ddc8ad34913f22b02b1be1d75c2), uint256(0x2b90745fb9b9fe76b14dc65f5281198327cfa8a7f453221539603724d665b1ea));
        vk.gamma_abc[117] = Pairing.G1Point(uint256(0x20484b6be4256051d8767cc7c2684d13bb8ea2b77650a6bfd3cf094c9e8429fb), uint256(0x1fceb3c88550a41df1d89445233e091684f1066374670732c274d21aaf548b73));
        vk.gamma_abc[118] = Pairing.G1Point(uint256(0x1c9b02a902a4dbb23cca961b5e2a2075bb25b3bafdafeab3871cd1152bd1f257), uint256(0x2c24fd7125e5404e38f3b29176bf723e530f32d87f1e12326c5deb216dec6717));
        vk.gamma_abc[119] = Pairing.G1Point(uint256(0x051071b29d80e35e1cf50a5a52ab64cf5b2b9f6ed7119a7572801c1f1579d6dd), uint256(0x04905fa48981167c340f9a94ef3958774cc3bc7ef77c03fe3afed65a4b08f489));
        vk.gamma_abc[120] = Pairing.G1Point(uint256(0x2445c1cff8dd3e08f288aa30ba81047f6cfa72956deb16d3898caa4b4e959533), uint256(0x07194739127e2d5677294946c07115b052251dc192bb0d55d05f9a15d7232ea5));
        vk.gamma_abc[121] = Pairing.G1Point(uint256(0x09e28ebb9121196bd16b348e6d595784535a0f5eb9cd54a8f19ac14b483b37ee), uint256(0x2543cf765d1a45b15cc5cd1712082f1c16fcfc40db2622fd66b4f738461d5b0c));
        vk.gamma_abc[122] = Pairing.G1Point(uint256(0x0dd8cadbc14d975ae07b8c5dfe16779cfff87e4d82a4501f714f3613090194ac), uint256(0x211b01e922424b582c0c63fe77c919af90d5f8f1e659bf291ad41d78300ce916));
        vk.gamma_abc[123] = Pairing.G1Point(uint256(0x0bcb6ef3e0173866f78ff6d43c8c9b2af499fd2b1c5ba6272c3bbad16f810def), uint256(0x2c08b2416dee20ad62c9c8f7556a2960ae1f0940dd10d72c595d98044dbd33d0));
        vk.gamma_abc[124] = Pairing.G1Point(uint256(0x283afa2ab4d79822693e95d5a45953954ebc5e57f9fa8507d145fb0bf3e53f7c), uint256(0x29f351b919a16824ce594e46b0ebaa36a94f8ebda6c369aaebad88a5ad785e3b));
        vk.gamma_abc[125] = Pairing.G1Point(uint256(0x11063764d5a1825b67124bca31173f16025b2df3b634ee2ed0f04f9a1942b41b), uint256(0x0679c3cc9512628022690c4b8383cf391ce70b6cd9372bbecff67da8f9541450));
        vk.gamma_abc[126] = Pairing.G1Point(uint256(0x0174ed356874ea71c27a5230af0ac0d3818b3ac2a9bfd02e4a7e61b415e6346b), uint256(0x254bb966e4689ec1da829f389773a863fafa3f37b1264d747cfbf8e5fae7952f));
        vk.gamma_abc[127] = Pairing.G1Point(uint256(0x1b0d8aab1009d34dda8d9bbdb6447c9915f077b4ce3e34852a9e283810816fbd), uint256(0x012d1d40d7be2c82a3df27fbe1609ad56b0d46622c54b44f9a8c7b34b9eefc23));
        vk.gamma_abc[128] = Pairing.G1Point(uint256(0x24979c22dae5e10a22b0a10d7dfbc6251592d7ac2b27ed6e55df875da4e89736), uint256(0x1f801d912742ddbbcb359c7779e155542e5e6dbe421f88894ef3de9f063cc005));
        vk.gamma_abc[129] = Pairing.G1Point(uint256(0x1b99215d909265b97d5a40eca482b208d43dc3bbfdc5a9eaf821440079020b2b), uint256(0x1dd10e2b9b20929ebd6f4f8b91e57dc060b0f139bc16337ec08d7c8b2ae615ed));
        vk.gamma_abc[130] = Pairing.G1Point(uint256(0x16152dc20237ee72720214b2d59eaacb5956e878c84eeea9a322c63f0aea639e), uint256(0x0c5461f8805c6a29adbd34a1e789a02ba96620607c81c5208dbbba8e1612e5e7));
        vk.gamma_abc[131] = Pairing.G1Point(uint256(0x2eec6f1154c16769f36855e825be9d3f1131e89862e5930728645aab5f5b9d7b), uint256(0x04b61272ece20efd4742ba13e7d52f891bee7631a4df854ed28a37fdc6dabc8c));
        vk.gamma_abc[132] = Pairing.G1Point(uint256(0x1b12d52a1c88d16907112be79e451f61b88cb9c40230006c3b30c26a67c61ad0), uint256(0x18d26e752e8c833264637f30aa47b4e20d9603d177ed68c9580b789bfe74a1fe));
        vk.gamma_abc[133] = Pairing.G1Point(uint256(0x05154258154f708ce5b0ed6f3faa6bb26545ce5b967f2e52ced86d06a4e101b6), uint256(0x303300747773d2d2aff539e3dd5fa0a1c95c1882b927600a048d51001db632e0));
        vk.gamma_abc[134] = Pairing.G1Point(uint256(0x2daa0be554e06da83ca45a1bb4ac5a7d25eeb8e49e8c2ec2a95fcb8757a8b44b), uint256(0x162f3d8885b70458f15ee63a296cea3d45f7c72ebe85495c3be7715087b37196));
        vk.gamma_abc[135] = Pairing.G1Point(uint256(0x0d75b8999b13a5b547ad6c212da73452636f59d9c5057a4e979f153033b261b8), uint256(0x1b93cbd323532c036f593982ccaceb576ff673fe1ffe2483f530090fbd215e30));
        vk.gamma_abc[136] = Pairing.G1Point(uint256(0x010e1af4a474327746eda44fb23e9947f17b3261b54c91b60beb682917327621), uint256(0x1919a97b7c57a2162722a3beebf2db295226ef7d0f7fc0be7bf8da873c66ce9a));
        vk.gamma_abc[137] = Pairing.G1Point(uint256(0x27ab70f9a563095db62d910e81975018df0da4b64392d696401a3062e0d7c7bc), uint256(0x1116842f9bac0b2528e46519ed2b28df6f0efadaf7f7825931327569c9293913));
        vk.gamma_abc[138] = Pairing.G1Point(uint256(0x2a833d4bc62dd46d1f5857e3a55e74f817d580649de6c1f7f23b2ed6f9fffe5e), uint256(0x26ae2f6c7b600594b93668420f47487d36019ccde997303a6639fa783cfcbf92));
        vk.gamma_abc[139] = Pairing.G1Point(uint256(0x143dfe5eb07bca5bf6728724dcce6e950797a85f1db096f1e6652b0ed16130b9), uint256(0x0d3f69110e1869acad203ad4b021171acc70edac84b8a616d34dc7c9dd6f5da2));
        vk.gamma_abc[140] = Pairing.G1Point(uint256(0x2961b9977f217217ee0c23cab3e9bbc34e22c24b76b8e747f4ac4b9ce6dfb1a2), uint256(0x10a62ef03ca50f64267e1f2ec5d3efc73ad815c7a0fe0b612caa7a65e17c02eb));
        vk.gamma_abc[141] = Pairing.G1Point(uint256(0x0084c364ee083b763913aab72d7ff02b8a99dce075f0f72045a5d3716e6cdc99), uint256(0x0c196e128658d54c2fcd959c62a00bb8664df15f3023840b054c1cc5986ce4de));
        vk.gamma_abc[142] = Pairing.G1Point(uint256(0x22c401401fb3a4bb211a45ad4e3bac80f82eb78f65a094452b3eae765d5759d8), uint256(0x02657a6a36b24b8f7e71ea77e18a74db15b4364f869abf6db4e00801d6675026));
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
            Proof memory proof, uint[142] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](142);
        
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

