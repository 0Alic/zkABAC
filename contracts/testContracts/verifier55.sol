// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier55 {
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
        vk.alpha = Pairing.G1Point(uint256(0x1c06d64a5adc832780ff801d139459a589e6c897022bb550e22f673b59b25cc8), uint256(0x01faa55f24a6a8b417582afad853435640fa7c83add4bcdec356cde065c73bec));
        vk.beta = Pairing.G2Point([uint256(0x068e9f61eabe11e413a49ad697e8cbbfc9e9780ca48b995c8cb7149319c44785), uint256(0x19a47a07254317bc267343e4ff563e37bc5bd6eca7243c37c879793bb1e61ca3)], [uint256(0x1175553eb63e8bbaceede9572616e909ac15c7551c968c8ba8575d3275fe5d3d), uint256(0x24a63e9c0da5f308c67de8eace6c50ec1f599fa9d54dda1d4c428a6eeca62885)]);
        vk.gamma = Pairing.G2Point([uint256(0x26cc95fb8f7b226389b9e549ab919746e93018057f24416da40045d4dd3b3be7), uint256(0x21f6b5b58e8086096fe759b4fc2e38c5c3eb73a9264e7dbb924cf93099f9c186)], [uint256(0x2408c35d2f13661f6c8bd93151f4580548a5bd64c128f09cd1611cc994020dc7), uint256(0x24ef382dfa194607fac3d12d658b9532a5ce81cd3ee77f7fcbc7a26db4ad8462)]);
        vk.delta = Pairing.G2Point([uint256(0x2d9e71f475b5edae452d3cfc3c76c67ae34ada20d06dd3a9e946308249e110a8), uint256(0x3057fd99763ef03e7ea8509d6f0971a54e68b848562e2a8143a4fc9070cde073)], [uint256(0x2ae9ef6803a021ccb1797fe4aa83b49957e38799073710596697e1d1d223578a), uint256(0x1aecfdfae153c5f1ee08663ab1ea03983788889d1ccc301be38de975f0d583d5)]);
        vk.gamma_abc = new Pairing.G1Point[](113);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x0ace16a85755f41f0c354cda2629dbae15897c4e76bd045247ec4d741eaa47f9), uint256(0x00c5b0064c125598a295f5fdc03a71ffff836fc5ae7841f1a9c6a8cb28d62a0e));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x18aa82022d2c3d0f8f3ae5d6f249f5c586f0b5a9fae8368bdf2b31e1536cb842), uint256(0x183b293cbbd643deaa4c6e408af371060971dabae72e411c0ae653f4d3e643f7));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x277252d3a35fd8b5788ff04d08fcce8591958b5578b52da1d2b39bfe8e3edcee), uint256(0x012170bea9b8736dc39a2e69528603b57f6579dfc4695dbde60f091fb31fe5db));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x16de19f2b14f6228e576feb7d3ecc9ed555d1f02196b4b10efbde3842f2620a1), uint256(0x16259490d5b0f3dadd4a12ee2d1fc58b7e83c364ebc7dff7767fbcd9a1d60394));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x1891f929172c7f33370b0e3f54507ebeeeb158487749fa4c3091e5c0d0c5efdc), uint256(0x2778d358937fb7a36e7f9cb5d4a63b78c4fc7545465a5d4d09914f0e9c01a64a));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x150f1e5b171ace2869479c16a49fa3f75c39eed45ab81b0bac4eec04550226be), uint256(0x01a5db13b4057d63ddb6b2142dc5869aab57e95f11a4a21b4bb56a17e14da7e3));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x05644877c90c02067ed93f8d5cc7f43f34d4e2ea27b894c9a72983a8bbf5fae3), uint256(0x0281f310841dfb27387791f181f48765bde777836b002642ea6be569712365b2));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x003efad9b3f307f9b37011ec0269b1406b85bab7a95db63df618bfebc0547764), uint256(0x081613336d254cdb5731d5f34f091682809ca6b04c7695984eb8fea8411bca31));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x0cb16eca072dfbd9c88c759953195d7d609ae409679d21d9b90cec178cc5acf8), uint256(0x09a12d929744a49d4d16f9b55dc59ae77e4b8be764b83b2c2d1bd952280ba946));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x12fc62d175f01f2e8a6fa34ccadb16cac66bba7ac10968c4fe93db42f19cf9b7), uint256(0x2241d22f72092f0c725ad4b0b07530194ff42b732e6506f26e945040645ffedc));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x2f67a37ce80249b08d92d0c1763dc5140f0ffa9ce78a0382743f229515b3d2d1), uint256(0x199ef3f39e7cb7f015fdc0efdf266aee57c5fcb63875561cc1a0b77e08b12579));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x2b8a0f3817dbe448cef91e0d783d2729e49a743e7716918595cc3951e7430b98), uint256(0x13b6806b571bd90f3c15a0870e79e903448aef92251c71035c0541f20f27f512));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x0c3aa2de5228f13f63dc7fd62d72d9de49b8b1de2e00c76349511d4f171f1370), uint256(0x0e61241bb794bd4fcfed04de3c66fc16f9fb6d1151c0c63f3d4c3131b61af2af));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x26bbb66a89a845ecd3b5f4788ba41b9adb80ef7904a3a72a82e853e522c8bb83), uint256(0x1141e33bbbbecf3c814f900435e5aa10664ae2eb2c05e5db9c1b889ee0d06f5c));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x195d9e34587eb8cdd45a44017634a52ebf9761b5116fec3ca0bd626f9fcf7dac), uint256(0x161d11d6a4f265b4d973d9cdf859ef9e98870737bd6716bff341ec91b9f5119c));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x1e878718c58011f04973058f03d6dddac2d9a2b255f5f4231c26543d1b77cf94), uint256(0x114741f5d0c7abe51f128c10d9c4b3690e3096f06b72e825614f0cc7d22fb549));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x0ae834b16a503709c4b0d49afcf54d388ec30d51f6cd1bab892fca639391da72), uint256(0x1429915c024a61b3dc87430ac2cff6f52e4cec1a50ce3c7b732fca24cf20544f));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x17d3ba43ad890f36a3b1d15dc3c6e276868c33b61e1bbb1f4a7ff89e9ce9b1ec), uint256(0x1358641cb9029f891794802a0e988e0fe329a1baac27b0b755f22f960c9126aa));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x002a9910851e423b67b17f82dfa8a50aa86264466950864e75e85838cce7fde0), uint256(0x12cc783fe17085fd18588243d263177f31657773cc438af3fbf2e021f21d14bb));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x2af5616d0cb07305686977f806ba9e09d39250bbaa3423b2afabd3d5620df2c1), uint256(0x2fce1384478c8ef71e6de6534917fe970a4f9f26c570e4b6d5ad564921d1d141));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x2a62d0cbc099fe13c7cf1aa5a1e54c2576c64907ab607b00c3b5994e658ae40a), uint256(0x0137a44ced298bbbb33582d2aad20c8f3084c292bef56195d978f44fe4877bfb));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2e7794eab3f699f1fae57f71cb16228b03c61d80ffdc4438defdd34e725ccb94), uint256(0x01eb29b7d68425425faea358d2737007d7853feaf69e9557605df056d9d35458));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x151f2f869a43475c01dc8abeb6ef17b4a02c54c6f1aebd53abd9941758e77831), uint256(0x1d8f45b431f4a9a30c4e5615333e205f6c16ab003c737240b3eb814c3627c128));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x285ea9a9fcce50b99a273936afa9d5b34b10a5fcb5f2a86f7f80ab64587839ca), uint256(0x23ba0d0a74aa6c5c74191758de1ad4d705d96015666bfeb3c94e16b88d2cf350));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x00e710796673a13575ed5e3b3585903b4d46dd0d01b88c77bae1ee9262711ca7), uint256(0x0527f2ce25aebd2077d0d60cb5dc828e6b02788799e90d8114ad08c12234af25));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x1752e15d6f1fff2b9108db705f8289a2712b654df81b5c57a4eef02e91fe61b6), uint256(0x05e2864ad9aac0414934e2e12f928ef2f59bb26fe66a1952b52c6cabecc9cef0));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x16c3a9c1b2bee18db6605359294f1983253d531bac97644a26dec0735c1c0b27), uint256(0x065dbd2dba7baee12844f9813bbfb4efbf5045d432c16fecf98a09ec5bcbe93b));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x1c1e34ef20c38225ad88c85eca73803f62473d5680a7ad72f3a9f42cb06f44a3), uint256(0x062151aa9ee4683d5bc7a5a20effd18b89f3bf2ab4afaa9d34f6fb7c98fa1989));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x23fd6483238f90633b3b8429e2f3fde44dec5567fecac9f3735445df4f0d4a1a), uint256(0x158a4149bea4ac6faa675fafe31044d5716e14cd539332f9875ab4162788668c));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x1c6fc04a4e8b7acf01a10346bbe1804b5e1ad6582bebcfdddeb4cffd9ca7180e), uint256(0x0c020de1230962b20eba65a47bd081134e56eda78566f1e00cb5617391557fa1));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x1bfa259b31e45accfbf4cf1b5aa89dd10b904985413a4449ff1d9b5724dec825), uint256(0x0e6e88afc6ab57e0efb5b067f26e75a55c78edf43c1419e18910d6e8f15487ac));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x07fb220711a6ec9b91e9082e1013a121846142ce84688b72c9b34a57ac79476f), uint256(0x22fe6d7a12c15740d6e56d5be8a6c8719e04f6f1418025f7466d6ab078cace24));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x0a8a1e7ca56fc73879f824b43bd626fb6da0e35d58be933aaf9dee84c50df004), uint256(0x19ce2ac6f385732c0536ea60f52411d407a3975012d38a545bd3607553c37deb));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x256923c60f7769101eeb9c60bc49a7b94c7472849b0b634fff2faedebf6f005c), uint256(0x18eda2e1360c1a7196b434395e7c563444c565b03f9b7b2d5116c26812901fe2));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x27041909a21aae4faa9415de7b3181e70a36b370392d8d461bdf6f5f934d6053), uint256(0x22137fc87abc0d7971e82e8e9c802f7823b20ec45d9244f401ba25127ea42f5b));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x0a1ca9fd6b3ae3f9d9329fd9ec2a2a3075ba1cee9b0ad68ade58cdce36e0bfa1), uint256(0x2e408d19e5398e12e2c7cf00df3a9611ed2ed0c193a28c39bc6541f87d5a24c8));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x1dc38354eb34672dee06b699f987ceba5aa39f17b581b1cb1ff28bd3229237e3), uint256(0x0af1876fefabd91ea74a95b2009de5cb297a580d7d69b55d55cf86396fdbb7c7));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x26a45abc25a4358c175e0a118bf352e7a7f72ff9e9b5829c2805b6b471910e30), uint256(0x2639768d0947e2e4dd0369103a939bd941d4546206b0a24d9d78efcf7de668c7));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x1f18c8ad02c3d1f7695d6ff4b7205cb49517af9f725fd56aa21d7ee9d7f9f8be), uint256(0x035c3962c2ac31f3b2c4717cf115b6095f83aefb4958fe2ccf1b7becd859eadb));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x257fcb4bc4646cece73f93bd0140ab07c770756da2bcbcaf92ff336e4638c8a2), uint256(0x1dae8ce2319e1ee891c460b4e68b5558d80a0120acdfc52c026e6ca0dbe09dd9));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x2b0c7bab57a10382bd9449788b5c7ff9882cb03a4acca31373eaaada1219771e), uint256(0x1825b72cca6b03c171279837b259e99b9dbbc1ea755f0c6a010976cf44b0fd0f));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x2e0e56284ad03910fc78ccefa40e18fb6b6dd6e4133a10329bf86145bab77a1a), uint256(0x2d960e8c9d2120504d4228f6215af1894e65355fe728f6018f840a5bae5cc597));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2a3601dd8954d9022a207cd8260d14baf06cd67b6121efe1be2cef6034dd726c), uint256(0x0c47664ad9ca4cc70d8319f91b0c78a3f5c01801f37844c895f3d2fa814fc295));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x2d084e31ccd0d4600c3a00844532d6da61dc2e86a7ad0e882513dd4b8034cb33), uint256(0x03a4af76a6f7d291fcda735d7c4c341f55cff3d31b5758aed2ae8012b362d9a8));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x057ba335914398d19e7f3ee340cf1123b18363baa2a75be78812f5e2960a89a9), uint256(0x256218ca1b82c83a25e00b30067adc18cf1de5981f3640d3cdb34050f10dadb5));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x1c5847ac30c9a9bf585c09403f84c190d2d05832361b1a70b2088222943ff87f), uint256(0x2d8591b06cbc6b5fbce14fb3c2ceffef8405c1fc65ef833e9b73a6f253e4e249));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x29d37de00bee5510bbda5cb45c6e9b63de5e9a8734e5fd6e14867154e51806ef), uint256(0x26f0bac90cb6fcf25cd4e8b5c971c013ce94f31cd4f74995abf81ae5a3c840f0));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x13126a8f9a308dfe31c77124686a33d0cdab9e3df4496d3ffecd003bf6111c29), uint256(0x1d8ae72add79b15619d1c3c5267ddee1f0ea9d160e551aafbc29a95609e4032c));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x1e7be127a02fb097480d03ce87e04720ef0578e4a8073e454bf5668cc9841b0a), uint256(0x20e7f1cd7492189a0fa938905498f68dda1ce564b6ebed3a11d012ea10521f78));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x153e8dd2fadd390d01febc6ab943acc226f907c8ead3bdf8ad204237f7bc0da6), uint256(0x248772143205ac866c95fa021e5a1853faa5df4fdd8561f4ede8c9e1da75063f));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x1d3c51baf7ac3f4f649a960e0362994b39f51555195e5e4fcc30accffcd84481), uint256(0x20e46d6266cf9c5f05a967c52a825d56dd152492d3c66321504d58b716204b49));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x14719f940f275a6f19ef4d1f52ee9d92463ac1d1501c9ced318ef1f989fe2354), uint256(0x06678335bc6a3c80ae87d68423f34e656424943179703f1882779b9a6ee1386d));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x0598b30dc24d8550be80a47ff50bbc92f6cac4cfac71e1375280d6807acf7b46), uint256(0x24a8a632dca3842edcd88cd81cc45f2cda1cef75c3585dcfbffbd82b3cd37f93));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x2e1503bfde54cee3675a8aa672645071dd2bcbc026df71272c6594bf69841ea2), uint256(0x1d1cf50f5598183e4c546137f33e1f3ef3d2fad91e9ec8deb184c2709a1f1398));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x045b69b8a00e843518f0a6557d5d1f523e7e8367b0968cb8f7780426b1589069), uint256(0x00389ecae4a99d629034d7bb98f671c637083dbe928105fe07328c3f87dee2d4));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x2a179ee762e81fb15456a31cae2dc9b614689c8249bb122914cdc74a9c2c58cb), uint256(0x0e4c5c86ab96c30ab91e2863334e0fbfabbcf6454202b4076ed5f47c32ae9e84));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x1fbc4694fca57b6d8dc807b9a7c239d4bb68cce879b40c997c9411969b79ae83), uint256(0x0761e7879bddebc7b2771ac93428eafcc46982698cc3220b054f153a1bd57f84));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x16846106e75f7152dff35e04d4260f413385cbead9a21d631537a817b12a8cc5), uint256(0x097e20bfa443975257d95bfbf1460448e8f914bb7658b28ee7c18de365c90f49));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x1f8038d40ac0cbe34c003f280f89e80b4bfdbfa6a8998c1bb22e75fe271b5b22), uint256(0x296ac67f6f08cfa9044fca9081479c12dfc1d83f62630dbf238df3d727065bf2));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x2cd4e0fa6c9751d137a57b01f0f2ec672d514ed479e689c0a3a12f377dd8a074), uint256(0x221e80fdba7511af22053a984f74ef96487f1e9f5c1e18c0774ce5ccaad45292));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x23a54be1debeea780c5191d87caa800ed1f45c676cdbe8efb4d8d35c3abe6631), uint256(0x2be86d1d188e4cbcb1f9620f3bdd58859061cc0f1c123c8b25c0a8779d8641e4));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x18f8208c802cc9ebb2edd55dced7f96442eaeb7fad73d5755799872a4340c2d6), uint256(0x1992920ddb267624a7f1a672222484424c0ae4eb47df03be864a97ee8c55dc7c));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x153dece2e49bd230b4c093e033b511cc3694348150bcbd0d77eeb14ab11933d8), uint256(0x290b804e19708505d06db4105929c115f7822b691c52f135c44fcb4594032c58));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x1ee5c3be795ac54f268feb5fe9ddd7e30fb73fac2db5e251ec4a72554d4ae9f6), uint256(0x2d812d47f595656f6deb7ff67c50bef6192467917e39d8fca0dc5f8ee20b0270));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x182a0b45a8cf5911bc258dfdb7169bbda6b051b1d39fd9c4b01b26206679e41a), uint256(0x12cc3f45847e4884b7dc00af7596cd7b36625d22e5637610619e678c3bc8a977));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x015a48e14bccac892c2b10ef5cad9d7df4043a2468ce48637772485c3c96ca2a), uint256(0x17098c4c02e3bef0ab177321b38658060503ec8931bcb7cc12e9bd24479c0913));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x0ef87038453d6052e10a5691e1bc10cbd28eb62005b9bac3698cdccc8f1e0864), uint256(0x1ee6a7638bd93923b4d9297b38aeaf0622ff803c23d087a296ba20b4d306975b));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x0bc6d054639176c58e4873b32ac46ca2309f1f2f335f7d22e7c445e382869e19), uint256(0x03b40ce73e906736eeb18db1fda8e1b7370aacf7abc008dd68dfef6d746b7153));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x1f0857295544ed53580516712c5c97d10274095c9482ec86d62b9e326bcebca2), uint256(0x1645e6783f92ffe330a8a337929d430f0ff1b3236c53648b099af31d94484251));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x1e2aa721547390fae5db4cac0cc839e210af90775295f4d7ffe8b3873d125eb4), uint256(0x09cfd94c841b1db0214f8b48bda73ae9b43f4947a2743d4cec88ec697b730d76));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x128d10c2bd0a78348c76a5842a886d3e02a81a157160936223e490e4be55fe35), uint256(0x063dac639387b02bb4f2b9442aafa035232cac1c08e735f7a9f4f0f58c8880e9));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x0a4abecc97f5b7048a99426ccfcd924841c05812c70a7f8412ab2ef7dca8c079), uint256(0x16a091ef9b86f2968b1eb4e624a6fb04267b151f0eeb62c51e0f8ad196d02732));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x28e2b62633c589423f3191172ea271850568c7d67af34074c7fa523a28b23265), uint256(0x2b5ed022cde92f703a888ca6516a7aba22408e2e94b78065f229935a3e379530));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x1ac598ac09fdd841f654b7fcd824f4181fffca9ce4b79c93255fbc6f6de5e5c2), uint256(0x2690cc733bd82aa42c305d3af5790e059166bfc77bf9f62c096e9a7b662b8909));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x1b0cc328c1c8eb05f6946f9ccd94a0261c20e333801e25d6e78e0e7571838e42), uint256(0x09d1b56fbc9ade54a10ff772f3bffada19c3768263ff314bfd26b5df0e725061));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x0fcbb6cb84830915f6ddb68269734f073ef70bb25af2840f69594b4fd2bdcca4), uint256(0x0e5f65ebd055c1114b2e5c3c34572233dd481a20ff10593a627aac20481f13a0));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x10af350d428a3f1dca3852093b4e755b27aa4a6204c0cba091605333ad9384ed), uint256(0x1cc0cca58c39d0528bf6d8470fec1dd17acbdb828d17926912a45bfd59e9c49e));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x2cdf8567f8230d32c86dc2a0c94741c698109ea0ee44dd7a84d151167ae5432b), uint256(0x04f7332dbd3760b8a7ffc3ddd2bb7c18ed7119b32959bf25f6b10ff2839325ec));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x1dde600bd335a4c22443ba22dd173f9a3594787823cb84ee2cd0d000dec8372d), uint256(0x106da806816018d601c89c73883c65b67f4227d10067e3e33f3f4cfb48832bbd));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x02bf12ed5e4ee95a71ce05e3c06ffa11420f670fc5fdf715c4f8c91c3e35fb62), uint256(0x23112722466a6877da76e00f3fd16bf2b3b69501ecae0ca73cc4f758fa78e1eb));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x1cd7ab74c1010106352c0627bfb79bdba0ebbe1f106a9cf46b9df150b9b94977), uint256(0x1984046190f32fb1aa3bf3135db6eba0b9d3865795d8f03b26730429dd5f1862));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x2d00d8e3ddfe3ab2d39af2cabccd12f18ceefcb9e1c24441fd8478a91da47876), uint256(0x0f208e4f2974dd2e437208aa8d49aa52e0f6a4f75219d10969d45dd30016bff7));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x20e9501d100229f1fa2c5afc173900ce37c604064259de5d0660e57900a75af4), uint256(0x1bd95b7869fc9ecbc82cf8b18b5bca32a3c14034fd51ffe4726966e563d23648));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x16b2fe2caf76924fe766bfd3eb7886c745b8ff526f0069a906cea2919739019c), uint256(0x120baea200d9020b0483745fa533b94a2dfa4cb315f12551a53c864f46fda34d));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x19d7c01a28e29b0bd7783ea3b47e2463e6a6d1f517693bc5c0934bf5203c468b), uint256(0x0d20079085d645cc222c779677d09cc0fc2ffab3e81b8366fd1e20a08dabc1dc));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x0d79ddcde83a9c2480785c13b87cd05ba9d9fb04c78113a2af82f348ca322fd9), uint256(0x053b3694d70b73bbdca204241652a8a0e375edb0ac140cee0ee22806f01e71a6));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x04ca924c1574569d62c7a78abdfd2808d038c48fa1420f1df41e840e12fdbe14), uint256(0x091507b54c1891a09f7c7866636cd89f39a24c7fe4e96e55917b6a35754cb5d4));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x12d1f800ee83c3bbcdce40c9a254a076f7d9b9c271a5ccac555cf2629572ba01), uint256(0x1279e0ac1c998817f8014d6bd546ffb28b8c74cc85582fdb9a6a4313f371a52d));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x195ee8cc48a22f0c4bf639031524580fbcaa581fa5102f1a1c4dca3f9be47f5b), uint256(0x1eaffc2f5023b19bec8e1121e9839f0efdb444bc0fa5891579ba82ec0ecee936));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x24be1d1613622055a91e183a6a4fe14137f4398dd3a89056bbd6db37b8d3f54d), uint256(0x0488844ef23a7dee2a5aaf1ae7339d43068aa3ba8f82348c8cb342863f267c27));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x159370cb102d0235fae1ea26d0231402a8c6d4e7105fd044c0af4fabd1e35f17), uint256(0x03f4e443e761d9a7a09bd6e2af2e828bcd655124abe2813a99d4780ca7673a66));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x0505d84476e484a1904f945f3959917a5eeffa102cc2bcd91340b986aac5916f), uint256(0x1ccf83ec8e3cb5d052d760376792b81873a38aad1d0e6fba4c565eb7173d6f7b));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x09da5794f0a3bf71b5c1ce7c21db483ce9d8d1a85bce4942002372d4cff29f97), uint256(0x241f0b77dbe889923317af6d3fc04fba64a86de32b11c31c5f4d4ddc8bede0be));
        vk.gamma_abc[93] = Pairing.G1Point(uint256(0x2f047d6b03440f358589320979cb933abf0d724e5b1b765f9371083e2012acb3), uint256(0x27de44dcdcef8e3c15c25a59f8220913b6082dc0dd8717b85911c60c76143573));
        vk.gamma_abc[94] = Pairing.G1Point(uint256(0x20021b38fc13a0a1f6f4070d2b885fe45417dfe7895794dcca6f0473cfae2a58), uint256(0x274c9c2023053768ca7506784dd336130fdbe02ae2e53a85043e2308995d51ab));
        vk.gamma_abc[95] = Pairing.G1Point(uint256(0x2c9218592650a20f608d64c036c91dad9901588c15290651190de23ae0f3a53f), uint256(0x24f1697e147e0168834ce1ead669bc13111d0e3390508eb3b249d647558b1753));
        vk.gamma_abc[96] = Pairing.G1Point(uint256(0x0f71b563ffc6b3c7c3c6cb16283f9bf74e393bd208c31ee24a738825e082f79d), uint256(0x0cf0b30ec336d48e36ff7598ff54f5d650d59fafe1da0a6faae4ea3f296a3f5f));
        vk.gamma_abc[97] = Pairing.G1Point(uint256(0x2d8175d2871abbf614c35c2144fb311e2f51f55bfe110afbffeef81bee0958f6), uint256(0x1b5b3899c8eef724f77f2ac7524b26496a3945f245527d549b78bfdb5f63a18f));
        vk.gamma_abc[98] = Pairing.G1Point(uint256(0x119015934bf151958f375a249818bd171a64d29256ef5aefb5af00155a361311), uint256(0x2cfca27061ad8264287f20bec94fffbe6569da12f52fdd8fcd2922ab8021200c));
        vk.gamma_abc[99] = Pairing.G1Point(uint256(0x1cba4c06dfeb5fee0e545ec51276a67c8f53daf1c8d3d43812f915ec6485f290), uint256(0x0ab08b2f358d2b4124d71a13d1c65ee2c2115dd04b3f97cd38d7559074a3a6cf));
        vk.gamma_abc[100] = Pairing.G1Point(uint256(0x288eeb97a5a2711e05c9924efcc99c04f60222909cb5830be1530098da194e4c), uint256(0x1fb7295dfb07341b67d7bd818034681c148106ad5da31043ac63b886497657a0));
        vk.gamma_abc[101] = Pairing.G1Point(uint256(0x16887dced735cd4fa6e342f44f0d5c795a9fe5d706e5aa0a4bdbc33cfd9557a4), uint256(0x2d01a0f4a08804a122da1e203849988c802a8e7954d47c435f73cd065d0f3922));
        vk.gamma_abc[102] = Pairing.G1Point(uint256(0x0b428163fd837c4719bfcc3900d32a45a45a234e728999d4757f4a323b420db7), uint256(0x27641e9b67a061e856f3ebe82eeca0a540ac99797f46dbc4108ff1c947fe7d83));
        vk.gamma_abc[103] = Pairing.G1Point(uint256(0x0be730f3f20c91b1450463cc12f42d0289757e9dcd8a4cb8e1bd084b029bd0d1), uint256(0x0fc16637d4af7dc0823e4a327f28ad17811f554dbd84b7cb848b27ddf9ff4950));
        vk.gamma_abc[104] = Pairing.G1Point(uint256(0x27b8cfae5526159964dd54558de4501ba47ab30662a2dfd6f0198915702798dc), uint256(0x05953e4faf2364646c05746172870a7dbfb8278ca665cf27e0456d407fca8f21));
        vk.gamma_abc[105] = Pairing.G1Point(uint256(0x1409a7d4fbd1370d7b5138571d2ec99590bd99207dd88ca24723bd5383313d04), uint256(0x047274fe02db4cd95716415c361f6d04ca5ffe981cc3221d2e2cd677181b7a47));
        vk.gamma_abc[106] = Pairing.G1Point(uint256(0x0d47b29275cb5f015ceb43fb11778bdf8d7c73559b1984db0817639823665ef0), uint256(0x0131936d776faac90ff98a7aa12cb54538946ab5b962d1ab102b2f21f131a915));
        vk.gamma_abc[107] = Pairing.G1Point(uint256(0x1e8610784d2314333be77bfa9ccca5b41a6c0d57bae75d2717e6b2aa26076fff), uint256(0x19969715ba47566a58e4cc4ef2bcb383d896b1f7f7e67516e93dad61be5eb562));
        vk.gamma_abc[108] = Pairing.G1Point(uint256(0x07f678472a0e76467adc269f8848b97533942fddf5412f22856f08889954d13a), uint256(0x289d02ebf373d1ece164fecef58d6038f483ddf6300b125e06fb31c329fb4919));
        vk.gamma_abc[109] = Pairing.G1Point(uint256(0x2c2785ec9430e46200033b4f26068de849c154d62fe5fc3797772de881451dbc), uint256(0x1f523363dba8a6879dc30b78a3726498b250ac6b3348cbb518fc6b9a868b874a));
        vk.gamma_abc[110] = Pairing.G1Point(uint256(0x135b03b719f5467a897ffd441cee39aac7664d87a39c8f4ade0910915601884b), uint256(0x28d73250fc641d5575802b8b93b47b17f483d4cd402b1309e73cb211f5950baf));
        vk.gamma_abc[111] = Pairing.G1Point(uint256(0x0f7e44d30cc6f1969ae4e3993ce027a153fd4acd1fd4ab9049d6532fc9e5eb1e), uint256(0x2965b9b00204de3a17e85adcbe8373002b7e3753c6bf99398b9701ef1e77c367));
        vk.gamma_abc[112] = Pairing.G1Point(uint256(0x2d260b26e91443ced87f3909089db957524925c2b31637f363a65041a4e3d675), uint256(0x13c31aa6c71b1e30730ff33c9ebd152bfc285d7d1585f13e4a0ee381a91c3cd1));
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
            Proof memory proof, uint[112] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](112);
        
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

