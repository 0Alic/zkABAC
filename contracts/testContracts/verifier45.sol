// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier45 {
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
        vk.alpha = Pairing.G1Point(uint256(0x28cc402af4cd0623671d51fcb7277802eefd67dcf4054daf17df70caf4ef1106), uint256(0x12d5d87af4de0fe219d3948c0761210ea99c3c2c9341d3dc228b55576ab1d2b6));
        vk.beta = Pairing.G2Point([uint256(0x2defca64d1b85406b5e83a4d282a40a74b562c8974b99aa20b5d386bc8e10b03), uint256(0x22a317e6daa9132afd0d5ea6d6c207a6ce0a2fcb42bb795e10dae45c3e7b67b4)], [uint256(0x2d5851f4f9003bf7544c8993ca0147d5690931bd8f7ad8995f0adf01d8692352), uint256(0x2c35c46aa0f4d084a1a791d2dc1ead651f7f3dea056a981e97f578209cf3cecb)]);
        vk.gamma = Pairing.G2Point([uint256(0x2a81444b453cc81cee0d0bcdc9a43b4ab2208d2a8f667525a0ba50d3ad18d448), uint256(0x241a79facb6d3e4ce87e84db5cc6dd1c7f7add3e437c22e0c84697bc0f3ead85)], [uint256(0x1076b37f257e97a1c5f6fa60129031c656b48ca9ab97386071f30ab5ccbb4baa), uint256(0x010a64b88cf1dbe05efe180ebae7f7fb73ed04ee48e3456e67bc0e52e451199b)]);
        vk.delta = Pairing.G2Point([uint256(0x277f7ac7d417fdaa2a03c51462f91f059715d899f0dea7bf06713beeb1570ce0), uint256(0x0984b650ec14d447ba42df71f7d6c8e46b0903aba90d2ece824375c7ac9196d1)], [uint256(0x1d0d0edb74c68656228d772c77fa93a53870a6618b32aa2f6aab94fdb3408bbf), uint256(0x120a1e3cfee277e05f680b69a68b1ba893bd35e9f74903a69f1c14fa01e09ebf)]);
        vk.gamma_abc = new Pairing.G1Point[](93);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x1963ffcb05a3094c7c0a4019535d455110c71498a8ccfb44ca6e45dc276351d2), uint256(0x2a28d0d1deee972034e27fbc597fd86e5173a740ac3713af52e6c59e64dfc58d));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x1c56939acae1b3857985439506180ac7f0673778f4c1583c6f8a891499eca2e4), uint256(0x02dcad01b3632de6e4d012ca4f3386da8f37600c76468ce269ea15eb8670413d));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x2bbc42d96c66a0597a470fa2e5d5ad17bdb1698682d470977596298b68e0adb5), uint256(0x0898b94df24061b3ddf81dd5b62447a91b064f4c61f9bbeb094ff64d873842ee));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x07934c4a2f9a002165485cfd31a7898bdbbd1cc48b9515edf6dc011265f35594), uint256(0x0815706b50b180fb60b3fe8dce4cfa3e3d044efcc31ee98a65bddc786d9748aa));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x24eba56eafe7428223521fbb98fce3c1406e82d990ac7ef4c50bd0a0a723a3fc), uint256(0x031eca8b90cedfc1f629bb52638a0d665331ec1792f5d501fe50378b9efa230e));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x23b189d1670e61f7d7f73c80b006fd8841b3d5b34b368bdc9012952470a336ca), uint256(0x2b03732194246040a1e99fd5d01c2e348ef2f922f30ad138d38b600236fa3406));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x0a67f32a8b4a3a73ec9ba7b6e63b09541b559cf7e1eacd9511e1b98319fa83d8), uint256(0x2deee8b41997e8e2bb7b627e09fb5554ec630bf3f134cb3bf9fc1641ebc25868));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x0bc9d5a9f3e6fcc75a998a2d20f5a56de2ab4340508ec2fa851806a196e00591), uint256(0x07a611b7b1b387821890d8cfc693b39a91f9a4d8fc3d9873224d93ba37127667));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x1e893d29c1284da73ce20308d1e452c1a5d393334f39b4d95a65024b6975eeac), uint256(0x2fe27e30383a70db7b74113cd3f992f84fc84932fc92d5346c26da23d4a7a4bd));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x1da9cd42a4db21444d0147ead36a8b8a740921876023a58624f288b41c114a99), uint256(0x125614202be48909b67447d4a2d89281cee92d60795cee5195fce13c0cabfb3b));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x061be8d61b9bcf219fefedc089c809c39af23c12bba1c4fa6e0e1b5fb191d956), uint256(0x29cf5cf1fd1a91532036ee383efdc4dc97152bc8b3569d26981da734999dfaec));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x03c6ce724ee55fa84393e5953d56b7a45176f53943f5f2c82d1e038e48c0706d), uint256(0x2ae6f8d35ab78a77ce1fc2c4488c73f663b72fd69a4571c0684ab302657f66ef));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x1e7dcf6845017a38dd8c078184d3f27803437d8cea038703fdba445427e1fc0b), uint256(0x1649754197925fff8e992776d2f207a64d9bde2cf6f3bfdcfdf3903486528065));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x2acf4603b424032916bbe84e7e1abbf70406564bf23d71217f758fe53c87d29e), uint256(0x240cd0e2fe46d6bb5ece53b42b95e94e3e7df9738811e1e0bc36608ef96ce0d9));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x049c52ade755ac2517a3ff29c504d5f2dfa4e39e9765927f43e9382eae7a58ca), uint256(0x16e79c472fe0d1bf73dbc4aa66e910fcc7fa1e0823debc706cae30c5f63d4721));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x1234917fff2bcc1708d45131f2e9eab92ba3c0367908c70f45b3c1b460b1fee1), uint256(0x2ddfbf791a7e6cfcae08c2d4c80ffe9c10607087bf14ba4c8e9a89d85aa20001));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x02042abe62de693a6e7b4378fd8adca94b1c080a13836efb70d3127e9809b727), uint256(0x2a5dd6197d9b5a32cf49c1f25e4955d5586e9cac2f7ebf58e999cb3ed95d014e));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0aa20c902dfc68fe402755a36f16bd19b1de2ec5755a9dd44fb85fdda385d58a), uint256(0x15edcc9872d9f0b4b5f48ba566589f012270395d6e94b79e038b8c21ff0f2142));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x2b01c644dc656b08a78cb1fd3178f9e932cc617729b48c3c4f512a29dea97487), uint256(0x22362d1410e7c1ce87a3ee296abb545d9b8cc660f12b8bdb733a456949c637b7));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x252172307e693692794da7807bfeb2816fb332531fa3a2c67070f06e0072e8b3), uint256(0x3027c4e0bd92ef89b992261e9f1a2705179f98eac8d9922481add4d96cc091ee));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x01f9d28a2414fbd20350ecbee40b0426bf8577a661cffd655e1fd340a98197bd), uint256(0x2844505ddba54b306e462efbb7d6d908235abca42022ae03da55cd8bf73a299b));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2a26debdff7a8eea5906de14fe4579b454f6635cb1d2c29740c63781d7ccab5b), uint256(0x07a411d7d40a96eb8a8a808a41d87a1ee0929a1eee43c87ce7cfc678d75ac237));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x0cbfdfa830c61975612a1c781b70629ac81f6bfbf83ea779a22b38c021784e61), uint256(0x2ed4c4f42d5db6d67a7dd6a1aef7eb696dc6801881d975e0d2958227b8b26506));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x06a119fea6bc46aa31bec89405cd0c134e528cab10396533c4a952ddb0ccb02a), uint256(0x2af0660f9f199041bbef4e6f15df3a2a883e0665c0db141962fae4480e52cae9));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x2e7b492211b0f48cbc8b5cd386e4d9bee18b784529c6b68cf0d4269f3ff1c59d), uint256(0x16c51d4091be729ec3174f42c5c4fc0221384e79da0c5a903a8bcea18d3b5931));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x21aa867772f6c14aa4db3108fa42755307a9368af04c4a9b75bd082a4e836f01), uint256(0x1d70667b6ee5dce6d7eb54b4ba0de497832a64772fdd0a0750315c652ccced81));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x09abe1520e5985daa92e941782d2833ca51099f61b5b4fde3c335fa2b43f859e), uint256(0x033f898a8b04242b59454fac2682e668d862672bd79c69b2f733ea4415db5bf1));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x1e9202a48a060ef53edc199d3773dd13f28cf33163ff2d57968a979a6bfbbe49), uint256(0x2b6fbbae8264310a637b0c75289390149944391f43293b8480ac719787d15166));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x0d036ef133224090bb155dab311b14aad323bc2f0797068a953ceb68b5cbc755), uint256(0x2b160584da21e6383aa1f7d3e9c628e105710414c200fdade73d560efb908c1c));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x0f7a5c8f0c718884f61481042570cbb824292fa6a8ffc2e8b627e3978763ff90), uint256(0x28a91c2d75c4016abc748cafa867831b26557f656fb14ca841c8ed3d4ff051c2));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x2ecfd8615ca1131eb6bd7bf5304bef05df2e6a5c44eb670c64e8557d8afb34c2), uint256(0x164d6e7ce8a91154f2d228ef3a40ab1d9f1679ab1f2857c4bdd0af2c399aaf21));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x0ed1c8bcbfaded18b4a5dc7cf0b53a61d8223d794f1073800fc942515e15e206), uint256(0x28fd6479e2be7039da2b7ba29f68660fba8193f56fb6f64cf0c1bcda9dbfa565));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x25939bd7f5755fad83103699f4db970a02ae660aa0bcce1517fbb8135e5c11ec), uint256(0x298b0e3130b8c5751e5aa2f212b5c7412202bd6b5469bc64902354a35a17838a));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x26dabc73af6e3eafd1e7fa6c214fb91549d687892556eb88c7ee994d2406faad), uint256(0x0c803e66e04ae83368edbe0eaf6b4f2507ea1fd241f372f7c4f00c8a5ec5337d));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x244c199c332b5e3dc6b08025c942f6e980f473f1c44f250b24cb8244576a51d6), uint256(0x1bed734af2a3419e71f9101a3935733a9bef08134d0c8058ffba3bfb14955d41));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x15c66883bf3b61ad46c098eb885f0c503c638f91583f49d5a016cd0dd3e9659e), uint256(0x0e853e65c98d4702f8ea6ad14e5e56b9048cdf79f35b3673d348ece868cc80a1));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x22f404488ff2841878de06849cdbc4646ba1c9a7c572bee24207dec79fbb1a32), uint256(0x2c8d4173df73f8b38f13e76a1c477ac5e5d084356d8f207c256f81f0ac28be75));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x1c1942aecac1e7e582233ae9b2e097158ac6d545464c7df5268fb0522c5e0cea), uint256(0x20f5492af2f6bc29a1193b5c1d904a016b55ca9cb1db5bc2bc04225b85f32e75));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x1763f705d101b23a128d540aa44bb7a05690ddbab11d83d9e29196a4b502d462), uint256(0x2ea0b4431811bd4d60d036eca1c508057242aed6f71a6c7a3a0885175bb9f867));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x0fc972355d78c29983787d9e95f42c229ca9374429554005e7e8b1ace0be7d28), uint256(0x0cc895e416abcf2ea34c09209b488cf13bb33636864752007aed67f445d3ba90));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x1c3726fca4e597ab5516dd6a9f765b698e2dfd4bd3c55741fa0649612c2c0aa2), uint256(0x2da329dc7d8cdbf582d15ae3ec37cf447694ad597a528a7968cabe2a7bd30780));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x2d1143cdc6aac5b35d05f5a84b8efb674dfdae2aa344fc5a9917b39721c30fbc), uint256(0x2b0058548f02042f16f14ef0d9893571e58b15ca452edda54bd73c382e32fdfd));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2f8276f60f05cee11b79937d11bc2888f7ad1d44834d80f4535e338b1fba0384), uint256(0x16c77381a986357c82b5c9d3ab7f988c1921eda4f4915121391f716224e4fbbb));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x11d3b0959b7bf80582fea786bdf7ff92cc76ad1d17bd3c1044e9b4882e8734d4), uint256(0x1a38a7af45acfc064180df87d34765013ac54cdd89524bafe0823cc23a19e37d));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x1e7d7faa642f66938b38085346921a37a8664da95b2480c4254c5aaba9740b8a), uint256(0x224ab32ef2217d3fb936b54c32df2e7070131c73167c5dc42b8fdf330dc867b3));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x0dcd8f0dd1d49a9278f1bb93f4da6c52fe073c33205efd5cf0d3c475d35ab20f), uint256(0x1dd429d7b4fa15884c43d41f7606719ce1081f2d84dce09a315070fc76a5c937));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x06a92ab6123236c27d3c591f743a35bd158bec4c4ab430c652c77fbc6cfa9b8a), uint256(0x2d17c7a5512e92247b59795552c3b42b46894486cfc75fa235f4b30642494d35));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x2b6e21f73602ec60ba7d2a10adb80e67772b79cbcb146a627543221fde87f245), uint256(0x00eec43393c2b172f7e1a366db055fecd9b567d4e19a3ae9e6e86940058c69cd));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x04cd11f0c64527a85142233dd2156075433c2eb5b94e009d40ed41f7c4cafdcd), uint256(0x0e80913f3570073e60d5f005cce088a57bdbffe4c1216f3aecaf5d731cb6943d));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x10052b06bfd8116d1d89b0137bb825452f02d9886c943d6aad458b4804274d1a), uint256(0x086680e59034b32eee2bf62f06b3d6e9999e8053e4fca41cab94549bccb4a81b));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x2a373eca5819ac7f83ea9fe8d4c54589f570178c1c682f551cf6b79647f7dc70), uint256(0x0a11553492ded887e87863d0900747f5c97e85e8a004ca5869ec0f56559bf96b));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x229ddc4e4bf5708e3559c2b77e2cc89255dd9f86159af4bfc73978541976bf88), uint256(0x05e39c045c88f825e4c933236f18b152ab1580f7aa407d49f4bb95f8533b5f27));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x0e2397568a1672d4c7975e2a43b7ead236c3df3051b6de57ddb3af958c2cae29), uint256(0x036ac8c330ffa0da58d2aac35439bdaeeefc22d93e241505a5d945f4ec41ef55));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x11186b1d161cbb54f22d063a0a046b236828a126bcca5e1230bdf00cc529fdbd), uint256(0x260c750f3c92efba8ded3ccb5af2c547318eb9682bc8dd37ae5b4e752a06ecab));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x188972cc1013be883ecb59f4b923da35baedafc6653d52eb9492dec1eafea105), uint256(0x0a8bc8b0fe0d353fdc308bcd1784ca7014b389d6d78284cb5c53a9a7b4f64566));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x0c5232de3729ac495137389b064cac6b038ac7681d2e97aecab55564acf619e8), uint256(0x0aab4a26f1afc4d5998f09d37607320515a046dcb6c37e5815d80ebb41b92f9a));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x12c77cf5488434a3c88694efa1ca8cc06580d72cb59758f038b6ff7805927577), uint256(0x16dac37886fdee340193f41ddce606a446e169de12d348f0a9ed7728c25a3a5c));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x131edbcbcb367ba4a64176d225c1684279865d9c3d140c47dca8e9f2f3b8a3fe), uint256(0x1825af02affcd8e9904f779171228ebe5833e77e50655371cd3dec53f20cb703));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x133ad7b283a5494ca7e14d780549bc0dbefd4184adff7125d51f4dff7d34cdf0), uint256(0x1df2a9b4e5be425b5542b60bd20946c85b899958c1f58011d3442a43c8702953));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x2a5bde9be2bca4d70c8a9147178ff188f466565437a0a08fce63090824d37718), uint256(0x101c605faab5f8776ee9ba122bd908fb5781399a00e3b42da61dfca7218f7cc9));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x2e6b271451ba34e3a9be7b146ebb1208e1ba4c1837f08289139e9a61619da688), uint256(0x0acb3e730fca99b04035c85692ab080ee058d14638fe8e4797004074782e2258));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x0a034233040b66cf41184826e645b3feed9fb81ab733af7f657a05ea4b69694a), uint256(0x0f6f7ff42d727b3b629f87377fa3de0c8efb0ba0e308d50429a2fb3ac1fc0f96));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x1807cae16efaf61d50774b24161fe05fcca46906424eba1a4c5c1da07eea61da), uint256(0x04fb9f2760c03895e6649052b0c0c2956469ce0fbb35a296eec50750bcb3beb2));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x2cf0097fa87093a1f1256be4d32f059dff3280b7141f95f311c24337caa48823), uint256(0x151f29dc98c831272741180b3988c90d1caac94cdb9ad2ae470ea7b15b56461e));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x0a4e59c00674628f3a479fec12693b7203c7927a484e0b8359f943d57ea8d87d), uint256(0x0e3d69a7901aaab84660163ac8b8df310c7cc4c3d551d1aa188d7ad3043521ec));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x0cb34c00805d72ef249d73c23c3edf125998305d59a4d0c30fbb51e4f4ade550), uint256(0x114e8473bbca27a818dc135d2d5e3149d7e83ad615b17cd599b01c74bdf40ecf));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x303646a58976d7328b3908464ec3dd824ff80264f56bb9f9f9ac2a73c3a0837b), uint256(0x29cbc7f04469459becc8ac2c6c954f11e9f54c7fa0010b299174615b15004c9c));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x23d34fbaaad553ae8412aa07b45194f48cb94789c175adb000dadff34e7efedd), uint256(0x29cec4a2f59b60010ef371fdb2b452ea2e6ed1497298feb4dd247ea436a3b2a2));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x06a3d01234811747a0a49ca6244b644a97ae0606e88627e64cc86dbab8933c35), uint256(0x0b93f8589770802d1cc69fcbbb6123ee7e99e7d955bbbc4a714f8f6bfa81b9e7));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x0338ae94075627637ee00404c2d02dba600a9adf1c1d0ca437a5a8d699f5b317), uint256(0x2b62e8237a96bb7d3f5a3fe7170c5341ca778ca27d75e1287d17a35060570717));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x1a1192b8c889c2661e5b906d102469228bd9475efdd51dfaf396b49366517007), uint256(0x0cec801b6182e5c1cda11e7eae5fa9873e6e376c2f1d86bd497414c3b85a1e0b));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x010519e5182ae8083d18d388a40f2e0f9f40fa8b9c03897734966be5d1434f7f), uint256(0x0ae3f8a6efb9f55d070388dce27957bac0904757396a67cdbdc9542a1880ffda));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x082f066e447d2866c9a5454658cd0dbeccbae7019ca9d5f83458cf8099202949), uint256(0x0a7061e5c23711567baf1de68e84e9f6a7f870f49385ec9e39e32203926b6ea7));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x17e865bc886975d9fc3eeba4651e78f12587430215e800a79318e69f9b20fb5e), uint256(0x2563559018d3314e207bcbe19127cf62dd8532f7a29d0bdf1d943c3e67d2b3fb));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x2220ed0a40d1dab3120abab9ff818b0f4b113eb6c6528b5533d1134b22998fc5), uint256(0x0cf5cf3b8b02405856cae86623d99b70af743872ca4920a653f0600dc3bd3f86));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x29068050dabc70221e8b1263cf207c3d5db13f3c99724adf988d51b661e165ca), uint256(0x0b2bb3779d1d164c527a550e88f97f9d3b173dd90f046fb5ef3461a1e6d71b05));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x16ed6fd4ae64b594b04f8478563c47dbdf0f7beee6c887894849eac02a166a02), uint256(0x1ee60a721af24c6d5a7e947a1659a6062fc356471daa9d41ec24294373f9a5d1));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x2018936f65c34f048f3ad7e44c3bb474c26458be48c883c38070565ae4e0bda5), uint256(0x170618d45f9ca54dea0adb4da98db6ef6102dc19830c20b43d54411adc50e308));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x2891fe680d0e7c269dcf4acb163e713e8c80991d5c49a7ff167b44d59f36e2b5), uint256(0x1442f70aaddacc8798690a7cf09f884f56b383d1469bdac343e5d73f45555c0b));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x089528b4291d56a42087c6574053e7d0931c37878625ad3fd2cc53cc2dddbdcb), uint256(0x0c2796943e5a0277455d5ac580984e1017333a5120b0d0e71a9798b946d18f8c));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x2d71c1f9de8f65b1fa80fd37d52db0e9ba4abea09ed8158ea0ccfdb9d07ad43b), uint256(0x1aebcb29ce057c0a1d09a0e51a0402328e2d71fec600dcb2c666214080bc78ca));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x07f592bf8834a7169e22908d97c55efe2600715cdf70ccd53ae121ee524672dc), uint256(0x1ed43c3fa9cdadd8bc88985a8365b5306c2a0b5556c3c9c150984145c32fc05f));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x0fee21304b500ba155e8f03b1b606f3eba65db440ab5274d11300477382ad59b), uint256(0x0c38c418ecace29392806b57f31348008faf15d44868ac0b7d5ea58244360f2e));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x296f65c9f54081a0070a11b6011a6d716f6d0f6ba2e9ba354063c67eb85cf5b6), uint256(0x22f77b1c03b25fa9066ab10423e9f59b8b7f9235c575f9a9a1d86d1e21109bbb));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x00bd633aedfeda1d9df95a3740945e3470ec851bb76fde93c192b23ab6a10ff8), uint256(0x19991ea35d30960ab5f7792eccc8a322063065b087aba0e8d740eefddf2acda2));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x2e9bbfa8ac7bc01548087adb38fd0cfe6094d02fd08adb4e73728cac63ba8750), uint256(0x207f07a4960ac2f132cad2246b43eb012754c29d569ab602179cb653d9929f12));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x2402d5f7a515fac0d6f5f0b4cc51a91300b2ff5edd60aa5aa38a484e28046c81), uint256(0x18a1914a231dee6b70f555829b3417e7f1bb94b0724f40fc43e52a64eb5714eb));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x040ca604430af1622708a58890bf1928fcecd7740a02e4dc6ac851f56ab2742f), uint256(0x1af9252fdf037cafade02897ec25a35bcf2f0ac547afd51d1d4d2f1f8de15df4));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x13f31d0cd08984284f75bea157a516770b417434aac6f2fe8f8c52a55908bfbc), uint256(0x2e11b5948a7c5b1914a070a2284c8890ffa6bf971a6504475ae1a72f1ed8fabe));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x12e1b57e59c11269b850f6030edd789002b0f6403cb70422cf82310ed5a5aad3), uint256(0x01bce7c8f9ff92600a2ba59a0ae7a7bfffc0630ac501d59698ce22e04c1ae5c7));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x04e7a543ed03e70dca2ba3b612aafcce88db9be7a4134d8474d68a902639c147), uint256(0x2f4a5c3067d4b105a142a2833b0174884ba3868db96466ca3323e3db1097832b));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x2f5de969d2d4ffad35fe62f263818805581640d141045a2715be0bf06e2a1006), uint256(0x14f7a1b0a686a144c6577ed1e4e903e002ed3f36aec2347cc423e63e34acd169));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x0af4375cbff438f0741bc450001f3c0ef175d5986ad532cca1e00a2113b59635), uint256(0x146fea991b150ad0f6f0cd73aea98732d0653c27cda482649f5195b78c0eab32));
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
            Proof memory proof, uint[92] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](92);
        
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

