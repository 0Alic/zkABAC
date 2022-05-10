// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier60 {
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
        vk.alpha = Pairing.G1Point(uint256(0x080c53721c4dfb1f63bb5ba5278f8472b7354a63d279ccb01d845b5c3feab9fb), uint256(0x0021d84c6e44972d57448e57e5c32a2e0da1e22add24584c1c4c1a51ebe395e2));
        vk.beta = Pairing.G2Point([uint256(0x2335e799c432a1308f5b0cf4a1756600af125664fc7e77032b850d52da62d096), uint256(0x18a9b0dbdaee96d086353667302196008cc7867bed8463c8a5066ec3f0b245aa)], [uint256(0x05cfa754ec856dc6ac5733cc9d94b37f656d01f45a29019d734ccbf8097e3649), uint256(0x015b39751001d17e58cd554372ad68ec11512ca9d7aedcde6898313e53a29f3a)]);
        vk.gamma = Pairing.G2Point([uint256(0x16a7d4eed6e5ab29b9cccb8c91d44e825d5b2b1a956ad3c779c3af23983b903d), uint256(0x2cfa9697e8919e09578dc41f4a4403eadf2b9b8726d7c102a5e162f7990c9604)], [uint256(0x0220f893c06c267cce517b61a725637bb71787eb147c9bf809118fe90fd39790), uint256(0x0537c8577b75a7990aac814be2fa14c50afe6f9e803699e3309afeb253028210)]);
        vk.delta = Pairing.G2Point([uint256(0x222f7d1659157b7eeb26a4bb917268b72260c26d657f01a8ccd7cfa502fba4ab), uint256(0x2f7c77765e109c7c1f5ab19c8ed3d77c805b853ef6b299aedefa54a464a39c2f)], [uint256(0x1c25485d048bedea67e1ccade1626446dec08cc9c2fdd3291658007e95c192e7), uint256(0x19439885a56119986af6371fbf3b4df90dae75c6d2e48cd731fb80d5e4d5dd71)]);
        vk.gamma_abc = new Pairing.G1Point[](123);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x135307678c79b0f0e7c2151c7095af99a81fb622bc8e7c8e70363253a2d4496f), uint256(0x09f270f95bc168cd4401e7583584d0178cdc94fb6f3225f285cda3ed9c9e96e9));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x21d791fb848d9670c404ebffb326fdc593e4992f08991888f91cb4bd1e2b04fa), uint256(0x0959dcb5ed72750ccdea80f49b59aa5f7a16e951213a2852363ccca73e8d3dce));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x1020de22fa3566f75647045cc4f19d45d6fcd642f102d38c5e50f05463d61082), uint256(0x255e9286c37160419af92d10805fa82a88c941054cc3bf12edcb35872aae3424));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x2f753e8962476ca5d2d09fa8f020e2ec5fbbd8220a0a5e2666e5760811502c69), uint256(0x26dda6c270ba4f39f62f98432e0354c6a5a2b9c27be61e0596317bf007a8fe49));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x28b709ae81aa73b92484c1ed5cd5ffc6479cc3ed6f7b8578e96358d52be44e06), uint256(0x2f7bd65b325fd52ba22153ebc603f8e9784d241843b8db9f548849a43d94a657));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x2a89788f9ec68a0ddf39f256098d96ebfcc9876a7f1f61c5f42f069b1f6b9490), uint256(0x2c2da561043211de50d7b4fc3c13a788f51ba808071f2d2ca246a1a7c2652b17));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x1fe315731b1057fdd034e9a175e0a732aa1364093f6c5957211b0f8e950be446), uint256(0x3062e2180575845e6738c596217f9073a17fab577fcd7943d81f9d3377914514));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x2885dab76469e7f98ba4b3cd290787d64eec86985f579e19ead9b7d6685d5571), uint256(0x19f5bd479d238c562517976dc9bde170b1b74a5d67c1fdd4e4b88319056842ed));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x141bf2607547131d7558d580a81bb20204ee3c2ca89cdc3ac0188038692be51a), uint256(0x2278a9f69446c2244a857079b96d9998986afc1bfdc8eed511766d6b2df55e22));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x25b2d27a51c65c1b39205bb497e6d8c04b2dbd1cd726585c154041d74fffcade), uint256(0x1f585ec968bc25a8b6503388923dded908b36a83b8247ca3c94769f8ab825c1f));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x2e3c808d9074a53bc1111d59ed8ecb154c0ad29f031eba8d475dc2cabbf216d3), uint256(0x1983b203363dada28c50798d1c10ea231f74dc9b66784f30e3941538db2becdf));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x060b1a28fb88426e5d5fc23023553af2c2dd34013ec642c4cc6a2cddf2a60e3c), uint256(0x0e720a0ac728e6cb4978b91e5a7c658f2f4b2d9bb2904965c6e0e02953fc5890));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x14c1f35b91a93223332d3c0842ac64a3176ce781a6f8f705f9af499d540b192d), uint256(0x074f6ae425202ea75ac11a6ba653075fd2b7d415be6392341c1f5cd412ac68ee));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x0e25de15440b706bc33f7abe1c94c52aecd3a092b2cc368d198369a51bf8d38d), uint256(0x192adf84409bd7693e41982ca49e0fdda0ce897c0c50657b6abcfaf0fcca2886));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x04dbeab53139a4ceb82801e0a4c4777baab04d398dd78e3c74e178781b00c0ef), uint256(0x29a26ecabd2a57d3613452c1a352f4518584cebd4ec664abd39f408bc1749e14));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x1c26f5019f547f55068707fdbbfb3e4f58028b1df30eaf8b7d8a3005aba896c5), uint256(0x2c9dfcaefe9e9016734c5ce97f54f06681fe45fda4b2c9c40f148e6195ad6d7e));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x2d4e8fcc00a9d1b39eae1c5b3a67995dd0bfe26a7ab027c754489acaba72c77e), uint256(0x20572dc596501e3a6f8e5ab552362847e2def2deb4691f0928e2f1983910fb83));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x1e9f01381f769c0d256f3239ae21671e24bf6639d7851130bf797becd485a370), uint256(0x275b37028cfe87eb498db6e87775e0a9786f1775d03fefb3bb5242cd007f0aa4));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x064a93a30be29709fbfd6450a1a12563835a34491d9780c52248989e4bca25cf), uint256(0x2bdd81c972842a6d968d2dec63efda44b856ccedaa881dce930cfd4ba3c00f28));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x276bb60b984a40d4b737ab581878d938e5cb19dfb6ca3a2a8cb73d917528253b), uint256(0x0f8bbdbbc00bc631463df51768601b8a92e6041a1596577dd451462e3280b532));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x262a6feb9c070e8b8a529d57c11e6b90b1a4b1149c68ea54bb55d195901e0dec), uint256(0x00b3d3edf95c8a84c2480365ce737c796e39c0d6fe0f39aeb8268735ba5d4585));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2f90e0afa3a32d508183645f3162c4ad974e38f844597b462bbf950399b1d318), uint256(0x08ba28c58361bf41882697f76010cb5f82c85d0fdfcdf47f4e9d841127b2bb79));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x251c451b550cb24fbcd90e557db7a58b00260ffd99421a546649e7b4b7960c9e), uint256(0x2103f380aa50584e61b6decbc940860d8e314df0caf94d42c1562e1107403237));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x075cd42e7cd7999fa8ed60bff971728d92385a24d44a1649e71383276a8cd526), uint256(0x177064c36fc3b256b32f951b8bafa6a02f09811dbe8b0bc4c5c87826124918c6));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x236f8910a09c2788ad7004f5ec896fddbaf9dec298f169bcd7276935fd66e843), uint256(0x0198ec50f2fbf56cfd268fce01dae10fbba24a35864ada1b70b0aa2c1c06ff03));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x11ebea73d71cad669367f4c83dff19de8ffd3885f84689e90a5ef47d58843d25), uint256(0x1f89bde3cd8f0a02a7c689181734ee8640514160bfd878effdb3efc266c04ae0));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x040f0edb7cfa50d20ee46062c88a6f703e32b9442aa903ea6d53f1cc703c18f2), uint256(0x163e483db8e060b17fdc9a8c238651a9d4ebb55f582ec07cd155555a45b00941));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x2cfe2d7bb54907f07aaa3c88ce6a7c940b836dfc61264b7dffce18e70b25ae89), uint256(0x2fa728db666340c993e501343cd9bb041a541742e15a27e7058d4bf4935ba005));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x0f3cde15b669d639556b31b6dde0f763d1451c1bd95a7db530ab825b6ca64eae), uint256(0x1bfb135d928395845d15e6ac8c606f135d2119accf4d94c9cc5ebc5db1c8a635));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x29cd834ab046f05894e0af8394875dc773da12489de6b590dce59f8279d03051), uint256(0x2cc55be9eb9929cebcceb5d042b1c3ec8503bb07557409c19dfcb799d0af856c));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x2ecbb6ad14da4ea8c60631f04546d3f288db3d341e2033ddc58ba33e92150faa), uint256(0x0a9247dee3525b3fc7b675c48ac767ce7d1d8b16b572507d01c7a8c3c5c04de9));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x2ba1f2d7a28b8dd85e05bcc8551e29116d0efcba1dded1bcb5047f391668b500), uint256(0x0e53aa4fa096e0397fca5c49931ffbeceee92405ccad8f19f9e854cae6ae5d29));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x14ab5f0764b4cf2e152f46953b9b089f8c6ce30e5ccac6ddcf5fce76f2f7f98a), uint256(0x2fba5f96b7f570ac66e5b8757ed15eaa4430f287f155778e422857ad10daf8be));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x24e669cd10fe318393616b5959d2fbdad3d5c29e9447439f7b5b30038843b1ad), uint256(0x2bf3b7b2ade59330ab2f62139569c6e06dd787ce00bcb63b2de9e20b0a1f8bc4));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x074abb3f277258aa1c50af8a3df5be1a4493c5eb780945d658d149ae69813e0a), uint256(0x256ea221e8028c6ec8107c4d5acb790f21df7d35a66b493c1d0121ec8708c3e8));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x1bc1bf2e950a42837010452b4dbf9a622ae02ae40dcfef59e1b40ea29a45a735), uint256(0x13acfc5a56fdbc64ab1b59f55460df03b9897897b8cc51bf03358a0727cb3341));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x18bb6fb955edb0102984d76831e53b34603e63ecc7014f8a363b83fa75adeb44), uint256(0x270574bdeb65493c9f03869bd2a75004233450de53b011b1cb678db5519265cb));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x006aa919f37cbaeb348334ee65e86719aab78f1e024e18d7d4ac0a9f86c3ac84), uint256(0x1e538da420b0488cf3ad7f0f2e9f967483f0795510ae466e0aae8e690b44179d));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x07f58c5b9a61b47035ae1d94fb5639496ff2d31fef599ebd11cf187e497b91a0), uint256(0x279bf9d11eca7e757249c528a1a453b4391476bd5132b0af4439482fec53adf6));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x1b6136400db478ff61f735877e79540c6d0d50eddeb62a2612b76404205e5bbf), uint256(0x249e702485c20a7473d7efdd3fdfc711962e0ba1af3715f4465f9361c3e2b020));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x078bd57ee28228db8002c14a836f14c0642b0f42ca41e0c7a56c4672c7c81898), uint256(0x03fb40131ffbd8262809b5c2a0469826158cd0213e7d90168a228567ca65d872));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x1b12cdb4372f555b6c0e8b42df7238aaf2832626c1242edc1cb22d8bc178d73f), uint256(0x21f9a5bb8347fc0823bd9f9294ff8e47b058905db1505d6fb300b74cc3011b91));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x161abda18a28880d241ec811bdc424408f3b5258223ed8d214868d6ce74c0d63), uint256(0x0318e836b42648f6b76c4a3735265cb4075c7531c4fa61e3b1cc0b2564f01bbb));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x2d79031b40548872380f251044e2b48b0061468dfd22087c909c31fbd6eb6a79), uint256(0x2c0e2a3878b766b9d11364e123d5996b4ee415cee218c780eed45d35a7fa1b42));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x0221d18b5d6910b431efd0bfed5a32c015d95d595f453f3e3b27ded460c17e3b), uint256(0x27a445a58b3b19ef94c61cf1cb92e10d7639404b3ef593e2c072fefa371f08b4));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x2305d729467dd5653383d8ed2f80c30b54fcb211388b325fbd5a942511ea7e60), uint256(0x1ab7d31cd6a96d1fc60a8d46182885c228f726a2056698a870e2159080d3c42e));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x2bec9ded5a8fa0fa7b8e242d5d3f1efe75548bab8e0cb9b90c0ac11af678729d), uint256(0x012f1cd6c2697c566e1ce0a13c3cf9cef7d610e95d60c7b759207cf50c59af1f));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x2435627eb9757454dcf7a20a861fdd37858296b77c76e44dc44a47e7519325c8), uint256(0x291a4e5a49e5854af7f723293129b067034480cf5209f154c3ad4c07179367a4));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x2446ebafc72246a07aa9b385f8c0559ff7c971c51defaac8617b385df1249a74), uint256(0x19bf250ab4e1a47b8a33a4597b1dc96661f5be1b74d2657d6581cda8ba2010e4));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x1d65508545cdbf1ea9f2e7def6f84bfaaecc249cc63b992810fe01273e09b617), uint256(0x2a8e8829fcba2ccc8884fd21c1ee0222d53788f48957048bd81c6f1fdde80654));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x050386a6dd300d698ed7b2b372eb6c437818e627842dc153bfa823bc857fe8e5), uint256(0x0809243fb7da3cc8b85022a2740541c09c67e3022b768369a8505d2221a3a8b4));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x01202d20961748583448ce9c5ed42ffc7d5b4495654797dfe572e2121718b45a), uint256(0x27eaa7c2cf6193ca4ebc4b9005ce88306f83078409b713a7c9f9b65a55579bda));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x079f05354b515c9cba246f01d84e7f6170f9442c74309022dc7f4651f8d1751f), uint256(0x0668d8b1cf058f7ef9d7c3758939b63f65ee06087a0c5bf4cdd8528b9df8e3c4));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x2600878b34296a752fa1e2e424d1e24b8b7e9c7ab9a1c1a0894e964e939e776d), uint256(0x1f1d81e36a93ae7b6866f230636bfba3e137a00da1bc488368bf5d6bf76a69ed));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x1bc7a5d3b143b5f847470bfc9bbe44385909c068c6a200c67cc913776aac39a9), uint256(0x02b0dbfac3eccf35adc9ddaa0d35f98be516ecd15c6c1ea333f06acbc70bccf3));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x1594354226adfe77cbff67501fb8d9b170c8f962eb8f20baa09c6fa973eaf203), uint256(0x05451a86a1fd789ac33d05490680661c0293fa71c5358cff104e1c8cc47b91cf));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x0e10ca4030e5982a6fe7a83cbee85dfaec457a963c37cfd793b2eeb887ad75f0), uint256(0x082f2c3bd80a79de45919de33cfa87fca68f0c7482a5a713773fbc1d2fc19968));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x0e8b54a58fed1cf4cdbc0619f0da1a15571a4c58bdb84b19a1d4ec3c6e34c538), uint256(0x1e423d31a5d4a7d542d0c78b9e79db60fd8a24af1e7cb7d88146d9240880e89e));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x164bba1bb16f0fd2a0da665ad70ea556a5115c634e491f4494c2a93e2e42b5be), uint256(0x03e585821f85616148eb45d15f8d08816214d0ca58f61c253b5a6d4478b87d0f));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x1c33d17047f79ba73e336951d820641e4b200378055cf4421d4ffa38b11188b5), uint256(0x07c17e4d8c2b141c72834596e363cea286b037867b0aa93a6f12df23b4476add));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x00ba33934881a46639bbbe7db11300ea12d4d4fdccb494a6f6564fc318ba7143), uint256(0x0721f931f883f94363a3708aea94eebba94843abe1242c33d5b9c195116dc10f));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x0de16660a1c06f12106e466a4000b396ea3afb5776bcc718b4c31efa80a619aa), uint256(0x28d786ba837893ee038b2e9ab2fb2ab7f04ca23f35b2e0e3429e4589e7e137ce));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x21a1ca494ee34113b4124ec00f6bd13d7209b00be64a8469692e2a031aedbcc3), uint256(0x2310e68a9779d09a35ff5886dde2f244ccebd52d2cf74f724399898fa8afcf08));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x06b1769832a1ff7c3bff65e8bf3bf042176f496979374e68708da3df3065a5de), uint256(0x1a620c7f5554aeeca5c88824eb419061fc90464571b37e63329bca43d8585365));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x192eb3819a46e5bcb4c33a97db599a5baeed8a397c6c184e8ece4b219c1ae659), uint256(0x11255a9034fe99e44573f741c70ca457806c1f28b0051e44efe5a395bc3356e5));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x12c07e75c2980acd7951e88933b68351ecfdef652b593d1068f8f38e977c9e12), uint256(0x2e6e7b7f9a4dd8f9777c90356978fb7199c8f82ee999e471fcb519def6c6fccb));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x06f4ba17768be91f806af7cad5f6f02d53881e66dddf98254b1a0b0d2b3ba1d4), uint256(0x02ce8405fe7138aa6aa3b4a5ddb7fe87dba8a37ee5c8f3073504104bb9c0bd4e));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x2f3bb7be02e03206fd91de2012f5d71bbbd532230c85872ce9b73d724645d13e), uint256(0x285b77ad1105bcaa3e2f46b87c630a8e279d223c760dfc1166e3498ba30564a9));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x1e2bf7f5f304710dda8f3760be716a9e974b49daece87b960c19da3ed1268762), uint256(0x082edc540e5ff76ea76e7d09979066636a6d24e5863ad6a9b36b6ab703a7b9e0));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x0db585481b319a18297fd3030a53efb9ef436b43916cf4e1b3e9b9a29bf8da54), uint256(0x245767e139c19eba0bb9c42b3e1e47b28eb7600de777817c46a9e48acb8de68e));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x0e678cadec7620d2f1cb9a463da68032e7b44b0a0902dda4426737962e8d805e), uint256(0x151341d1e380d4207b0cad1770b5055cab40bedfeba3df63337b5b5fd96cb30a));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x12a4ab1f2f77e9d11d70a9c7e9cdd0f5fc2c115412a5322c0ce9e7ca1da67e93), uint256(0x1a8326b2a4bfe9fea50542a6968734d74c038820b6f38b707dcd1573524d478a));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x1052b5f5a97f316d1e7c73a1a46f9178c2ff15b79bc5413b5b81961015a90fdb), uint256(0x02f29a6b0b9481c5201543e60da9c2905ff219bee50e4fc738f4964cfb0d8dc5));
        vk.gamma_abc[73] = Pairing.G1Point(uint256(0x29f5ddc6df6be936053f38497b85c081d856183878c56e16b56ced6e76bbe612), uint256(0x130ed93b6ace6fc7c811fc8a169841a67e4f05bbfab2398633c91c8332369f68));
        vk.gamma_abc[74] = Pairing.G1Point(uint256(0x052d75f1a5d394ee755676a32f84cc34a1080c4bf0508099ddd193b5d32adc55), uint256(0x26e9ccd9b91c55aa22e6108facd145da132bc1b05ce1c849debe8161fb829460));
        vk.gamma_abc[75] = Pairing.G1Point(uint256(0x0b37b3bc98d5b9b0b1935ab657bc1e8621fe0c770e85d40862c7332ac25fb242), uint256(0x202c4603e3f5c4cb2da7d210028bb762a3967856295ec381d06655fd8806c0f0));
        vk.gamma_abc[76] = Pairing.G1Point(uint256(0x29142a3177f438db34e5420cda43948e1be4c010239fe450d5ca859d447cd1fd), uint256(0x0358d9aa041abc42b0608bf4612c55ad3618c66df3f01241898f5699058b5359));
        vk.gamma_abc[77] = Pairing.G1Point(uint256(0x15b68cc27732539310f34eeeecbaad7520cf7161fc93ec8d737b014538a046ac), uint256(0x2838286eb96fddc3a53e9fcd61a2a7076ab2827c72d22f2625fbe4f50aaee54a));
        vk.gamma_abc[78] = Pairing.G1Point(uint256(0x0776ad86ddac0589715f6f470f9a6fab0b9e366d5765ce5ce30883dc4e7d5414), uint256(0x1ef2fa48d0d8cfdd0c37ceb1225709dc7f5d973cbf8dda41f19f7cf776fd1037));
        vk.gamma_abc[79] = Pairing.G1Point(uint256(0x291e105af61f7bdcba89e44b7be3233ded5716825986a1caaa73165f2d3c4098), uint256(0x0b396f83c75d94911b240fbbb78cfe183073fdabc447dfe702c97258df0e4ffc));
        vk.gamma_abc[80] = Pairing.G1Point(uint256(0x138ad267e6943f75aea7c3f5bc05b1e016129f8f28a3927b91c3e0ca0ad15462), uint256(0x26a6c8c6e7e91823ed3e79dc98eabcd13aa9d76572fa40b6b72c50f952df200d));
        vk.gamma_abc[81] = Pairing.G1Point(uint256(0x04874dea21936570d146b185c352bdc25665e244203d0ff45852107562b2d3c6), uint256(0x02f65d0371dadf5b3e2443473cb88a8936618580a78c82516257173c8e749dff));
        vk.gamma_abc[82] = Pairing.G1Point(uint256(0x01070dbf29f2a5acb498edf1b416a99a59257343399b0520bdfbea9d00049a85), uint256(0x08ef4860b77ed7d5eeff42f91c2ef7692351146a7af4a233c0317ada9aca17a6));
        vk.gamma_abc[83] = Pairing.G1Point(uint256(0x1a1178f78a77dbfaee2870f5cd6517591c7ab90f5e51d8b5656dafb7c8422398), uint256(0x10c0c16db060aded52e918c3d79d528c6ff2f9ba5167713dbf532216f4e20222));
        vk.gamma_abc[84] = Pairing.G1Point(uint256(0x04479793fc1b3aa1014ff2ad6aa76191e59e507775a7a864944a3fb9b7cb91e9), uint256(0x19896dabf3536164135cdd7539dafafb7a4d8a5d5e77e0b2b106b67483db03f8));
        vk.gamma_abc[85] = Pairing.G1Point(uint256(0x0b57860355bdd781f96cf23c0d75944e52e25dd9037e7d166001ae739d15fb05), uint256(0x24996853cc8bc6aefe1375b9f49f00ab53579bed709fff007b04354bb684f6b1));
        vk.gamma_abc[86] = Pairing.G1Point(uint256(0x1f9f63aefe74c65f19e159e16c1606eae862933bfca92d54d710742ec9aa9c0e), uint256(0x0db80c18b84a57551094d06aefb5ddc781b14c9da58133efcd6dfb4c2a79cbf5));
        vk.gamma_abc[87] = Pairing.G1Point(uint256(0x276d471023bd51a11762c09730c6c9b3056b9689dd88ab1c1166453389dd7c80), uint256(0x23fe3cfb612484f5ac01f879f78bf84faa3d20dcc0de3950a1387012eb7e0eca));
        vk.gamma_abc[88] = Pairing.G1Point(uint256(0x17bc511e2263ec4fe2b8b06cd8504581162ae802770638924096c4a48b2760a2), uint256(0x1c0f5a3170bb0ba24b9ebfbf0d63326b9caf3c3995e71978dae71f32bd24c775));
        vk.gamma_abc[89] = Pairing.G1Point(uint256(0x0e2cba92f6713099320e143be9dc2291578db48ef0f0b1091cf0847b95f5895f), uint256(0x00e6e40cafc8b934ce40d43fa9ecf0903d1a17ca5b2b925700f4454851cec382));
        vk.gamma_abc[90] = Pairing.G1Point(uint256(0x2ff4931ae2a6a9b823fdf3bb5072425e04b21816c0f1a2c92b997258975dc7ae), uint256(0x042b94e9c25c07c6666088a97b82620a0ffe213ff92c466daec2448afcc51290));
        vk.gamma_abc[91] = Pairing.G1Point(uint256(0x1d1d75ff08e2b1a77b10698a483ad919b4912855345e8e6e198173e68419a792), uint256(0x2dd94d98e7b39bd8930460f3a62b3b04089965338564e1da06a7b10d6fac8ecd));
        vk.gamma_abc[92] = Pairing.G1Point(uint256(0x2b3b41fe0bad24fbbaf9e373cfe85ffeb7c023d5d5d8c59401631bf1c5405cac), uint256(0x20119c00dbab58df75849dc9a0be33dd5cc02e218f36fdaad61f9871a5b78178));
        vk.gamma_abc[93] = Pairing.G1Point(uint256(0x0bee5b92b9c5242c64e13c38040815c945180f0a37038c8a8d0a63c2a81fb331), uint256(0x14e30aefe8e6c4a6ec13566c5e11bde44af4393cb389744db8d0356912e154f3));
        vk.gamma_abc[94] = Pairing.G1Point(uint256(0x249c18e80a25346a1ff8e859feba2c530010057621e392626f25b33ecfc801a6), uint256(0x19a3cc8f99fbfb3e3f5fc5b9b66aaf91a0d47cdad68098e0cdea0248a0177672));
        vk.gamma_abc[95] = Pairing.G1Point(uint256(0x255dafc5d9a11ebb8223e9b6c6ccf1c5842292ed06514219edf3b4c3a2804b27), uint256(0x0496ee960a8f9d78bb48f216e1c249aded63e9371afab00e5a93e1cace5d30b6));
        vk.gamma_abc[96] = Pairing.G1Point(uint256(0x03119256bc30c7cd0752ac19643bcf211b11fbf1ee0a6bf7969cf87f5bd025bb), uint256(0x14cf5a6822727301353d46083824313445bc50d6431fc9ff08a4a886e31e0d12));
        vk.gamma_abc[97] = Pairing.G1Point(uint256(0x061944f0bcdb98549257b94bb2e8a617f5e506d610c1a6954f309252c446c4a1), uint256(0x2b3569e6f50324f109974c9e51aff53397dfe141989217cf46b57e7218f3d013));
        vk.gamma_abc[98] = Pairing.G1Point(uint256(0x0ae97cff541c0660de1275c8faab1a54a4b192622fd3332845b58d5506addff0), uint256(0x2a3ce523696918ac25e112ce9644d403e16f4abd7c71a2ba087380094c1098a1));
        vk.gamma_abc[99] = Pairing.G1Point(uint256(0x16f82a9b2b88b8763c8d353fe7d4d63241741ca6375edba3ddf7ec0eb124ff9b), uint256(0x041221a8abeff6fb21a16ec73e37e05eb1940ef83f744cb80c7c1b75ecad4f86));
        vk.gamma_abc[100] = Pairing.G1Point(uint256(0x25b7085abf2f56734690a277422257c7300326f749e918ce2681388430a14c46), uint256(0x031c72e126e42700fbc3064551a3b21a4dea4afdc8e8c22d7609e11c2b67d3eb));
        vk.gamma_abc[101] = Pairing.G1Point(uint256(0x19c2cb8460a17f71edf34203b23550705fbceb484b225bc75f6d77a78d216034), uint256(0x1f3a5ecf8934f0e98ec2a809ded5ead9f9f18722cb48ce075269d398a236cef3));
        vk.gamma_abc[102] = Pairing.G1Point(uint256(0x1e63a016f4213577cc5f9121a7eb01886999b1ea3d87a9f45a1613b291eca699), uint256(0x28fc0362904bceb76fe6470ba85ec289cc77c005000b64629b5ff7826a22fe35));
        vk.gamma_abc[103] = Pairing.G1Point(uint256(0x2d2e214f094c67899a3d26e09c2c7286eb0b2a55245b3a65ec5407bb109d6c1c), uint256(0x2538478261726cad858f5c1d6e187aedaa1455bd208f7fa24a9952e32cfe5fce));
        vk.gamma_abc[104] = Pairing.G1Point(uint256(0x17cd597a490b6685da197097278614dcce43f94a29ac64879ff3332e3fc9c38d), uint256(0x24cf8617673a514275cd5581fd53232591b65169c58a126e0708846fabedcf55));
        vk.gamma_abc[105] = Pairing.G1Point(uint256(0x2e2a11b20e65eead67c6e9a2b34a39e157febeaec4914b9f5e784ddd3dd657ef), uint256(0x2357fc5cd5dbf79f4b17d801fe678f3b365a0a03efb8ed7c54322b5569abac4b));
        vk.gamma_abc[106] = Pairing.G1Point(uint256(0x28994102339c01fa124163ec650065f0615bc30d86da34cc59b9cbf6cd939823), uint256(0x1e07a889a9327e45cc27a925a270dc6b2e43b91e9b724ce47a89ca37fadb4ce6));
        vk.gamma_abc[107] = Pairing.G1Point(uint256(0x159988f646fa93c3c9f4e37fb219af116c1b94383597efa772b7e8a4353b604e), uint256(0x18573f5e69113488e95feafe9b0e424368741f4e32f66d0ef7efbfc2207be120));
        vk.gamma_abc[108] = Pairing.G1Point(uint256(0x17ef7a2025a285f1f852d212aa28b21f4eaadeb2a3028ac32e6cf266766db1c9), uint256(0x27dd1c3e9fec8d6473d98dbe08017cc5732e6950b33f21aa66d04e285db0a30d));
        vk.gamma_abc[109] = Pairing.G1Point(uint256(0x1741a28126bf70b432a125d03da01764f4c510740e724b19d47aa235cf109489), uint256(0x19dc93777cafad75443f5e922c878de1f5e24abc007de7529c6e10754fbb9475));
        vk.gamma_abc[110] = Pairing.G1Point(uint256(0x15cc09f5e4708b8d3b704e2984197745229efe0c62426463c54c6a0b0a7a3ef9), uint256(0x00bf33a925b82efc181b9cfde92bd971c61f9678ee56d63c3bc4b9abdb3e44f0));
        vk.gamma_abc[111] = Pairing.G1Point(uint256(0x2c2da89b88550e79ee05f448b4bf9a53777de2345618bb5e3a19312c712a8755), uint256(0x1b09e7fa8aeb8cbedb214e5054b8679852f7c2a3507e49ab5cb3a36ff9c19f7d));
        vk.gamma_abc[112] = Pairing.G1Point(uint256(0x2efe0d4e4749e7c429082466feac0267b85d2b8dd8052301c51155c262d49674), uint256(0x006858371a0788595c6f8b53a926c8076fef3e9bfe05b93bd4b6a2b3b7f70e04));
        vk.gamma_abc[113] = Pairing.G1Point(uint256(0x0d2abe4b112467f1b555aa94b20da11d553cd8f4293a22016e423c92131572d5), uint256(0x2fbd15b8bc91beae63d0529e0e66d59df43be800c8c732f22be439a1a5638698));
        vk.gamma_abc[114] = Pairing.G1Point(uint256(0x2587a713d536c76a49a7f1b4510af3fce919f2d277e512f113d49fcb59cc83fc), uint256(0x2021d36897f7d83defcd4fec69c70edf3f6eb8c1ab4d932682810ae540dcd31c));
        vk.gamma_abc[115] = Pairing.G1Point(uint256(0x0c239e15c163f9c997501e462cc46125cd67f0acc0240c88f0a68db8f46fa752), uint256(0x2efef301f6d49985fd404a3ed48aec5514e521d7bc9aaabd5e567b147a87f108));
        vk.gamma_abc[116] = Pairing.G1Point(uint256(0x2fe609f92b3742bc0bb8b42905bcdb94c6604ffd154f4244e50f9227ccc3874a), uint256(0x19114016e19d6b00de25d77c46b6937f4f7ec50342f96d4253ae9c45b4f310ff));
        vk.gamma_abc[117] = Pairing.G1Point(uint256(0x0404de6608f220784891213ac03bd67f4f070aefb2d8d749b09869bcb07c7a67), uint256(0x1ca32eb29d3b40f385988aa8824d1e4b518b93cc81042534be8d893e5010f543));
        vk.gamma_abc[118] = Pairing.G1Point(uint256(0x02efd9d1ec006cc834454a18e6e2064158539a91c780719ca2066c9caeaf6f5f), uint256(0x2d338b80352cfa7c5773ec5e5b75459a3d12dcf31d9cf4bef73471560ba7b7d0));
        vk.gamma_abc[119] = Pairing.G1Point(uint256(0x03c982cf16780beb68339f5100a73de7b88a6d4515e513e6c14faf85a8bdc671), uint256(0x0f718cfe31c3f715299f894c73d2c485f3581a7a380209f3a98f3caa7e72076b));
        vk.gamma_abc[120] = Pairing.G1Point(uint256(0x2e41f41ea3fa3e422f20a75c5a69578eb856ea76d37bf1de060d2652f12341cc), uint256(0x05b5f7195f32492a16466224f871e789b8e7967c9f5eafdfcb2743168d108a3a));
        vk.gamma_abc[121] = Pairing.G1Point(uint256(0x2ed3c7c0c824fdfe09d3cb6d3d74be35d7d4a25f0fc80e4612463883efd7d0b7), uint256(0x12db34d2f499ed67ac20b7ee02f2595b42fdd969dcb673c6d836021fab60e7ca));
        vk.gamma_abc[122] = Pairing.G1Point(uint256(0x0e322e8c425be9fa22a60ef37bbe103b2e9b79669455a06565dc36d8115426de), uint256(0x26f0b69736b3e22d9eb496153f84aa1f92e3de5b8711ecb103fe32435792257e));
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
            Proof memory proof, uint[122] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](122);
        
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

