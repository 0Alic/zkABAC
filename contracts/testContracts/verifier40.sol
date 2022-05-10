// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier40 {
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
        vk.alpha = Pairing.G1Point(uint256(0x034a31acd6bd707a8947c154971d922b63e9f95fb19127391039964788b64bd5), uint256(0x290e816b2e76c751baf96175cae9059028ca4a7d4e5616332b8d8759aacd28e5));
        vk.beta = Pairing.G2Point([uint256(0x0aae35ed79cf832ff7fcc79f050908e3c81b45934bec7fe4e6380186f08f69bc), uint256(0x00da9f5f492efe9c13226e8dfa478bba7055d1649f40e899f2e8b9c5ef282669)], [uint256(0x2cecdb3677e38de9117db79e988c74c11a58c9bf5078a36d5fd03ece9804dc9d), uint256(0x139221bfc1839c68e1668936eacec5c7c244935b1ced58acaaae47a1f02e61cc)]);
        vk.gamma = Pairing.G2Point([uint256(0x1928ddbb85ff327b6aa93d7b775ad636d5c29ceb741d6523a82b05a390082318), uint256(0x0d719df8c37a5957924022e98cfa367c60627f0a07be3026710876b4afbfda0b)], [uint256(0x2da11e5d32e28814ec393d7e644719819ccaf21bed9a0398cb6a00f365499e55), uint256(0x20686b617985d9fe5de20090280d13bc83edeab79e10af86bfe456c5e3d82325)]);
        vk.delta = Pairing.G2Point([uint256(0x24e0285bf3e2adf3094a52bba8b298e78fca3961823a99098ba3c6485832d78a), uint256(0x0dc98d14844d5c4fc5bfb26bf98e3d31a8b5ecb8ad77f691c44601ec6508b6e9)], [uint256(0x00a9fb0668b2d229035a1cc3e784d395d2d73db225866bd6405938a99c519cc8), uint256(0x1368ac236ebcb159e60392f6b0a2fff82c5a2d5ce1055ee14e14aa1188ec708c)]);
        vk.gamma_abc = new Pairing.G1Point[](83);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x1310aac5c8162f62f146ceaf15b4f5e2d22982a69a66235fbd4c130e77e23975), uint256(0x04a34ca47e79ffb8ef3941d4ce54c50bbf65f99a8b23c77a6f79957215cc022c));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x184feb89a7c3f1c088fc7159748ff946c97f62f6d6c8a6e31fc640144fb98d63), uint256(0x13bf6a9a9aeff301d56e15e354d9f59617090f62108323c1743e4e795cb9da51));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x16211b1f87ee0825b432c77260a69dc2dcb03d5da0d60297d7de8e6fe9fa29c4), uint256(0x2f6ed6860595c5f38bb034642ef01e24f472480978cd964abbb7a3fb39615e03));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x1940b7a51a7e9c3fc10336c05fdb18508a4ba44cca26dca68c1cdfcb9a72e7bd), uint256(0x2db525ba9c6e095d8bbab7d3165abc3df187335f43b76df15233e08051e50c75));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x1b78695ccf505a1a5e78a2a53a31db12112d481e75a12e0e7f379c3a97889d22), uint256(0x00e479db19d776e87f2825d9100f625b2c01a92fb42472b2dc6964f546b6429b));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x28ea94fa58e6337cbdc1467e239df2d594b6888fc4d183cab4d83ee670ef6e69), uint256(0x27249e0fcf9b231efe0c8a719bc039cfb54e39af8c8173797d083f7c26769926));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x0f658172bf1561a1a1c151c0dd7ab78da9bf5fe500221b01fcef1ac99bf64755), uint256(0x20c8849476731d1a66139e8414fee2bf7bb94170544607e44c4e71e51ada3176));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x2bc96a51d4fd36afa2acb49cb407a3909a4d0b6af4627cd81f546ed9d5f29aed), uint256(0x28a8e8a90435e8140d39ba999ce8b5ec0ee4d70f7a58912de358ae13f4eb4026));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x28875eb73540297f30a54a8b65c121bf111085387e3e34d27bd0dc1d6f60b91b), uint256(0x1ad268fcd43b799fa17c90f8d2a1dd8d2a893fe7d2779384bc0d467e5a7a4d59));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x0b02065ba10eb3d9854a69baa501935f4fa4a463e1b1235799648f441e010e3f), uint256(0x1ffb3929b19918879d64316a4dd8b93fb9dee61272b1cc981329d6aa21e6b578));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x130bcc87689b084fd83ab9d275dd2e6dc6e69c2496d10402967c493b9a17bdeb), uint256(0x1b154c961749749a7c500ae09d1f25709dfe89e5c071715f23fe747adfead217));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x013241e1c92a73b5db72c6e3f4ad9844daf6654188ba3d08b85531d6001c886c), uint256(0x1e62a1039d1ba22c41af046348e57313df0fd1a097abf3a3e0021ff2fc646777));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x22c77756a5d667f08740d473dc7fa41a958d9d5914b0cf87f62688007d25b676), uint256(0x2ce5e8a108d108368fd943eb876d4a75a036ee8dc8d51734dc0ac254c7739795));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x28ee493241ed6c6747ac1119f8c1639a51e564aa5a27b8d8bc83decbbc1dc96f), uint256(0x1f29b3d2960dcc9d3962ad1dd59b1443d0e85c63b3e6df36508aa1bdcc0b7fca));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x26dc49159ff5a5d455a32e446e7a43ad352901eabae7152f6e8e5cbcb5dc141e), uint256(0x17b534c22deab951abb71e3b8591ccc4e3230e3a4306c0cc705c26f2740b5920));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x0cc66f0078f807d8f3a4fedc408b3ebced11c250dbda41ea65b0f3f98eb69954), uint256(0x2c699aa5d2dd45e020b6cc7958df2091cc4b0df92b5994404daeb12ba6db2954));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x06f7342062812eb65a4ef6e2c48fefaa1cf6ae630e0784c5038cb41e2ca0efeb), uint256(0x27ac35c6936f3c8dd470b7dc3394b2aba8932435790f255d3a0cd0b92e9bfb31));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x22408d7b7ba0295cdb271d465b018d4f250bc0dd3d95574233b6511c823367cd), uint256(0x1dbe330c9c03009f11b9a0c0e53fa0d632cd520d9868e24520e157e771deb557));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x190ae2dd732142174037456c31275545fa229e26a225c905b39aa5269e62a9b4), uint256(0x100ce7d4d65ec6ee79841b76ab4e5ee7ed227d18792525bd9445ee7801ee25a0));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x116a9458009063e1139cdb901105901c75d633c2c1d897de33d082c8816d5d61), uint256(0x0903c86b966515af8da31da086f6c66f69e6cdfc61fe40a73979de7c80e868ff));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x29af4ecd0a4d07d63ccf42a1c86c1b5f0487d519195df21783f7165b06a854c6), uint256(0x1c51f7e048d897e4ab1b1128b48a35f78a707d74cab8061c7d2ef839f6da02a7));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x119c6a33caecee2d2085373e1d38330f0da8df14710880bacc8222d46751bdb4), uint256(0x0785c7fdc3e87ef36aebcdf2d9a1c4dcf460efc1b7df79732c38e30abeaa04b8));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x293556884754fe605d40d31a381730075697fcee076e4da41c5efbd09f4d24e6), uint256(0x18ab9a46454d80fee81184f204656eb6d1ec7ed5f068b25ecee0fed79e93b9f1));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x280ec1be7489619657587d4cb73336af9a98ae202184ac6e4c4409f837e1810d), uint256(0x0f43fe1c502fb75beec8e06215b88c52cbbaa1f233f217fd8c1a9822bbaa682d));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x16cd6f155a4ff16093b81faab0c73d2e8a6a59330a30df52e13f14a64ff9fa60), uint256(0x10e2161b799df88797bb4a8c7bbde358c16b7ff087c3e57a36d14cd0cadd9138));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x009391cd38018ab84edbdf26fc822b9e627eed0d6c7191d798f8de8b24d71f23), uint256(0x21e8e42ee29ce5a8a8a7cc00c3629046f6af068f45d9915193920f02ba5449cd));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x2b898d4aee9d1598caf0a11254588830c5984917bf1c1bba4c396678b35fae47), uint256(0x250c403401eb1cfc8926765ae8a3432941063cb0910e9e1c0f1af8b5c097854e));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x2919ebd40bdcc29ca849191db728575e1ea933e4ca530e283deaef3e99bd5d03), uint256(0x1519c8e0ec4651c0d5ab163a5704e7fc12294df61eadf891a457e3d09db79c18));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x23af775b3ca7e040ce07f574233be169630e7400b956e8f30cec313df7c3167c), uint256(0x30226bcda788ec7955797528e686a68a22dda2fb60707f7d8ac6f6729c12ba26));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x2e0e4d6f619853c9c9a267045a3aa510e0f1994a25523315767a5f2c745887ed), uint256(0x27c36b895a58f3ec6781f7a957123c53f1771e7c77e5ce2a8e55e11bdec6cfae));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x05d366fab058229b3ee0efe1ee82b77a433697a67df975e6360df0e77390b3d7), uint256(0x24ac8584697805f71e487f6531f4f8ceb62a4788e7719a82593f30e2ea94df6b));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x04751e6be9fb8adfa1412c0ad6d32f6f8190080a916d793d520fae9a19dc8f23), uint256(0x20c28b3a68a03c3eb25778dd56a7b2c1832b7ecbb20e7e9c86bdcb031a3495fc));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x0f2bff9fcc4a782e8c85aa01c1979f83263f3ce01e216fff7f61570a364cc752), uint256(0x08e5436d53e884d947069ffda7fbcc6c82ab44b42aabe871f2086a0fa1e5607f));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x1a6d506a11c423aacda8d6a68f0f81dc52d38d1e0415639aa0e52a483b64d62c), uint256(0x197b643e348c896eef898ffad8b80b961ab1b4b7945433a826ab2317827fe79b));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x25a916fec30ee89e66572a53a413a3eb57fff09507856eef13d342448df3007f), uint256(0x1d17eeafd6906fd5bcf48642bbeea27151cb772c39f2b392fb10bb63d533b891));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x2dc6120d778d7ce68e3f8006d33d03b44afd7f2de7931308e51bf762bfa12bf0), uint256(0x1c8a656929af2229cc35afe4bfa8b934a7ec111e131d5241890bbff516ce40f3));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x07968e40fc55b3bf0da1661b8a03a42a8f61c35f23191fa78b8f9edebc80a38f), uint256(0x1228278af76e0d72ea9b79acd5298a8c61d65389493744fe84ff72c15bb17f9a));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x0fc8b5a9e0223df20d3d0dfa48d647c5459137b3270adb98ad066cbd20a35f97), uint256(0x1dcabe836c6b024d35287ae08591dccd5e1ed7abf583912fc1a5b9e4074b7f27));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x024779fafd314751fb2729aee71f1e107c7fd2772e8badbb4ee99d7f84df0586), uint256(0x250074ff13d8763d89dcd335dc29470d274be5f72ed4914edcf3b2779553b137));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x1d5f01eabcfcc0e4abac911cbeb8363012033bb7a765021fb727a8ff07493c43), uint256(0x21ab7196fb415ef113675f07e95556c203ebcd10490997b15818904b40895df7));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x2c8e3161c6ed7b49c525b89bf2f122f8dd0c2acd30e9a2f68329d824bae9145b), uint256(0x1fe21e3a892508f43095825df97765507aac87fc3b3551b4178fa22676cc02d5));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x09fee9ce4b0034d40c1d85bbbb32fa48125329589f3fcbe28260a789a817efdd), uint256(0x269a3b08a2222236507c2b06ab1d21ffc4a9ecf023e53e334da6ac1b93a61abd));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x044a0b120cc1bb87948932e56ae463339ef95f802bfd260b63cba04ca388c02f), uint256(0x219ca1d0cc1cf2f1be986b626db3d55dbc828edfc62c6be8a51294183bb852e6));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x012fdccd4c791915f74a9f5d8ad877b6ec5681ca3ba44c3d0eb61c9eb1858a7e), uint256(0x2d4bc7792340c49693c85a06a48f13347e2a7f1e787d5315977c234967ea1de2));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x12849ac768ab15376ff8bc0a503f0f5438cde4ebdc871a07fda89b1be4f48653), uint256(0x301ffd660b0c602582f7c989659b6d93098b16b025f76b36466032119ac2b836));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x15412a59645ac5ca31f7bda11431cebf3a6c552e87261e79f521a593aea72d78), uint256(0x1ad035b73d918ef49995222676086c29a3033d1392ae5e60218ec9a540f91f56));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x20a6e319e68ccb55e7c1ba355b6f1279e11a6ee3d69019118d8aa7ea4866c246), uint256(0x2b12c4f2ce4dbf39599b9d9d80b150d4c44d2f3af42072b3fd5097509d50462e));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x11d0022eff92ca55ac02fcad4525e6078c71e391a30894240b19f35c9e7e512c), uint256(0x0922952280cc9ecca286d81129fa211b75e747bb61e86e28686ca98a80280739));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x1545af90844e959ef760c87c6c9a5cc5e49e24c101eb93a082dd4290552f5258), uint256(0x18e4120eb58f49d4ad18d9b405d0e35fdf7e604d66dfb5b9fabf3d3593948c67));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x043180cf9661738374278047721661530aa898d3465d0afdcf7165bfcd7acf1f), uint256(0x2bddae25874c22e28820a3df290e63f09b461eda68bba26c0e8e54541589569c));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x159fc6e68aee7743e13c9e7bb64c982dc45dfd12abbd6613f164effdad009527), uint256(0x1328bdce72c536d5fcdaa3407b82304b230b4e562509cfe27a38c1f77bd269b2));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x166d8fbdf536aa7d4b471f0899ecb32dab5e4954f797ed1506e7b25052326ee7), uint256(0x0a1cb3dc4fac3a9e8b6e80d9508727dc08ed1f594666f6aafcaa646faa17aa1b));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x09c3b6cc29e80861e3d8c6facd854506d17772f25e766ff3e83aa6dc808822ba), uint256(0x01e57305097b08870aa6fb92decafaec2584f49e3eafe8871a3c20ec1947168d));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x0c5a4a616ac410e53190b5b03a0c3390dcab7d55471366d3afe49f24c8b48dfb), uint256(0x2a671441f1ae2da9d9b34f23b0ac3e002028db774d0c8b81f3c67a622dec339d));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x0519b24369ff4b438e62ac2c80f65150263e8fbc74f190aa451945d328c137f2), uint256(0x1d68447780e130d361475022268ade4f1250201dc84e81b479bb3b803c631798));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x20c95f7835b568d3a2a37cc8a29015823942edfef923a7a1fd403978a1b412fb), uint256(0x0f5b1404c1eab87263b08a8b57d0ff53ba6735b4cd61c9a70b54a724ae46037e));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x23ecac0e7d449d235c33cf6033bd7a3ce905e6413380811ef0cbead614d086b6), uint256(0x25906c71db25fb80ee4b6429b3d3bdca5413edfca48e802f0516bd901aa9999f));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x21d8f912cf80e9f4c418bf2f336418e046b262f220126b9826fab56d34143e97), uint256(0x1622486022fccfd0eaac022e4214a00fedfd278a54ae96b17440b1d6bcd83d6d));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x288bb78f97596aee86fe42fc0c8d22a8e4ad1224ce925d5a643699e1f747f332), uint256(0x049f4b21c8f4b360894b957760cac661f6c916744689a52b5b38766c1caaca69));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x022b4a9be8ded1eea845398d8e4ddb4b23e29b363783c3208c82f2a55cc2a313), uint256(0x112458f15e761f75ef99b9fda30485eea4abffe1a0bc4ca03186163bd416d8ce));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x2121c0b135b76e1d7d53c89ffdff6496dee031daa48eb96c7c6f67a9b9d4baba), uint256(0x0cd66ab15899ee0cb7dfca019b7d91dbacc7318bdfa4cdd164a157df431800fd));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x08f0f0a6278340ac4b54e15699a44c096c8193273f04dfaef0ba543c8dbbeeda), uint256(0x236f2efe74bd99eada293e7b5fe34755a1ec89fbe7fc2e0c274ec2672c5d5900));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x125800a966214590fa39a1e58c3dcf35dbca0210cad2d2edf2c0f9dd9b0ff374), uint256(0x108d10fca36988250c791ea34fa8c5e37e7dcdac377575ad54ee25e7832c5043));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x16c53e4bb3fbaca656d944752a4b461b712ff67f5b47ced7077b489077ed9209), uint256(0x0ccc53050f4df805c5bf43565333a203c076cb55246d112a94beeeb8a81ff586));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x2c7aef628ebd6a834c7e7b0e75affb935684ecb70dc60a2994abc73820f729aa), uint256(0x294b80aec6831d356357a208ae2f8e6ffed90d688363605ef6eb99084158b3b7));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x0f73c4ffbb8c3607cbdf5a528542b3f92fcd2344d30b8f1439d45fdcd70f6a4a), uint256(0x28d9af6c927f62268dd6e56b30924b5b2907e19e69406b530e97778367711b62));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x09a84a9cc5210b19e5d31cfeb1982f74c7456757de0c29660657981ddcbea873), uint256(0x0eef74a37b6239d7d73f488989a0685b5b19003aef8c75fb37e32e0e0897fc9c));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x2bb6f20612add395f87643e05045ccea8fea6e4c0486933b16b1b852c2ae1a4f), uint256(0x2d405ac132fb9728ca19c903da069d3da0ce4b4eedeb889ac5ed1caedde9ae9e));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x1b06631a758d9dfebf523aed5dd247e8478cd4e3763d1a7bb1698ba1369cbdd2), uint256(0x172428ce53066d4678a600afb648cd9af53054dc42a70a262babd0b5e785ff8a));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x1366a18e81769962ede90d0091513f6c1a90daec51bab35be98a3ef7aaf2f54a), uint256(0x05736cc673c310ccf4b33bc5fd638bcd9af66e960d5cc1f841f4790713557891));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x0e1dfdb111a76b6ed0ed4b910f402bd04dcb379684ced02557ccfc7feb9876db), uint256(0x22b38a68c9080a1d6585a51911d7993a88cbe6e4754e097e51a9abc4a4a21f1f));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x296491ef24f3c2a44caa18dc4e5558ee0840ec6b376a86b7857847b12837c9d6), uint256(0x16257886dda06f3d83865597e553d2364f897aae7c9d76c65b3e54cb8fc20543));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x13eedb97b809000f263ef17e1cc2c01095f8d4e701f64d56f0d3fdf8cf116e22), uint256(0x2b37ce304ba90c24bb044026dbc94804043c135d8927c3684229fb5b6378af04));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x03926026a9922bf182797f798767ee4594e4bf0c4235acad4ab94bc022706f64), uint256(0x155c29bd113713c353dbb79b61319eaaf575f2661cc55271d970d387c4609c67));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x1b852999ea99d5b37e0f116e9327a94d625bed748155b59c46cf83d7de612405), uint256(0x0f5e02a53b31ded6cd4a10687a7a8bae5512532af13fb4ff931650a19ce90476));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x28d2c9de2f858f7b9ce3710cdf5b3b3a9bc1c912e26bd478f4f46f9a0759158e), uint256(0x2fb5a55cd8b4286685f92d5d1b82225b544c48bf5a36ea7dc1078405e8726ef3));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x217e02cf51dc30e1a4bb4cfbd7041fbe7f7c995c54715f5436e9e2b86957f87d), uint256(0x083878becb3c5a8fd4818705407bc22e622e17e837caa7b0f5e78eefa2fae7c5));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x13338da56da8952fd097294411614db23911d734578e94d17fd601768da65979), uint256(0x28504ad9dd3cd675a82dfaa616c49e673da73ff4dc5dd9901342b253046a5d6e));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x1d9beaaf1369c499454b8ffc186ab7c0424e35e8a1170a1cc49896c0bbb217c0), uint256(0x221b9147295b8a5603ea86f0f2003ce04511198573c880f2719654ef7a20f47e));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x0c824b3d274b8df5dca4ac0d8f1f33b475b270a2bb884564caeb372055493146), uint256(0x12409506f85495349e7b4e3c7064b412aac0e5af9d2a3b805268cdbb7e1ae6bc));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x17cebbcdf721ff5eb716d23f090edbb8091757560a4c95f5f232ff57e6fbea54), uint256(0x112667362bd3c7b2556dbe10231f40f64e95ec54f9fe0725308b2a9420328625));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x24c166ef38d889796ddd39d83b347abfbf19ad84a7d68b2ebd05ae38f1f776d5), uint256(0x0d45e879eae83114394ec3e9f5b2ef3e3189b9772aa30544c8994d552f5e81d9));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x05d0c59be27f7c29f454b653db717c4310ec4affd828ba613e341ca0b3929ef2), uint256(0x0dadfe4b320e3c44365ce9ecf8da9206b239888398d61c651336a042a2fee294));
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
            Proof memory proof, uint[82] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](82);
        
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

