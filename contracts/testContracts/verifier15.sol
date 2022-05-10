// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier15 {
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
        vk.alpha = Pairing.G1Point(uint256(0x2b6fd80e20070eabf347c7495d78ab27021032df82fd33cfc1491e183f6c7364), uint256(0x05724bce76e87fbb6ce8dd27c0075cf035c065f801265091420a3232f35af0e9));
        vk.beta = Pairing.G2Point([uint256(0x0d6f8571fcdd1f3a07beecbd04d71af3b725566b1577bc04c0aa648a5075c2a3), uint256(0x2e27d406c2d60526fc6cbe54abc584eaf65cbe59e9183e5674dd85b0217dad58)], [uint256(0x001f518b2ba6933cf17d050ef21d516ec05c7f0241b68db1480c85f75b5edee1), uint256(0x1fc0f00c50ef6bec3f7411bc0e659e70a61f783176608657fede8133fbbf054b)]);
        vk.gamma = Pairing.G2Point([uint256(0x04e764429f6b86d48886077db5172304dab8db2b34af3629dc7e2718fc4570ab), uint256(0x14f5296c47f0af086cae82d4c66d1148bc389cdf089d5ac6a89901d5f9455549)], [uint256(0x225f97bbab3bf7a3a29209470e9dae25e95e119b7ea0692cb0af5de04c870d0e), uint256(0x05e28d1cb4ee3d89a486f748830156c5738a5be104443ce5acbdd75b2898e13e)]);
        vk.delta = Pairing.G2Point([uint256(0x191f49749bacf503f4ef5e660daa35848e1562b24bf46ca0753e3f6ea4239b41), uint256(0x2fd5d9c29d440d7e25586a2ddd6221e35d327f04d5fc6a2b4d5a38a49009cc87)], [uint256(0x3042800b387b60f2c417b6ee258535dc6d65b13a92ef70a33f45b8a57c034d6c), uint256(0x01f265e2936b4119dac089557967df0061fd65dafeb642393bba27e3cf4351f4)]);
        vk.gamma_abc = new Pairing.G1Point[](33);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x24f5e7d84be5b6e6e42727f0b02eb5cb3c0449788a9d7911a712ecbc4f15fbbd), uint256(0x2a7a0d3421bb8804b2a66d5583a3aa9188ec505ba8d86df6321cf180ec65db96));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x28e7ca91f1c0679a5ac3816390a3d3d05490cf4a44c40e642f77aa40189d9086), uint256(0x1e264c6ee93a2d0963dc72b7519bc3d2946e3b5a00b304dc77af8678f5388db4));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x162486ff2071f314731a46099d937feabcc7a5bfa1c3c5937c46941cf6fa790b), uint256(0x184dbc84abce7c80638fc69235684d93b2ab60efadc47b8f193f126caf3a6234));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x222a558e2cb30c037211dc3a78146b60c41a3c23c562b37fa019413443a42f17), uint256(0x02d98da1fb5b9310f912ddfa6e2d3e23117ac67c08cf184dbb64849e9fb8be8a));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x22f7f3e8e5488ac15785039ac4160c20fc234168d7c8eb31f388482a763ab5c5), uint256(0x02402c548b6d128e92e8bc10e65c512998cb30283da3a44270e32e14200fe443));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x1cb41b9c7b96a3ed9c72e56b07132ae0a7d185b0f25a8b8e07440355e86fd5d0), uint256(0x1f9d3f471673ba3d61647d768824ece73e398569db8dc256d73536f8f2e4a34b));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x26f6169739d2e7e60b3e81d8ac04f2f5ab34a23d89d234afe269e752e5dda546), uint256(0x2218e84920a2772d3729f392b696de8024731995f7afa5845ba3feb771f0c1c5));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x0f60b44c18c26031ad8f1cfa1f19a74839a292846c6793df2a782a2190f82cf9), uint256(0x23228d50c49c35831f092b56b04d90d6a6f09c9e20ff89f5d34f6f049c981de2));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x0bf79b8e47771a32e23e80e3ac9a50438cf16b963e85dfa933edad109fb59aef), uint256(0x1b6841d38f9e2429f1809fea1ccf90a53b5e5f6c72d3eecc05aeed8544ad1260));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x0d685abebe0e3d3e28a7e87de1d61899d9706854077c8379680bc89a308112b4), uint256(0x0cdbcce2ee613424e9cf21be87d28327803cf66112d8e95e67481f75293f8073));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x20e37322ad604ba4772cd78a8c0abee26d667cca053dd8c358da8f3ae8845668), uint256(0x2104340f87a9ccac19f3cefb496cf8a381644398f2033b8eefbea955ced4b47f));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x3026387c8088a04027c6c6f58337a5d49608a76d0dc9f3813dce6e7a4b8f02c8), uint256(0x2a84d84cddffc6bfd777bb2aa29c0bf7b96adb09679e162e3f943e343d9dae03));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x25e670e3d166d4bdd7a7b45df94ffa1a5e43dad5aa8e4b65f8752730592a46fe), uint256(0x301dda18dc3dc6bca960afeb5faaf3f8cd4bbb536c14604eb73343225e544871));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x0792e9b969db2ec8216ce463194913ae1c05acce50f9b980c417ca743218e404), uint256(0x20575ea46b8ea2c02d9928bc9e25795feb3a5a251efd32a2776d37b86f6ba9e9));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x28731efc85ada0ceb1e4b0225421bbd57e858d6a0986bdd85f8d2ffd72a07e2c), uint256(0x06b2ea84623a76b659b1d8057ef8d050fe7aa76c67709ef1efe6b5080a090bef));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x0d21bfa2be0a0a913101d2361978427be42b25b7d71f2ebd70c408c726ebd4cf), uint256(0x2fd589afdbea5cf752eb956ad7cb82b7a98850b29777a833baabe495ee7c7dc6));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x12872a56b1fb2e7b6711a808b79bcd86354e24162d43ee10ec15c16942b65145), uint256(0x208e092453856b6d43efcad7e57d79bd9a60533fac3cc36cd297efb91f0dfe40));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0b024c75819c7d3d5eb6c973ab3b783511d971953e1a6b5b3b7f1ea2bdebb943), uint256(0x0eeac269369c576b1b637003207d2c42e165238895b5e2dbe0b53a36baca9300));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x1a32d25ffa2281294875bf361599c83556c8fe63dbafbd401ad1e3238e830ba1), uint256(0x0ecd43638b20948ea03e4791c728c34e67b5da4becc11ee38a83d08563a2a462));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x2903bf0ed77a91b9d694118f2aeac2178389eab0611529632b491e7a4f7e3635), uint256(0x2bfc517d68d3d51bddbc3a097fd78454270df20102bd9369e88ba290f4fdb07c));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x13e11fbba77a032b928dda3417af7d10c316e82f356e300f0480231f063c821d), uint256(0x1f7de5965b936ebf60ebb0206fb0ddfe7ca61bbf41edf2172447eba3c1ada611));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x0855e729d4d7640e62ce2f35a5c334030483f36cc773f490c37df894a83937bf), uint256(0x0b0c6d7c080fb2e5eb620e9c85b27a8065d07ad46d2038741ef6fdc48cbbfd6c));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x058bfd64c571fcacd1b8c07c876dcdb7370eaf1717c8298f0d4a3aeb7bbc4360), uint256(0x1ade7f9d85773afbcc2003fb91f812e70254dff9cfb78c6d75a457d767200787));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x1fa44867ddac2362162db91e5fdde5cfaac63ce294584938684eceda96e88bcd), uint256(0x23bfc76522e69c0c53fe57b0dec703c0cff3b2d868823334a01ef27703df797c));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x1db0405307461909dd916f0d2a9959f391856a685b18475d28dbb44d2f9fc339), uint256(0x1757254cacf4ce0f02e6870ac1e2b0d082d403df2f201ac8f7c037369fb0236b));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x194ee545b6751717846b4761bb17740b726888a7f94d9eee60eadbc66cf352c6), uint256(0x183df95661fb98d833fbcedde6bf3353c061f24ce2df40cbfbe0b89996785326));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x10d851bab371a7ba487afa971b7923d916f51b4821565b54e35d2d53d69c0c7a), uint256(0x1f091c5411b395fa99ac65a99a75bd32482c654b3f7c66979cd3378423539197));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x0e40e60c1e0432e039b5d7a96db4d0ce05a7f55984322bd5cc9aee9d5ca38bb4), uint256(0x161b979f2c1784724d47f7879f5632787d607201bd25fd6ac7cf793b7b062c0e));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x256f02861e4942fd65cc7b37a16fc87e871a510b760bfdf7b8aa5b69dd7cc6ee), uint256(0x2ea78931a67a6f58dc1e9869bcd90ade705921387714e523e4e7d0b43291a448));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x244ef12a5dd3b7d8942e20888dd2ddb4132549d5b27919c28183ba3e9d9bf2d2), uint256(0x050106657a7b167ceaa7e57feb8c45e320f909824e56f1dd075c56f4ac85247f));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x140e8e694e44218e430197bd6edad185894c9f6670a2119f582a1ec55fdd4a8a), uint256(0x1d29254d4348c095b6081b426825d836fc1a4cf61ab847bffc9b55d0d132d483));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x07cef842a43c6b3211737e30dc6951e9b52444f4d88ef4fafeda82f2fae92852), uint256(0x077accd42ef7e5365bf226d1aa4db6f5fb9993c0bc36532d1bc2cc7cd4781624));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x2b4a6b55f8b67227a2bc191dce3632ca82d40187e508030a15f9caab77f5be5d), uint256(0x11e68fc5dbfb2393a6df0ffef0a52391d676dc9667582f6cb2ab1d926877e7d3));
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
            Proof memory proof, uint[32] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](32);
        
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

