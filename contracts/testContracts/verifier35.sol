// This file is MIT Licensed.
//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
pragma solidity ^0.8.0;
import "../Pairing.sol";

contract Verifier35 {
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
        vk.alpha = Pairing.G1Point(uint256(0x0ef42e450d4c88edb88f6b9335bf4a35a663cdd0f3b7f8f3981868d31bc1edc4), uint256(0x12cbfc5f4b32385037a20d25ac8c6ba6f184d0fb532481b70a3774b3a958cd61));
        vk.beta = Pairing.G2Point([uint256(0x04bfc3b7fe40f8c6d928cf6669beced6bf1ba8148180c2b2eb5e073664838e7c), uint256(0x225faab6a5e840819cbe22f5bb02bca6cf33b91af2fa364814afbc32380149ba)], [uint256(0x19ac328d2a05371aff6c3e7f37e4b59ae041e9835e928f39de461eef53ed8ab9), uint256(0x12ed43ee41f52baaeffa080027bce7a28e7853a47405920ebcc7528a10fb3aa9)]);
        vk.gamma = Pairing.G2Point([uint256(0x1dae3d3f02528ae71635fbc88731e52962058777495b3db3ff1458b951571377), uint256(0x09e33dad56444e906c1b41004b58757cf41d6c8e94f03c137a0b9a00c37bd5b0)], [uint256(0x0f2ad75d1170d38bb2c9b1550505d5d1c1578b1e8fa23c174032df7dfc2ed517), uint256(0x13a7fafa26d7b66cce6a273180e3d24f2c41717e212dd7620e9637770bca55f3)]);
        vk.delta = Pairing.G2Point([uint256(0x27c40bf091b8f0dffc584b24a3ced5acc9d82b1ba8e34d3241b15d21fdaa1c48), uint256(0x267a3378c0df39ba94fa79c976d4cec858c0c5cd7c0fbb61092d18cc8086a5ad)], [uint256(0x28e07d03cc34aa2ea884f9297a3d28f742a657557d76abd5f22723159122dfc1), uint256(0x0e166c5b2a4b1ae1d68dab028bd4a3c22a7d70f710795ed376fb367a89d0ca45)]);
        vk.gamma_abc = new Pairing.G1Point[](73);
        vk.gamma_abc[0] = Pairing.G1Point(uint256(0x0e97b5facd27ed98c32459ed73837f659dc3f0c0f661d881d6a0fea237203c9a), uint256(0x2e56f974ed696dd0ef6662b5aacbd28e0400eadbca3d87998fde4072c0392afa));
        vk.gamma_abc[1] = Pairing.G1Point(uint256(0x100c656eeb8e4054208013754cc6628e8a94f55bb8b36f22cbb34a283590648f), uint256(0x08a589064e563d8a57af8d606ade1f3bcddc40c477a90d275094b65a905083d1));
        vk.gamma_abc[2] = Pairing.G1Point(uint256(0x09915ebbb14961e87af60d0609b6edfcef320fc228afc64a110ab4d9d7095a5e), uint256(0x19d42f1ab89a3fc8956a75f8eaa66c5081dc0f2aab9530dc26dfef92866191b2));
        vk.gamma_abc[3] = Pairing.G1Point(uint256(0x11966e97b90d39f35f0beacc8ec2bb1be80821d1047e6f75603b8ce9db444381), uint256(0x15cba9fff131baa1d3e0c7e86dc79a38248a021dbc7c5eeef822bd960b2ba52c));
        vk.gamma_abc[4] = Pairing.G1Point(uint256(0x07efc760fe7643309de17514cea6c5de6949bcd9804358d98674f222dbc4272f), uint256(0x1ad456f860193dec8066f17cd79f778736cc33671eea912428c465b5a3c9ccfe));
        vk.gamma_abc[5] = Pairing.G1Point(uint256(0x09eb5eeb386f4ad62bf2a6e7440be43aee35bdf2d26bcdcb64048e52bb6875ea), uint256(0x221025d3886d60c7ff5f8cb04754ce1c25c5750958a273581a4b72d498cc5d4d));
        vk.gamma_abc[6] = Pairing.G1Point(uint256(0x033f1253f6647553b466eb54c1747ebe4369c8784d7e413ec0cd28efa6b6d438), uint256(0x143ed5e1b344785cb1bfd4673c58129c67a3eea3a6cb931bb62c880fce89974f));
        vk.gamma_abc[7] = Pairing.G1Point(uint256(0x1f9afb62fa37e36c754729df0f43d02a5a40837db89a4259b263adf934efb35c), uint256(0x2dfddb4263e9f582cbe4427b51f6f9d64767caea8207f08470160e29436c2cea));
        vk.gamma_abc[8] = Pairing.G1Point(uint256(0x28b60595cfcec9a8e4a00a21091f487df5379fb4921c25ca62c270fc41a221f5), uint256(0x147c1fc2cf19c3a51414c884fdfc3000b3f316583252c5a0d23d4191e56c39d2));
        vk.gamma_abc[9] = Pairing.G1Point(uint256(0x2782f4523067b2ff3442864741907b2dfc6ef0f66f3182d93acc392a6f344199), uint256(0x2ca98ef5eb1ffed361f66f394a2f3aa8808020b77a60ac5e74bfac06c6cc7887));
        vk.gamma_abc[10] = Pairing.G1Point(uint256(0x139eadb6111f104090eac88c53ace63ec085cea21b980ce481a9310197634d11), uint256(0x09b9ceb09881c6fca4cc301d81428f2d4527fdebd614f402b20fd4213e8aecc8));
        vk.gamma_abc[11] = Pairing.G1Point(uint256(0x254b3d24ed2c02ed8e2cbef94191fd226310b692aa6e71012f3f806fa4e8139a), uint256(0x0db13df6669aac2c3fe7c2a449fc34dd12ab6fb500de9986d620394fd1b79077));
        vk.gamma_abc[12] = Pairing.G1Point(uint256(0x2638592e8013e0a44e6af7779e05bb749f14fcef0ab46a2e2bbff5c3159f6081), uint256(0x0f7957bdc8629dfed7bf6db9eb77eb45dc9220827b49f8adca8d2ceb8c1eb348));
        vk.gamma_abc[13] = Pairing.G1Point(uint256(0x20f459ebe230b008e8acb8ea9ec48a4e7b558ebb34de095d8d8f9c9839b13b59), uint256(0x2883b817b567a56972952367d047be2e0d4fdcae58940e4a06cc2c6484274f6e));
        vk.gamma_abc[14] = Pairing.G1Point(uint256(0x27d08d57202ce4273fe52ab4db8c8208d3362704dd66401e4da0a82f2282f0bc), uint256(0x2132b21c018fcf132f4be4b437a08039d82775d1ad1d9b7a9fa457e26c08012a));
        vk.gamma_abc[15] = Pairing.G1Point(uint256(0x130129c9f91a4c75c602f2ff01ff4042d8ed5991885d714d2d11624bb60adfb4), uint256(0x15ef640c239e199a74e534d6705d2717e14a9f14f6cb628abbad11a5320525ea));
        vk.gamma_abc[16] = Pairing.G1Point(uint256(0x295e20dcc2e117218b90b93a757203bbacc7ffc189bdb69c236844e1832bd8f6), uint256(0x28a5398404a7c3d8359cf20161e3d3265feaf3436e784cd1f394ed9cef6432b4));
        vk.gamma_abc[17] = Pairing.G1Point(uint256(0x0f2d96120253153d1f91a2fe5fdf1b9ea4bb2a96bac01d375c64e2389e41ca79), uint256(0x1bcf751e7aa956821d1228d95e61cff97a6740082714ec7ae03202f3a9d419e9));
        vk.gamma_abc[18] = Pairing.G1Point(uint256(0x2a2ff535ac29ae85127275f556b4a35087a449fbd4c9c90d29c024f0d74fe50b), uint256(0x0279216aa326588d3d92b9905068aa5e55140f8558c08e5dee7429a1e80ea6c5));
        vk.gamma_abc[19] = Pairing.G1Point(uint256(0x01fea1a4fdd4062960affaf2111bd5fdc6a1b7c8783e21639ce6672be27d8671), uint256(0x296a731f865a3f0c2730b96a8930ea005819b922a77bf1e1d67194a6a7fad7c2));
        vk.gamma_abc[20] = Pairing.G1Point(uint256(0x18099176bf705ef3c5ff5444b60a9196b67121fc5c1afda1802dcfb4a748df5b), uint256(0x160cc7d44e94daafd67ef51c0f0b7fad196bdedb81016245688b4272dcfe626c));
        vk.gamma_abc[21] = Pairing.G1Point(uint256(0x2655909a1df624808ead9b8144a0712f24a40765e0e4b372554cf58ffab129d1), uint256(0x2654bb487ff5cc5f676e3dc1ca20c9751b142407edd724fef2659b28d16e7138));
        vk.gamma_abc[22] = Pairing.G1Point(uint256(0x2c65a54c14ff57c0cc5a8266d707ecaf23828db1dbf828793cab4d853bb904e9), uint256(0x2025582af5402adf6f832ce5fea59ae8b5053c0a9f5a73414d0005c2aa7e818a));
        vk.gamma_abc[23] = Pairing.G1Point(uint256(0x1ee2ae18fb3f07c593c61da752c69bc1d5fcc7b6a1eb10ac1701be6936788891), uint256(0x0b1382077e837f974ba4debc15c5f459d23369c985389d7f799a85ec8f91d176));
        vk.gamma_abc[24] = Pairing.G1Point(uint256(0x1d06d4ed67ae523beedae5931ac15469f5afe9fb4d1ab00e18d3a3a2eb7d89c2), uint256(0x232a78331090e38096ca258539ab0611d5597f04b92b0cff38838cd0278b9fb8));
        vk.gamma_abc[25] = Pairing.G1Point(uint256(0x28c1346ff208eb2bf4b56f06fbca6640820fa0bd6a59e700e72f9f8ab6c12122), uint256(0x1ed9b22a14a9b7e9aee7bf6cb48cef654ee64f3d5cc74927910a923c97b2f76b));
        vk.gamma_abc[26] = Pairing.G1Point(uint256(0x08b72aa050c3606de5994bfe51d3c87cc854a17b70c6bbf63443ac7f62845a8a), uint256(0x13b29c39552f55585be35215de53d7097206255d121949bee0d8203798dbb47e));
        vk.gamma_abc[27] = Pairing.G1Point(uint256(0x1fcdbdeef48fe6cd3bc9ae5e048cfe1a165a6958f5d1e20dc1c9d82512dcc1e5), uint256(0x2c9319f4d6a6bfbe72eb2f6c17e1a40f3104e04caff25aae6209a5ae81915eef));
        vk.gamma_abc[28] = Pairing.G1Point(uint256(0x098b0db2bc1e17900e5323d52b441ed7502665d503cd7f271c59d6f1ac79b2ea), uint256(0x26864bfda638172773fc827e66bf3010ec0020aa295c04c8b5a1964d57ef798c));
        vk.gamma_abc[29] = Pairing.G1Point(uint256(0x222ef89ae8e3911a9380238d3c692b7899fa5c1014e554f11fecefd572654e75), uint256(0x2ef014d31a4b1f15cf3eb8c4306fa83a1dd17c9bec1a1a4882de7d80a1d094f5));
        vk.gamma_abc[30] = Pairing.G1Point(uint256(0x08cd8fc94848ca1f5b67f188d8a936a1b5a50495739878b9495443c131eaa967), uint256(0x2796650e5ea0b5241ccd0eed4aa5c0df4f00c78988b71a9c2633c1265ce3dd4c));
        vk.gamma_abc[31] = Pairing.G1Point(uint256(0x2d69b875a1c43bd6bb6835048d959399767a8744ec5797a9b21738da9e1d5894), uint256(0x030b69677bfb60c07cc1bc25761712090aaad75a2a5cd8b3d01832d30cf4b91d));
        vk.gamma_abc[32] = Pairing.G1Point(uint256(0x04182f7b37d62d7238f8d1b07e260c0951e66d803c9293c22fb92fa2c1c1cb09), uint256(0x2bc3bcff6bdd6748d0baba8f1d1e719e9471727a909171e9375340801d13c1e0));
        vk.gamma_abc[33] = Pairing.G1Point(uint256(0x2955937488e7372564844e12bbc4f52136315ef24686a972d5c16ab077d34058), uint256(0x2c68d9c7002efb8a05ce5876a84bb4eb9614628eda1a6d6432bdceafd4e9b58a));
        vk.gamma_abc[34] = Pairing.G1Point(uint256(0x2a9e26493b7e02bbb2c888e28020a12dec10ab6ac4aeb0a5e0c50b5241d4c8f0), uint256(0x1949be0b0b6922d578da7d41a87a9a9de0f0bc697da24d49ac551d0d21b09e8c));
        vk.gamma_abc[35] = Pairing.G1Point(uint256(0x20870f9edcfe114197555fec264f03e435cbd3708103e47468712b431bf6ea4e), uint256(0x0257886d215e16a21ce1ba306f191a78184bbbcb63a93f8d91b888c6992bc4bb));
        vk.gamma_abc[36] = Pairing.G1Point(uint256(0x143c435e8e80e4e63e08b3c1b2ccbb1b505ddd97bb05286f800b0b9f38548c8f), uint256(0x231b02da0af7c4220fe33b2039a2cd5c285a79561e52e2171c8cd0db6526fb9b));
        vk.gamma_abc[37] = Pairing.G1Point(uint256(0x26443858461584c7bd066674446caf738a79e2af79425655241f4b66c18e6072), uint256(0x0e4a683e54a75bf96a66cc1abbf83fa52f0bf58773f7a58656edd3045fa850f3));
        vk.gamma_abc[38] = Pairing.G1Point(uint256(0x01dbcc71d61019f7d0073d17990481af51f5a19c34ff05331b13dac23d159980), uint256(0x009d9b0665bb3d384b347b707f21f59841041d8d9a8f3d8ee072f8f549318e39));
        vk.gamma_abc[39] = Pairing.G1Point(uint256(0x02168c4f0fa6b70e9ad4f329946d64d62019b7db4b19fa3e05422453d2051c59), uint256(0x1df54623724550d3960e807c1abdb8542615e305605553ce0275e1c9685633f4));
        vk.gamma_abc[40] = Pairing.G1Point(uint256(0x0f664cda006d03a7a9a0cbcc0e5217239307393b02b90863bacee05df3db6828), uint256(0x24eed992a5c7f15e00970dd44a7a402edc75f983182b73ad989275d0bd9377fe));
        vk.gamma_abc[41] = Pairing.G1Point(uint256(0x209c1c0167eb445c02e685f22f10173959d8bf900adb57b9933b5e766ee1be61), uint256(0x0989794575c1e18c5e78a16d29ef79e4c1d066d8c3cc781815d38561d5bf1b77));
        vk.gamma_abc[42] = Pairing.G1Point(uint256(0x2b1d7b49186d74dda1d38cc078ca99cb6aac57a405124e697cd5bfb55190b4a2), uint256(0x1d81cb090cfb2d08b3a68a6aadc3b02287c88e555b122f569c9302d739f15f79));
        vk.gamma_abc[43] = Pairing.G1Point(uint256(0x21e575390acb7b81eaa930a7800c421c6f61dc4b6b83668f703a1b3863cf3f93), uint256(0x003da44c134c6c7cd602aea64f43338c78346f5a611e2d164022b1f17f35e6ae));
        vk.gamma_abc[44] = Pairing.G1Point(uint256(0x034e6aa0843f90f5fc90b5f574c9121dba39510d564d20021281da8cf9fbf7ed), uint256(0x2a355f5a0bebf88bb815ff0c5b23b2af4f1407100726a094099ee70177cb8818));
        vk.gamma_abc[45] = Pairing.G1Point(uint256(0x2969d6e88f68ac59f7d6662679050227e020a13b34c03c7bb7363c0596994752), uint256(0x01d0ad5328b83967cbf51a8282e0312ec4078f4dbb7ac20f91fcbe4a2818ae71));
        vk.gamma_abc[46] = Pairing.G1Point(uint256(0x2ae670e770e6a6edad437ce44a76897731be97e6d4a527f9a086dccea61ad401), uint256(0x01039ebe954ea4518d24afe5debd1f673757b67ac4666c4422641cf89c614382));
        vk.gamma_abc[47] = Pairing.G1Point(uint256(0x0b69a6b451a9396196457f8f4871f02f787e4a2e28147d69d04691cafe3a0535), uint256(0x210a51463e051bda4b5c6e5f1fc304b1f6331513ec9fc19350f18bf2f4149f71));
        vk.gamma_abc[48] = Pairing.G1Point(uint256(0x2165e164311e9c29b1143c3c7b5b5a2cdff0f000509a161cd4d0eeb6c73be837), uint256(0x2c3f404215bbb04d4fb54eb3b67c4b95e81e7249250d32bd8096ae7f6d2063af));
        vk.gamma_abc[49] = Pairing.G1Point(uint256(0x195b37aebf0a99285a4fd1f925f2d3cbc99547f5ef9d1e0298f52b4a859b929d), uint256(0x2fe9c9cfed32d6c377a65a71e6129585fcd1e1194f7ac8121afa7a506be64431));
        vk.gamma_abc[50] = Pairing.G1Point(uint256(0x00e556bd044222e013214e1227793015358b234ba4c00c72ff6e02e4be43bfa8), uint256(0x2d8f02611b0c9b65cdf77a374052b5e3bc0067fb55d2333bebef059bf872cc5e));
        vk.gamma_abc[51] = Pairing.G1Point(uint256(0x042ed75397b379241cede6ca287928b7e8c3019412b1bd143db4c3bf5c250f88), uint256(0x2572b76df77086fcebcf0b84b55b1f262bb93a249f20be08f29a1ac4960fa3c5));
        vk.gamma_abc[52] = Pairing.G1Point(uint256(0x03952bcb94b4efaa852d2e953d7718883fa2e31bdff76980f28f44b0c8f3566d), uint256(0x17d6ef1e1cce189c283488a8122d849486fe45c4a452cc99d74e10cd718ed26a));
        vk.gamma_abc[53] = Pairing.G1Point(uint256(0x1ff471a19d7bfe4e5c0c65a0a19756a13a7fac43ae508a231b6176bd059448fd), uint256(0x0f634836ab77fc439993cecf031b43b8eab7e4089936a5f95535592ecec8e91f));
        vk.gamma_abc[54] = Pairing.G1Point(uint256(0x0a07a80e9b9374585ecb32f893c880b4fa3c862dad201514844cb2a2c5df4b6a), uint256(0x27c7d377146e77d9d323d9f0c2cc1e72252c5e5740e375cc8ebcb78ba8ad0128));
        vk.gamma_abc[55] = Pairing.G1Point(uint256(0x2a18df3e17ed2eeeecd497b4403b1b58e171d95d6fc3191437878f2d1f2a1c8f), uint256(0x27ae75b1e9e80412514591863bbc68d5639401df6229ef00db877c4ff2c2bb7e));
        vk.gamma_abc[56] = Pairing.G1Point(uint256(0x104a0c5e7eb8e8504190c921f80d54b3ee7535e1037636cc386f4bd63e0f7b9b), uint256(0x0def8bdc456340924cf0168522f090ea2e2319baeb6f025a698a0cd619e01bbd));
        vk.gamma_abc[57] = Pairing.G1Point(uint256(0x01c2984cc7152579f22f18afb87e1817fde39e0f4e669c09b07a868c419b35a8), uint256(0x0d7cdcc3bc3244861fcca605130e4f9d4042eb10c9ac60ce6f1c1a70b66ca870));
        vk.gamma_abc[58] = Pairing.G1Point(uint256(0x187573c847070a633c10bf7697f46161e533e769a29cc8cbb9d7ccf5f4059b07), uint256(0x0f3d777ff916c0de166fe35f9c597301a537321e95f571a9df74374da39c9bc0));
        vk.gamma_abc[59] = Pairing.G1Point(uint256(0x22e220b7ab606abfeedabf6ed51e988d28b14bd9f559b7f54eb175b00821ec59), uint256(0x06fc629ec087ac8f125b9a64b2dc8d3e597fe142b90e1ba31924aa64d442f2ae));
        vk.gamma_abc[60] = Pairing.G1Point(uint256(0x01e6d0df936c592fa1314acd61d96c9e693c895c11f3406499bd8e11207b6eeb), uint256(0x1efbc375a1346fa372dfab6366c67750ea26d65c9680c6cafa50ef406b812cc8));
        vk.gamma_abc[61] = Pairing.G1Point(uint256(0x0f91320021ba4088579ea9cb48f10e333653bc0eeeb830d7da9a10a5158cd657), uint256(0x1e6d6155b39f5223e7ea9fd57231aa846319d9fb7606087166023c7e7ce5c85c));
        vk.gamma_abc[62] = Pairing.G1Point(uint256(0x2110104025e86135ebf4886f90becd911090b577c576ed47ddb0cf5318b8f042), uint256(0x173d19c1bc5dbf160365c0eb048d988e37ad5648031122ba64e5ed13006ae42e));
        vk.gamma_abc[63] = Pairing.G1Point(uint256(0x143a26e2d4a0a2267d165a83cb420de256797496e7eb1070f0f203abba2ccf8e), uint256(0x089db8d884b7dc6a76e3aa83e5c9e5f50219260e95d1c0724d0940c0e865d7b6));
        vk.gamma_abc[64] = Pairing.G1Point(uint256(0x0fd419afbe86b235cfef9984125086073ffe3e14b1f633d42c22c3a793ae012e), uint256(0x0414c2da99c98d8324cae24700549d1f19f8879fe4838cf7260de2890d0e1a9a));
        vk.gamma_abc[65] = Pairing.G1Point(uint256(0x186e45e28e7c208930a7b38d1dd0d90ce99e5fd5ec32104a6f9dafacdd385996), uint256(0x1c8a40ea4d02020893ea58a63464a45fb6816215fbbee27333cb79a7785e1482));
        vk.gamma_abc[66] = Pairing.G1Point(uint256(0x19e5c99c90082bb24efd7f5687d60ba29071cf902131ea002262bed5533fa55b), uint256(0x256d2a845390b74c8002299a24c641924a071f39e29d8f3794ae37a5d4df3de3));
        vk.gamma_abc[67] = Pairing.G1Point(uint256(0x00622b7a148f2fa0ca4a3b191aad7b6c2f198156f0ac4ca7fa6fb48b49782843), uint256(0x0c802030eb0d0a704ebc3a9c636c21be3e4194a9abfe29e3cdcff28049681baa));
        vk.gamma_abc[68] = Pairing.G1Point(uint256(0x04234b3460e329542486941ef82a41c671b9a9d32091336a74bab80d6801ff0e), uint256(0x0b2205c8c62acbd1af352eea23c1e838f8bcfadde8c62c388f737ce478ef88ee));
        vk.gamma_abc[69] = Pairing.G1Point(uint256(0x256d09a471aa02fc2ca144826f9447507e90938bd28be38c364ad281cf8be143), uint256(0x0d41e00d12ffdb7768787f0731d2f163f6fc2cd425411171f0d7fed7e895676f));
        vk.gamma_abc[70] = Pairing.G1Point(uint256(0x102fad6ac964a104a3a02dad6486e50b2216dac65b15d515b9dc90ae8ed2b0ad), uint256(0x1d6613686c2a18044a01ff5bad6da65742def52901f2f235401fe1ca3179b7bc));
        vk.gamma_abc[71] = Pairing.G1Point(uint256(0x2f13207feb53dfc265f43c5831fb6c73013ec343de97da6a0b00c22f9671cf56), uint256(0x20d2018ea7ad0f690e1b0171e1948ecee3829a24edc7320837df6a1bb79f7f74));
        vk.gamma_abc[72] = Pairing.G1Point(uint256(0x09bd61eae19be9bc0f4f0eea53879304849cdce93e892995e670724c4361d3ea), uint256(0x13fb2929427cbdd7df61cc0aac9e8f2d468807d78adb6663624e775c2accaa67));
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
            Proof memory proof, uint[72] memory input
        ) public view returns (bool r) {
        uint[] memory inputValues = new uint[](72);
        
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

