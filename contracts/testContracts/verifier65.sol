// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier65 {
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
        vk.alpha = Pairing.G1Point(uint256(0x15fb9a8d5489a1b0d2b725a786ae8287ff134a1265ebb289527b0155a4949a27), uint256(0x2d6a3c53caf74f33cb666fb9bfc57c6e8075cd1566d46ba6c8ea8ea9b422b6fc));
        vk.beta = Pairing.G2Point([uint256(0x26d3dae9e0837363d72da0aa7baa3ec39c2d786cd7ae22f62946d207a018bbb1), uint256(0x1d6ce8f6dba0c78ca7558a7ce30d6f7c0856a86e34f3aab5cd9f8fa50f8451ac)], [uint256(0x28291659b7bf8ca54a16eabe94265156f0c7b19f733daf75406cfc2462ec4836), uint256(0x02ca4fa574ed0e15c59d2c29f09fead5fcc23e04d10946e723a5fcbfcf7ec43f)]);
        vk.gamma = Pairing.G2Point([uint256(0x20fa7cb423b44cea802e8e449f95e10d73091d5e1e980096e1c8b1f237172a2a), uint256(0x14f08a656632ef3b6a668242f30b663924393e9e182a8c505c0500f737bdaa01)], [uint256(0x09ffaebcaf18b8aec0cc9bf839af82a760034fa468376f0fc832da15ce55a6b9), uint256(0x2d6231df175c0aa0b9bf406aabea4166dd2baaeef4b4fd5a3846af2795870623)]);
        vk.delta = Pairing.G2Point([uint256(0x1f7c4d4fd2bf3af2780b6ab6f341466a89136df73f3ca49a478e6ea65ab79806), uint256(0x0be728f250ebdbc5be1f0ced017d7550df0f9cb1d4ef7684b76e2be22ba49a1d)], [uint256(0x209312d02651070d0d0ca9898ba30e0026990c3f78e2671b961d024dfc139b6b), uint256(0x0f09bfbc5676d0d5ceace54ca9248a017a7522033815b99b01199c3babe75f52)]);
        vk.gamma_abc = new Pairing.G1Point[](133);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x0bdccc66a1a07ed2f76b5cb2d406a34a5e96be2b2deff43831703722a6e444bf), uint256(0x2b3709ee3803802876efeedaaf154ce05f983721ffab0cdfcb43db6bf53152bc));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x0278d5011d66a1c9f6f61dcd6eb134ef082d29bcc089a1173e79347203209125), uint256(0x119b0acda2679573f5294070e271cf13e5ec2b48ddd4e3f687d973b6085ee6ca));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x254844244fa045759efec53cac5230dccf25fa1d1411bb1de6e9c9fa035983bf), uint256(0x015abd7541b0768cd80ab8035c056dcd6079747afb212172e4b57a6f5e1f6e4d));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x2ecc445405659e92dbb2972a2559199704ef656c8628ea7d710f9537ceafc044), uint256(0x0385af62e89cd0155d8a51f65a04e276fe3f7c6e8a058ad226a645c65cdc3399));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x22b44c02aec71ff8959ac891fd8689ff957b1571c347f13953f2e4a388c7fb62), uint256(0x24d9eafea20bb9df8342a0f8324e516aa0b5c255da0d99d3203fa5903f17402e));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x1711c05b97f9dcacb12fddba9e5296e6e7c4a6893e2c86e7f382640bc68a6926), uint256(0x13e0d9acdc5eb3f59e79fe865dc0ae2e7c4b9445ab9c2f76b49e06bd3e725eee));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x1edef32e9483125ce4bf723f442ed071439c4b8b055dc43748c1fdb3bfd69c09), uint256(0x094af708340b5c43206c919ea2f003cb8172228651d3187fc7444185d37d3efd));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x0238e29694bb7b6f4099cf93b1d35bef2ea56a1a0b35a90592bf874372cc39c6), uint256(0x0c733ab7826a6456a17bcd505fb24bb6cf2bfc8ddd98a4e6549113682975a5b1));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x0e1c2cc6e14ef0dfccd87c1b61105e199588c4e9039e5a31594267e87c1d4648), uint256(0x26ece256b728498134f33eab2b01bb00f5ccb5328cfed59c4c066d06a30699d3));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x1259269593efd02bd126f7a04190c54f55a6346d5f36b86cd4a1b093db8e5496), uint256(0x2529a01ca05a30cf727231a23379bfc81e8c611abaf7e2b57146da66c14aa02c));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x02cfb73ea9315135d31de0c17cd82d4c6139dd6de85144472827329cc4401945), uint256(0x2b8264345fda8fd5113f273f82d2cad82f727e1a921b6d2336b9120ee5622496));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x1dd4a0698f98eef718bd2d44ed1129f8fcbd050f7c1af1f30707686a223af9cf), uint256(0x143f7c44e853e54dc3610101ae34da636c29c28d87094de7ea13751d2d334f5b));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x3037318fffecb168c84d464e6f849bec57e54b8c2b8a629f137bdb75df661439), uint256(0x0caa34b6aac3804172ded26b99f8e9018dc6f9cc80b4089d7ef0e3d6bb1ebf58));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x22ce9e02510b473b2eaee5e54330647b8cdf46d728dd6b401b55b90956f31622), uint256(0x2edc445f7b47d0e8e9de2acb2bb1a8d88a8b7edcf83fab0adc3188fc24eba647));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x1e61fd21fd27dfb615c4b31d702f9588c16a2f9031fc6e2e62e43c4c4f94db84), uint256(0x28882f0f6b01f09cd5f17b4a429c3e261bf6e3051243b750e9275a6ec297697d));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x0bf76af4f661b91ff81910040733c214863fc7ffbe49804cda5884cee3f13be1), uint256(0x1c5ac252b00dc38a975fa8d6a5ea21fe6838874f2db6437f392fb75a4ed15cca));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x1ec538da65a6f1aa78bf52cd4f148a37eb6f34db5a1e8fbfc2eaa9943f53432d), uint256(0x140a480a3329d2c42811a28bb10dfc3e6a2fe4d970eac00c164f3b64cb3f3a7f));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x292019486fb13542e223eca722b8cacfe961d8710b83925dcab753c8d203626d), uint256(0x29a960b7fddcce9f1cf72484a5fb3cace996092d22622f6cb017f53d9a79e593));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x2d5867545e376d6dd33c86ed61a8f160dc3ea88904825a8ffb13f5f8ad7c189b), uint256(0x2159693bed53e0433b21a835155c71e31ffb98e69ac23a0e6efca157edbe878b));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x1be89d3acf15e37f5b8e358868d693bbe5ba413cec0554cdcb8f2170426dfb37), uint256(0x2f09f65aa088bf9fd9fcf342836fb1bd7e2afeba94f21c8bb12aa74054bab343));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x301e18f9d194ce4f60abfeaa7a21172578b4a04f32a414eb29ed7344b13062a6), uint256(0x2652d43b19aacd95813fac8200e4b178d005accc3caef5d01c154aea561e78c2));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x07a4aee00bc032116a38af0ff951ee8ca143864e65bb35e16f03acf85430f77e), uint256(0x218a6023bad4df830446c2014a5275c006e9f3252c75efc3f8c58f1d838483f4));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x0dfd70df179b5a775ab9e6fbb0cd93101967cef915369689bdee1a6516c52d1c), uint256(0x15a26c30c0f96701ada4d9b1b0cd22b970b5ccda9fde5a68c1b7efdac8a421dd));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x07513673d8e1a4e106ba960a3770057841c73539a2b95e16784d37cbcf891a22), uint256(0x0410d4e4ea7d5f3f4d54d7abdc9758205881d64829c8c862bd2442a3548c0952));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x12616dff25c4533c945b4ba68533273208533f09cb8f7011cd75e993bc50909f), uint256(0x2f7904c2fd855855affb0c492522b2228d64ff43472f1d5130546aa5be9728ac));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x19e3247d105fd008e4521d8259d5a1bc5412bfa18f6687946433208b8a69af47), uint256(0x04dd80bc9cd7cad85959729881410b1078c3d26846178903f1f32d30101dc62c));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x1241df809a8db72dc12bf5f1267690ec2cd7c4230c684d4960b52d01dc97a2f7), uint256(0x11c2cd4fdcbe4dd2d4ed0644f51878896f59b48254b2c75c4f8c07bc50a93026));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x10bb766acff6227d62073f9e5b5faeab0b9c41b26f30181f677cb34e16ba6fa3), uint256(0x18a527f9d18ace50766db4d39a06c504c480a6fba324c043c842c46b3b83a913));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x141fe85d81899e9e6506dbaa110dfa536916ce22579dcbc43bada16230c965c3), uint256(0x0e60235fc626e1885e01a658cacf8d23afe0960fcb4662ce6beb1da956861396));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x26977e2354d14f93e2e02564a7ac5f5fccf8534bae2fb6262338c87dcd1a5ac1), uint256(0x0385d52a19a8e761b78d08933fb0de38605459a136888c7f61fc4a9d4a3b5a65));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x0f3304ccf164298c87dfebd835d0be810acc891791bbf5ba1051d4fd7163030d), uint256(0x19bc7b5f283108e5be847a47346439249d1c8b1073aea6ef44025200f274ed29));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x25db40295a284432111734197c79d3216794a4c3a09cb669fb9cb99e061924cf), uint256(0x1684f3da01e726b9c4393fc87ed7be06298d49c00ad56b6214ca6fcba60e8afc));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x2cc9ee6ad7f0cc93782aec4dec5ecc30bcc44e5f2bf7ad7ed712872623c647f8), uint256(0x21c11406a0779447dd441c1538b9248d493851058d36d2131eabb45c00ca63e4));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x301ddfde8c5b663a92d9bfdc6998fc97769c31b9ed13f4825663ccda255295b9), uint256(0x1784e81faef385efa0c5a3c5cf9acef1655e20791b3f3ad40f2c36bb68572d99));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x0ef5ae5123b8d89b5012f4ce7c1f875db1ea92c8402ac3055f41a9e1d011e5ff), uint256(0x258fd65bfe38da147820f33759a7aa2aa11b3f7e99c7913ae636613d252f3cbd));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x12fb24ad208d10b62835dc4e299f37eaf8da51f482f314d05184192f8c494f56), uint256(0x2355f1b39c987b19f2b1c303dbace20efe1418b090cd60a6e0cbaa88c0a23574));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x1d83669da39d17c33bb0367bad72152d820b6773014f5a59b2ad252f52bc085c), uint256(0x0bee4a0c6b5da8fb5ec6a59ad41b89fc2e5a7ff64d1c0ac7e026a95849611ecf));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x165e46abecc7abae710dd10e3657a49276eb5d8910630730d1d19a50eef321ac), uint256(0x18573d0e46ae716f84930dfd89f1c44210f9484035a351481d3951a4c201143f));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x19e2279ea654bc762e9b5b65ec30e2e843943d5a27321a6b0c3c891480a08a4e), uint256(0x0dc64d2e43fd9da0c8d80ae938140fb0cd3a98baf8744e68d54df39e3b428bb6));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x074ddc2fd5f8438120a4632ac51a0de1dc52b127a325caa25699ccb9d2bfef39), uint256(0x2fbe37ee68f88056a23e0f4fd778d9069c36b7ae0d51205ca4c153e930738ac8));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x16cf77abeb1cccbafbaedd38c56486adb7e317477fb15fa8697e38e696cb8acb), uint256(0x019f2ab7b5c662913a7b573d58b52008dedf45133b770995e6e5c2f3c726f23f));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x0cfdd59ed2b033147128bf963bccfaa6c8fee5a095f5f213af65319f7b8061e0), uint256(0x16a1a77863a8b894ffa2893ed538943ecb77a3dd0b70cbe25890adb9c3b322f1));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2efb36f5d34f700288998c325da5d9870c9032258c62b24bbb6df633637fd99f), uint256(0x0fdf471168b6cbe6ad9b1e510bf7108a9c596eb9d6ea3b6e6d9c6638a9ffd570));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x13d113440db2df2c4228643ad9e0b59c0917776c34b7b91d75cd12f4b792e8f6), uint256(0x10ac31160c42e8de26e5bd9731d9f6c11387181c73c9a07566af5ebc6713665b));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x2e08fa2e88dc2af61717603ddc218837725811dae07f3e5d7138682f3e3ca712), uint256(0x245844116959cfd8e8933c1f337d985ae3521353ed22584daeb4196839d789ee));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x02b39452f45bb431c94f7e93de575a81e509a9d06a9a2e9f7578a3ee4d70ecdd), uint256(0x0472f98c365784619ebef6eca12fc070b9b5290d2fa7735825d8d88867851b50));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x1f45775020e5c8f617ca13d40f1bd846bd3c6c00a4e8603399c469621da2450a), uint256(0x02d69fbe576cc9423b97f8634a94a57da7e226da58f02f0f7834be328e4b1fcb));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x29071787f726e3ff9ebc05c12754f2e60f00f4b494e496fda2b17caa4166605b), uint256(0x05810476ebe947177ca931c5225cb5e67f45a8a49a5255197da64dcaecdecd87));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x27f645f9249b858456f7157e901fd18a941c366626cf2b29e7ee943fa0a7c13e), uint256(0x227de509c20bf1b309a2554da2c325de5ea2a003ce4d97fa7a10685cc3c14b5f));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x0d897c2d61492ff74b9fedcd0080a668d4fc7eda87ba5b8d74200fe34c9dffba), uint256(0x158371abc52349a4a63dad2ccf66924dede052921687bc3032ccdaf80195ecf0));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x07e04a08d37474701b6e56f1603faf0c236fcc1acdec81dccde2f40ee4045df4), uint256(0x011aee4852cd6fca3bdbe0c39a70a88b9e6df2ca14f300e9fa18168b4d956955));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x17689a6dbc422452ae1c0aef54778209949ea922c6fff7aec8f43d78a0379846), uint256(0x15a7120e4a302e33fefed2b4784054995983564639347983205de732add81d11));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x15add5a7d3e71c97bd7a3aa1c8cce1187d8ceb5aba06111d6e27b5b074144976), uint256(0x16f5dc8ccfab7f0b6aa47c0b871dfac1415e6a4361bcfcaaf1cade6aaa460eea));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x202ff2dd23db8a33eb3db5b986b74e54895df60e5a3d444140cb539f78ce5810), uint256(0x0520bb9033421cd1681635d496ba855fa5359d192cca93b4a32e5a0b7debc9c7));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x20e23e64aaec20642ed7e609e009b3539c853cec60723e15e2e882df5b3682b2), uint256(0x1dae2ad26790bd927054dd56f7f73091a2090af7f4ac5fc3bb9c8c0f402345dc));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x00d574719c71073af2425b8723884ac3e572c918605bcf89776e953b721643b2), uint256(0x1af83430d0cf1c949f221f031fe92ae0cd1c1b0d55b44a379aea42f9b368a46f));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x18925ea500d69df6a61077404b941b25b5bb31da95371df29ed2a136d57b390e), uint256(0x1b56b97b8a7b8e2f60ba70909e0ae98a4aa620c848cd43ab64f177bd0ba881a7));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x285a2e84f52d58d230cf74d71f6dc1b37095b8b67d776b7388f8272a1a54e291), uint256(0x1006f991dc13cf3b377e214b37c45aa59aa0ecc8d7809bbf165af950f4964ea6));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x0312df763e679ae261b283b119472cca2168b7aee1d02fe46326b0710515bac0), uint256(0x0980d8e8af6495a3c29052f8f0838b828ce55c25ed5b572c6da98cb5cf055ccf));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x194e7541543e88d7efb16f1afbef8b940e870f0942a3b3de6aeb5ad55a80747d), uint256(0x03120e7551fa3faa210ac131bc1efaccef381214f3a46e99bfd415ab24e54009));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x09305b7671ac4483b7514cf6b5030e4cca855d45fc2cc31a15108ff6704b3666), uint256(0x1203524b8cafb3245ef2fcc6f8560b9d2638790b0b6707d4ce94d896df7489da));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x0562409e2d0a59411273f239a8fbd3d16c24a8c33254d7e851e03c56748b10d1), uint256(0x16a4648c25aa64d5a9a87479d085a4230a0fdbdf43c3191bf3f4d2786a908b6c));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x228c451a548bd50e6462c4f0853b3a71f30afbc0ef075ef934894f505be2892f), uint256(0x080d28d39a29b355d7e7af850ba05f374ebcaf450882296babdde7b8f8a54cd7));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x121192441162a6757bdf53751482dc9da5ce9ee86ba069ec4fdfd1aaded24301), uint256(0x26ff257424a0a4f4617c8935d3b15371ac6dc752d6b72e84ecbd9c6e39b94f15));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x01fd1552ac0d29ed4c96eb04502533acee2615e8dd89fbed7af9fe9845febe02), uint256(0x1c761d2129aa68d9d2e73e2f831616ad3ab262b074af8cfb310f5d3dd1042c97));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x1e8666620c073833f62c7548a39e61b301c7ba3ececcf369f12f72abcbb76f33), uint256(0x018dfa37b62331a297b85051de2dd8c21b94e66e59f48e52e71eeceaf85d92f7));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x2bb19114d508cb06802f5d10fc6fcb145e575b64bbbd658c2b4daaf62d9e2ae2), uint256(0x28a1d561cc4261769efdad0a9f20b275f3cb11f4df3a18ff72a031afeadd513c));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x1a370dc58152629b335df13ebb7080c29a0cdb9f9153e999e4569493d5a26b35), uint256(0x25a093d98b83be0247261d063a6b7b69e6cddd0f0f6e639e92fa5f646aa29037));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x0942e63d6d8c83dfa2755a63d5ee7bdc3db29eff44ad9b4835e843b11d78ee9f), uint256(0x2c2860a77dec56eed3d409815d99383261b9be39f605c5006623fb70bb070a5c));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x0c46c1ee9d5ff223df95377ce10891941adbc96648466ae6f1b1ded6f4efdbaa), uint256(0x05d42b1b977c62180092290e7dd7fbf5b02e3bff931cb394eb2557a3d2a2fa49));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x115f19518e00103c2f49ec675894c082e0c7b38b2d0c505c5a3cba3faafc4996), uint256(0x1e0209aea7def0c804a5a29128a04f97fbafac0f3eaa2976ad87e9bfc59ffde5));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x0840b15a6db44e6d3fbfc0797b26012fdae2236784f2af8d0b0d11e4052b5c6d), uint256(0x039343b216a5eb6b898de075e11e3bdaf419fd0710a6dc5148034914e7e72ff2));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x015c6cce9e36eba6de5fe2be263a33cabc004ca198da636c454d8e28425acc98), uint256(0x2051b75f2b16231f130de5423254b8b8d76982a1b95901a706d2f97ce357b8c8));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x1fb29279734cafd5bf5006de269146e091b2c2a3c78eb90f8e0f426e47b45760), uint256(0x2749e021fa8d8e5de6e6140ea854934723062164626fbe007d06a9f1a33ef0b5));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x260be2f16e094df6be221f7167abad13292d8254278b0192fcc99d10dd0adadd), uint256(0x0954499a39a9e58d9e82a1ac13021951fe9985531c9298e39877d698da45c76a));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x173b5839c9c7f05e277a19716cdeae1c918aaad560140c3a18c45e86113c538b), uint256(0x056882ac30339a10b996f6402e5d82e0ace15713517a471e7fb3acc848d2683b));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x238e173a03bef3ff10549a68789597d09546f3754d43f9b80ef86be9040bf587), uint256(0x23dd08dabf345712c20ba59dee3c4c4999c4140b7589c54006246a163df2aadf));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x068a494a7bbc9704b8e35265eaf9ddcea8d214029e76a88a986628387f0e5334), uint256(0x0b78f3b7aed35b7f70b755cc391e297e99f88e0c9055b4c1371d55256439999b));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x0aa3e2c357e34abcad7abb88924646476644bbb64ade6ef25e84ea0336d7f7dd), uint256(0x2cb79147b5b33a165e7f4734e34fd6d21afe2b67fd965ffa4c5662cbb0bf8537));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x084a7028b0a07a1e9334ef013af84bdf6e6d2015c7327427f7d48568686bf015), uint256(0x23f0a870dc64fe4288b99b0c97a3504324331fb0a49b315f1a05eb67b5c868ee));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x0fd810214237683415cf8cc7926a20f794146eac29d0c8424a1233a6d7704130), uint256(0x153bcdd4ff70d33a2f59010359846ec391c0a5e603e6b35b33765f4dc0f12bd2));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x1c901fd1f056b457fa0c8802a6c29bf438406c1b7d182b8e5125242505fbc395), uint256(0x0aff805855b54d3063b823807b920096799f1eb593d4990a82de3f1763b6119d));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x1265ac3535aebffaf8dd76aee044b6e6064dfbb9615c59e42c65cb2cef1c0baa), uint256(0x29dca902668a27d6d8098c824769c21ca85f3c6bd719efe9289329cd93ab11d0));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x0ba375ec78ff40455e9f071e6b85edebe12893b3cf2457086a6e14e6cba004da), uint256(0x2f77c161671d6b913493401db4e7fd2fad4bca2bbe36bf5fc04307d62aa06f7d));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x2f1bc823854044fa34a50dc1ba0ae819bbf71034714d70108708e490847e1148), uint256(0x0f0c40c71b9b394bc911d222ee966291bbff37e0719117200c85d750a8cb9550));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x105b9caa9ece6802be49b70dbcd9f3a064088ebc6a6becb1eaef59c7e2a3e9ca), uint256(0x15e960fe2b3eb43d35c0b7c38b4b6f1118f261c6b215047e2225240f0331a34b));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x19d03d60d47b3a967fccd3418b0b14c4a4c9e053621bd0c662055ecbf23c5bfa), uint256(0x0392fb74fdc3a1520185ff807fb6bc43c0d148f4f3a18d21b8e7109fed97dc10));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x2b3e59933202432acfc22f6dff961c028250b6421118da5508725a674db56682), uint256(0x2678e55ddb3ebb594df30fb1f31875889fed7c76390c4be1bbb8089b5c09ec87));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x2f8584966d1a9e660561f3c6e5e33774923935a84eb5a1cf5b66cae8ed0d1f39), uint256(0x2017ad573465a427c9a106d3d863a1757af8b537c78ed7defd0a992574c0d849));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x2310da0b1536296b1f4960a808f269a75f3abb8e5a2564ac6a6f4580c3ba3b7d), uint256(0x04b6b766b5bbd37abf65c9c2412256264f93780ce0e785f32da5b03e49a36906));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x01453f12bceb27d7d9e621d3ea760721d9e7b60a5a4f4411e034f7854571ec94), uint256(0x0106861b197576230eff3a4ee7c1420c7590ffdc4766e173cd2525b428f1a1be));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x11dbf946dc37a7b431bfd020b735aa61a518be51c372b5d9bd73d7f8738cd5b4), uint256(0x12a63ecb22c4f68a41cf4306eb5337ca87d8e70d1e3147073602c888cfa29f41));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x07f7f4ba6c47cc1d8c551de8444e3ad5012d7a88673280343be4398e5819276c), uint256(0x1a9a888ef039c34d459a94ebf8e92eef5b66fd26a1711df1e726edf0e5ddb2d8));
        vk.gamma_abc[93] = Pairing.G1Point(uint256(0x1a7282c6a7367d27fac436238254b6ede1223c241d7ff2d78686a5586fc27adc), uint256(0x2d6b9639336f03ed52e4c2a739089225562edc36e2221506b1796f494e4784d1));
        vk.gamma_abc[94] = Pairing.G1Point(uint256(0x208ddc3c15a9deacf4e2266308ae9a523b3cd443ca0ed3a5dae16988a5db47ed), uint256(0x2c9d422931e6496e06528a364b27d13269e06d889f75ce9ff97a11527527785a));
        vk.gamma_abc[95] = Pairing.G1Point(uint256(0x0816d18bba849a35c9cba381614a974247b8e2c27306a4f804425bd79716d900), uint256(0x076f9ce63ddc73ac9862188249d5bcdd1361349683635acb2895413ca1d6c1e1));
        vk.gamma_abc[96] = Pairing.G1Point(uint256(0x2704528447683a79ecef2283675199ea6f06688f879416c047d52d13f81aa8c2), uint256(0x19eaddb344ea50b77ff2e72f0f2f6c9f6cd2cf079bf35e9e6e9ed65e48aa370d));
        vk.gamma_abc[97] = Pairing.G1Point(uint256(0x195f2b52b9ddcb03f5452e092ebdcda2e27148d118ec2745c1710323f170b381), uint256(0x01059b268a99bc6153396a9701d4bb819b0a91aa6684cd36b43d92cfa474515e));
        vk.gamma_abc[98] = Pairing.G1Point(uint256(0x180672fe5fea3348ffdcde8755eee82144f7272cc2e2e44138c73082b26fd77a), uint256(0x02e2b333cfc0e1fba4492ae32a81a892818b6a16f6e191d607bfe9a7d18ce0bb));
        vk.gamma_abc[99] = Pairing.G1Point(uint256(0x24cf57a72e324bfd3fe8272d6a7b8fed032d0278bb2bd4a0e47c80ea2801aaac), uint256(0x20e8677983c24260f04368388889a0269490c817bfcf8a2299e6f4381c2c1e48));
        vk.gamma_abc[100] = Pairing.G1Point(uint256(0x2123499fcffe67ab7017d7a2815b9bf971668def3ee35a8f1ac4bf7aa5b998e2), uint256(0x176e886c3172624114904cafcebf6ca43a5283a9b6968152401d0e62302acb52));
        vk.gamma_abc[101] = Pairing.G1Point(uint256(0x183b4d860187c97315681e981e01d27860264a806b6bbafa794ec08b7435dbf2), uint256(0x1dd5b6eb99aa860a43663e461530103addc0b2ae6f57346ed2c792ebe0c5ea78));
        vk.gamma_abc[102] = Pairing.G1Point(uint256(0x08dbd0e9da35a9455727e953c6d48dc0ac2f1f9fd4669adadd5c48660888bf4b), uint256(0x0e976c52a3be8444bcd8c681fbde423cd75a688c9497c6063b54eb4f29501f72));
        vk.gamma_abc[103] = Pairing.G1Point(uint256(0x293f09052b25b7c3dc2f032fdd387a47cf0448ba04ead9f7b06d839564662c62), uint256(0x2d8ec2b59dc896e8e3d1e99de47aea9b6afc78cba125fb3be5b1af571b536129));
        vk.gamma_abc[104] = Pairing.G1Point(uint256(0x0798e770a629803f4e1ea01f75bb11511309db70e2d9c5f7fbc60a0288a5e06a), uint256(0x1dbaeb5a8c7a84faf9e76563f6752b5fdda22430cc006c19ae044b3d2f6778b9));
        vk.gamma_abc[105] = Pairing.G1Point(uint256(0x1b323c36054a1d5b852c548afc3de430492018fed0d6e46d6045be67aaaa25a9), uint256(0x081cda7779c79435d2e5a4f07684c860b0e9377db144e72f528c4a90d4f875b8));
        vk.gamma_abc[106] = Pairing.G1Point(uint256(0x21cef880ba2b25d482933c16a99b251ab26c96b74f39e040caf67676d6102e69), uint256(0x21ab54898c5a5458dca773b221d8bd8b0ef04b184967a8e5ec59181a143e220e));
        vk.gamma_abc[107] = Pairing.G1Point(uint256(0x14df7376c45484b02358f35b560a51bfbcf3fbb51d338c9ba457533513a625b6), uint256(0x00f9fa70c178a9ada3b856fb4ff5585dde3e23e57c7781fe06f584580cdffd84));
        vk.gamma_abc[108] = Pairing.G1Point(uint256(0x10a181eafcbdd0076ebcd4f80171be979df71f476bc17a834be494dd71384fb6), uint256(0x2b0b9f15fda1c781e74fa51ab8c523a6cfdb4ccdcae6c8a422df13e47395a000));
        vk.gamma_abc[109] = Pairing.G1Point(uint256(0x0baba53953514fb1dda6b5fee5fab7eae3c85106ca9a432b07c06fa15a412625), uint256(0x291b7426c9c4f8e3b367b8603ce82629829b6de1e8ab184d186eb6a728e59a85));
        vk.gamma_abc[110] = Pairing.G1Point(uint256(0x22829323fbc3f9bf5d5157d0eef651b079f468ca7440e0238832b9105d1a40e3), uint256(0x119f2013e4ab75df37676598809c5fd690a8c14c55420003a5637d71b64d860a));
        vk.gamma_abc[111] = Pairing.G1Point(uint256(0x230e2b8a9c7bf8974f256c2ec5edf3d51065a63e21097c4f653936e5fabe1f4e), uint256(0x218aa19c88e143d1556d1509fd23bcec483e34df1594218c968bf62ac26171eb));
        vk.gamma_abc[112] = Pairing.G1Point(uint256(0x21392bc8acabaaa6f1b07c82a2bbcd4898e3d96f7937dc1bcd2d7f8eafcd190c), uint256(0x13407335ca9fe10c368cca9839e288ee393d062979b095af681906e8481864a1));
        vk.gamma_abc[113] = Pairing.G1Point(uint256(0x11ec5f679fff6bf070016361f6c820cb0386e814f03777f0b54d5c1e6a036b75), uint256(0x1bec2896113899d39c058533a13bf92914367d400e4ff2727f9a800a21ae5134));
        vk.gamma_abc[114] = Pairing.G1Point(uint256(0x1cd10242598f935331f10febf7cd8d77a2b330f2bfd5c0ca2b2067069bf9be32), uint256(0x2f95cb18d74f063cceb7eb7f23da6c611c7fbc2f658f61d745775956b4dd8b6c));
        vk.gamma_abc[115] = Pairing.G1Point(uint256(0x14039bfd46f6c2382cfcba34733113b27ee595fde9d8320bed0a23d83486f8d6), uint256(0x1932f4e5094bcec4d3519c8e69269cd4772ec940d569b1c39c6e106d54b87b84));
        vk.gamma_abc[116] = Pairing.G1Point(uint256(0x0111e79c8dd2ab02a59fe6a3e78dbaeeec462680facaf2ca5149b46c72c4de44), uint256(0x070f4f106291dcbbe11967d293b573e1f3dd81a7188731856712b38cf80fc0aa));
        vk.gamma_abc[117] = Pairing.G1Point(uint256(0x249990a67fb665c8ffe7d9656313c18feb70375cd6200a0ae0004b15543e2535), uint256(0x1098890101ca9c890388943877d34aabd0f272c2c96687153bd9c0de318c2272));
        vk.gamma_abc[118] = Pairing.G1Point(uint256(0x2c99110ff2d9b7cff136242d56b9c734fe82ec2a62e6b0580ad64fd43c6c7121), uint256(0x1dd9e1f3e61888713fcf76374c317b787364b5e3615df0d0bfe11390f7d52e32));
        vk.gamma_abc[119] = Pairing.G1Point(uint256(0x3038caa8e09e0d1f9104120b800a0bd4f5ef8760314000f1e36b8d60cbad1e63), uint256(0x10cdf5947f36042dce9ed6914a57e08c65aafd8d9bee9e1645249ebea09ba0dc));
        vk.gamma_abc[120] = Pairing.G1Point(uint256(0x2c115f50d76cafd9a69128797c854a8c0f50e55d4e6646163525370a0da818d0), uint256(0x2f877a621cc0af7733708101e60617f849f9b556d337cbf5e8f1c71e2835ce3d));
        vk.gamma_abc[121] = Pairing.G1Point(uint256(0x282840dd9e32694d1d418bf007ef12377e69ac01a8de16d646328575839234d4), uint256(0x07f69680d4f2ef779762fb07aaed80b43b6ca5ceaabe7aa518e1a129ba7c4cd2));
        vk.gamma_abc[122] = Pairing.G1Point(uint256(0x0c84d1d333d30ae2d8478df2d2f1c4b806c1cf9ae5e964e2facd0dbc412903da), uint256(0x2332a58c4dc2f714ea17e4c3eca4f64302714b7f4d7cc7397ecfa38b64d5dad6));
        vk.gamma_abc[123] = Pairing.G1Point(uint256(0x1c0ef8a91c0b3413184c00138bf211d4ede51456d4ff383445fbaa6d2196a0a2), uint256(0x2dc61bf9ea421f0ab5f83946d022986acf8c0818eb4ada6252c699f2811d8e11));
        vk.gamma_abc[124] = Pairing.G1Point(uint256(0x0efa79bde67484e9b9a72a5f331921a222d1d5ebae3cac68fb1eb5494200190b), uint256(0x0f3c2586929e0e3445c9b2755302956c47fb435bdd3300978dfacc7250a3191e));
        vk.gamma_abc[125] = Pairing.G1Point(uint256(0x20b0ef2f9cf2ff700ff02f22f6751a23cff63087f2327980b08c14c2fb6f8fd1), uint256(0x1cd54c5a1642d5819db02b251a034790d879cdee7d68cab46ee06fc92c9ed8ba));
        vk.gamma_abc[126] = Pairing.G1Point(uint256(0x098ef889e7266abdf883239545791480a278128b6f5a2a24178f7f1f1b61d6b7), uint256(0x2ecb62a261721b838a7fbc3eac0979f7ea52c4391d1e4ea1a382cda6625b150f));
        vk.gamma_abc[127] = Pairing.G1Point(uint256(0x0ba9de7170b7328268d467a56c63226f3ca6adb6f7ece8adb741cba1c4bc9d93), uint256(0x020a4fb5090651ab9c4ee2dfa360cd37a40c96e564df179224dca6b74f2807ba));
        vk.gamma_abc[128] = Pairing.G1Point(uint256(0x0b55bf4a50e827c903385f2f0265735c3bb72e0ee8c945938f384f9a12792cc0), uint256(0x0c70bd3a3a7d9604c91528ed29c46eb663619d0e4c42865b92513e741dfd5944));
        vk.gamma_abc[129] = Pairing.G1Point(uint256(0x2c3bbcc8e9436adc3e369dafcb68604e0b98a5f9716867e82e2f88f44fd2375b), uint256(0x1a4f5fa19a42ee4953f6afbc43f260852d6bbc2407ce5d62c5e299460bf63b9c));
        vk.gamma_abc[130] = Pairing.G1Point(uint256(0x235c7454c4dde8877ec93bf47b3fcb82d6ba77896e47a196ea635cb4833acd64), uint256(0x0a9449bf863807934f924da51f6bca76f412273e94dc4e30fd9f706923ef4c6e));
        vk.gamma_abc[131] = Pairing.G1Point(uint256(0x107ca77b0d97e78cb63050a197fafc1dd12a001d26bc49af865ad041863870e8), uint256(0x19edfb71079d2fb2e45734f476dbbbac3778d0afc58180e0063045798ed0c1da));
        vk.gamma_abc[132] = Pairing.G1Point(uint256(0x0c75264c0881a3ea3b3e00f4e7cd5563f122f9124bccb2f91d124201d5fb07d5), uint256(0x2f15cc0dce2676630015b840de44e1d4a65be969d377cfd35c2b69d632c3eb08));
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
            Proof memory proof, uint[132] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](132);
        
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

