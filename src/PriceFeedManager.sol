// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A price feed address manager to fetch the price feed address of token pairs on the ORAKL NETWORK.
// Contract Address on CYPRESS NETWORK = 0x6BbE47610d1e247C2aEAb592FF465Bf9c3B22443
contract PriceFeedManager {

    struct FeedAddresses {
        address BaobabFeedAddress;
        address CypressFeedAddress;
    }

    FeedAddresses public feedAddresses;

    mapping (string => FeedAddresses) public FeedAddressLookUp;

    error PriceFeedAddressManager__PriceFeedAddressNotFound(string err);
    
    constructor() {
    if(block.chainid == 1001) {
    /** TestNet Feed Addresses */
    FeedAddressLookUp["ADA-KRW"].BaobabFeedAddress = 0x02f77db0230D681CD48DC95BCA1fb5D7cA4c10EC;
    FeedAddressLookUp["AKT-KRW"].BaobabFeedAddress = 0x2E7Ad962a41Aad55E611bD3940b55B0E44F8B7A8;
    FeedAddressLookUp["AAVE-KRW"].BaobabFeedAddress = 0xD961dB2677E46c0c7A4d46a5dc4837fD614765d9;
    FeedAddressLookUp["ADA-USDT"].BaobabFeedAddress = 0x5256c1281FB565a8CdEf04b8ddb8566f59DeBC51;
    FeedAddressLookUp["ATOM-USDT"].BaobabFeedAddress = 0x8aC03f4876CaA645D9C2ff0E45C8a2AEdB4F4c92;
    FeedAddressLookUp["APT-KRW"].BaobabFeedAddress = 0x8407AAa6693E525f54640e69BA8B9dF7626f844d;
    FeedAddressLookUp["ASTR-KRW"].BaobabFeedAddress = 0x132d357515a7F7854E1cfEfb751fdc9c2759db2f;
    FeedAddressLookUp["AUCTION-KRW"].BaobabFeedAddress = 0x2a1C56185E237aE35d8193B841645B49eE084D71;
    FeedAddressLookUp["AVAX-USDT"].BaobabFeedAddress = 0xF7Df62ad50f12177C1781a285544BAB4Af5AA05b;
    FeedAddressLookUp["ARB-KRW"].BaobabFeedAddress = 0xe0e69F21B509fc81398d332A98c93D7dC51C3eAB;
    FeedAddressLookUp["AVAX-KRW"].BaobabFeedAddress = 0xF03f27c87638b9b3f2DECA2D0f334D152Af1303B;
    FeedAddressLookUp["BCH-KRW"].BaobabFeedAddress = 0x37849D5d257c0511C69787637d6e748f6c1e4FDc;
    FeedAddressLookUp["BLUR-KRW"].BaobabFeedAddress = 0x72337627266B1B4c54d8319C4693Cc1B8dD66DDc;
    FeedAddressLookUp["AXS-KRW"].BaobabFeedAddress = 0xD13950c1dE2284c3925Cd8D2aB625648Ce7Fc1Bd;
    FeedAddressLookUp["BLAST-KRW"].BaobabFeedAddress = 0x64b8F77F85062c3B6bCEB33a2456316b3b623fCC;
    FeedAddressLookUp["BNB-KRW"].BaobabFeedAddress = 0xEee7439Cf80393a0e9e6a6bb99B5d6EC0f3e5f7f;
    FeedAddressLookUp["BORA-KRW"].BaobabFeedAddress = 0x3B69e44Aa3b85B6e34c182229371458B5fbdd79E;
    FeedAddressLookUp["BTC-KRW"].BaobabFeedAddress = 0xAAaaFF540B83353d75abC0fed2d6611f5359C8cc;
    FeedAddressLookUp["BTC-USDT"].BaobabFeedAddress = 0x43aDD670A0E1948C90386d2b972FCAEC6CE1BE90;
    FeedAddressLookUp["BSV-KRW"].BaobabFeedAddress = 0x5570587e5453588cF9ffdeB4dC9FC526504E2047;
    FeedAddressLookUp["BTG-KRW"].BaobabFeedAddress = 0x9Dc1eB7FCE592edAfDE262937CAD2f4A238Ecc70;
    FeedAddressLookUp["BTT-KRW"].BaobabFeedAddress = 0x827dcaA7a3A1eb176B7b828fe7059d6db133F3B7;
    FeedAddressLookUp["BONK-KRW"].BaobabFeedAddress = 0x68481D73dfA031737C43feeafF80ded4420fF348;
    FeedAddressLookUp["CHZ-KRW"].BaobabFeedAddress = 0x0b6FCD748157D7459a6eaef2e489a5acb6369956;
    FeedAddressLookUp["CTC-KRW"].BaobabFeedAddress = 0x7370e9615535C1a846345391E01Ce18E02021C8A;
    FeedAddressLookUp["DAI-USDT"].BaobabFeedAddress = 0x1D83aEDCf6414E0dB1faB0070427657202138445;
    FeedAddressLookUp["DOGE-USDT"].BaobabFeedAddress = 0xa9B27BB0637eaED113cc1233242ceEe44a33aE6c;
    FeedAddressLookUp["DOGE-KRW"].BaobabFeedAddress = 0xd78C81B4F784b3AF865A1f57e289a8B048c88458;
    FeedAddressLookUp["DOT-KRW"].BaobabFeedAddress = 0x8DC442311B347F8D6cEa8EEEb1348eA372E3ff08;
    FeedAddressLookUp["DOT-USDT"].BaobabFeedAddress = 0x66be0Ac3C8B4683E23B706166e2079479C77D880;
    FeedAddressLookUp["ENS-KRW"].BaobabFeedAddress = 0xadf30EA71ed91De752FD14418534Fc6F346fDe57;
    FeedAddressLookUp["EOS-KRW"].BaobabFeedAddress = 0x18E35df304E70836e30a4eD382F8445004b0334b;
    FeedAddressLookUp["ETH-USDT"].BaobabFeedAddress = 0x22BE5ff1eF09ebf06995Da9050d44d23070C2142;
    FeedAddressLookUp["ETC-KRW"].BaobabFeedAddress = 0x89e692803923F619eDDC37a58a97838362cce935;
    FeedAddressLookUp["FET-KRW"].BaobabFeedAddress = 0x74d108d0976A4fC8A9a4D0cdD0907aec152504ee;
    FeedAddressLookUp["FTM-USDT"].BaobabFeedAddress = 0x04105782d041dD356B45a06DEFFB51158a857292;
    FeedAddressLookUp["FLOW-KRW"].BaobabFeedAddress = 0xB9250B7b24197a57cd523E99560E265a7155c5AF;
    FeedAddressLookUp["GAS-KRW"].BaobabFeedAddress = 0x05Af29906efd632Ff08a8AAaC9574D69De7F3FAC;
    FeedAddressLookUp["GLM-KRW"].BaobabFeedAddress = 0x3baCDC4fA2964b045EF0AbFFF53163395a84a4f2;
    FeedAddressLookUp["ETH-KRW"].BaobabFeedAddress = 0x191fA61918267C9Cf22f7dAE8Aea7BC4c354De43;
    FeedAddressLookUp["GRT-KRW"].BaobabFeedAddress = 0x242F49338448Ee30942DB9461431C33eE8aa6eEC;
    FeedAddressLookUp["HPO-KRW"].BaobabFeedAddress = 0xA0fAA18cAB698430a33514420edE2b48be5FaF45;
    FeedAddressLookUp["HBAR-KRWs"].BaobabFeedAddress = 0xc448450f507A97785b7BE5d13F5604571cCcFcee;
    FeedAddressLookUp["IQ-KRW"].BaobabFeedAddress = 0x3aE4EBF5eC94F65C682eE9c3eA3f68664A642A2D;
    FeedAddressLookUp["JOY-USDT"].BaobabFeedAddress = 0x2bE0d3cee8c4390f8456b3E7b457d9Ed9BAa0378;
    FeedAddressLookUp["IMX-KRW"].BaobabFeedAddress = 0x171e20Cb4B0EBeCb2f76c86529C2e5cA41d5F85f;
    FeedAddressLookUp["KLAY-KRW"].BaobabFeedAddress = 0xFB4b01452EDfE90FA611D1d102b2Ac9De41F0754;
    FeedAddressLookUp["KLAY-USDT"].BaobabFeedAddress = 0x1408cb13D84bA8Cb533FdF332db5D78290B071C9;
    FeedAddressLookUp["KNC-KRW"].BaobabFeedAddress = 0x4652b62da9613A69F8770E6f648Fd0169d093c80;
    FeedAddressLookUp["KRW-USD"].BaobabFeedAddress = 0x87b68836Ad679B712e0A0dA98698592c6Be11959;
    FeedAddressLookUp["LINK-KRW"].BaobabFeedAddress = 0x4eFc1E843a5B68A17E1719fd93BB6d4E46a935DF;
    FeedAddressLookUp["KSP-KRW"].BaobabFeedAddress = 0x1793692454949619a843285dd8274a0Ea955B105;
    FeedAddressLookUp["LTC-USDT"].BaobabFeedAddress = 0x40Ffd1a4422F1FcD1683A98767c959cdc0B1b9b2;
    FeedAddressLookUp["MBL-KRW"].BaobabFeedAddress = 0x8c0e3c0329d35A038d460aae792333B8bAab3E3C;
    FeedAddressLookUp["MATIC-KRW"].BaobabFeedAddress = 0xf69b5C2c82932FBF0e2674623cfef9da533E8253;
    FeedAddressLookUp["MBX-KRW"].BaobabFeedAddress = 0x8b9a9bbcD10ba3e514cD899DAb59F20CA9BE623F;
    FeedAddressLookUp["MED-KRW"].BaobabFeedAddress = 0x996D56E61b67Db17fA6eD55f67Ec172A8597C63A;
    FeedAddressLookUp["MATIC-USDT"].BaobabFeedAddress = 0xA829309e98aDd53DF0E90cBdC6291b5a9ccf2Ab0;
    FeedAddressLookUp["MLK-KRW"].BaobabFeedAddress = 0xB4A0d0a5ba2647e5803661e14E434845eCB1F33e;
    FeedAddressLookUp["MINA-KRW"].BaobabFeedAddress = 0xeD3C2532Ac12C05b9f264D9728df0fE38723F1f8;
    FeedAddressLookUp["MNR-KRW"].BaobabFeedAddress = 0xee085F11E9549325b1122876D2E9E70AA67A7696;
    FeedAddressLookUp["NEAR-KRW"].BaobabFeedAddress = 0x19506F0D348a1003099eFA4D0f64d7A598c4C296;
    FeedAddressLookUp["MTL-KRW"].BaobabFeedAddress = 0x31eC98009dC410aF5a4Df40485DD01A14fe6aF78;
    FeedAddressLookUp["ONDO-KRW"].BaobabFeedAddress = 0x75F39d986909dd7639ab153f13701C54e51AB7A4;
    FeedAddressLookUp["ONG-KRW"].BaobabFeedAddress = 0x730Ca15C5550C0Ce520095B2C286E51fDFc4b301;
    FeedAddressLookUp["PEPE-KRW"].BaobabFeedAddress = 0x2eC01D2f7107AEda5Cb53427975A7959A54298C7;
    FeedAddressLookUp["SAND-KRW"].BaobabFeedAddress = 0xc6d081b695e69B101da039147545b028c307737D;
    FeedAddressLookUp["PYTH-KRW"].BaobabFeedAddress = 0xB084C401e6401CA5625E1E0b52ec982d12f67E56;
    FeedAddressLookUp["PAXG-USDT"].BaobabFeedAddress = 0x5B2D6D46099C876f99d2fD35fd461B0836bA26c7;
    FeedAddressLookUp["SEI-KRW"].BaobabFeedAddress = 0x0EedF41D40eED5db3Ae6A113398A7e6B6aadbdFD;
    FeedAddressLookUp["SHIB-KRW"].BaobabFeedAddress = 0xaC0FE7bF154277E59798BBF2d8eFd448aCd24795;
    FeedAddressLookUp["SNT-KRW"].BaobabFeedAddress = 0x6381728C6f87F533237E23d036aB0CCFC3F090ee;
    FeedAddressLookUp["PER-KLAY"].BaobabFeedAddress = 0x3221b09f568235c2eF487523931D993cA544c630;
    FeedAddressLookUp["SHIB-USDT"].BaobabFeedAddress = 0x8151B959C9E8E6923C101161595BC5B1BE499c11;
    FeedAddressLookUp["PEPE-USDT"].BaobabFeedAddress = 0x4ca0C8B81fe8a6d7709b98720E50abE9855a5cFB;
    FeedAddressLookUp["SOL-USDT"].BaobabFeedAddress = 0x0e6913D6C98Ee6e28858603Cf24562c4f49aFE80;
    FeedAddressLookUp["SOL-KRW"].BaobabFeedAddress = 0x32C3b76c2d0f7c1528277B6FCbB6410D55c88084;
    FeedAddressLookUp["STPT-KRW"].BaobabFeedAddress = 0xCF2A33A81578C26CCFc6A5DFc64E3B636f7b8d4F;
    FeedAddressLookUp["STG-KRW"].BaobabFeedAddress = 0x96427478A2b72E61f140C892e3fc7e20ce89Bb5a;
    FeedAddressLookUp["STX-KRW"].BaobabFeedAddress = 0x7096aa19F7633AF32DBa4E6A777c9ED763435e41;
    FeedAddressLookUp["STRK-KRW"].BaobabFeedAddress = 0x8699E811c2532aCa916C9e9f0314C3aB9581c79d;
    FeedAddressLookUp["TRX-KRW"].BaobabFeedAddress = 0x84cf945D669fbeA2ac4B7671a929904874ACB7BF;
    FeedAddressLookUp["SUI-KRW"].BaobabFeedAddress = 0x1Caabe51927e271eCa6061F14b1FDD3bCBFD0485;
    FeedAddressLookUp["TRX-USDT"].BaobabFeedAddress = 0x18bD4fA331a14FFfa8f18731CEc41557B813bAc0;
    FeedAddressLookUp["USDT-KRW"].BaobabFeedAddress = 0x019054B92fE2714de19dA63C49f5bA8Fb06432C0;
    FeedAddressLookUp["WEMIX-KRW"].BaobabFeedAddress = 0x98AC08166D81e81e228caF5C061C44206B2496EF;
    FeedAddressLookUp["USDT-USD"].BaobabFeedAddress = 0x2D9A3d17400332c44ff0E2dC1b728529a33F5591;
    FeedAddressLookUp["USDC-USDT"].BaobabFeedAddress = 0x1498CE6B25E183DDbeC29bfc5885C168c84AC57d;
    FeedAddressLookUp["WEMIX-USDT"].BaobabFeedAddress = 0x659aE627c7B7a612AF5e8Cf2C8591aeA753362Fe;
    FeedAddressLookUp["WLD-KRW"].BaobabFeedAddress = 0x40d10430861C1c85EB4Ec766430A156b5c494444;
    FeedAddressLookUp["WAVES-KRW"].BaobabFeedAddress = 0xc367A319b3A87b5006838A9C7f06e99fF2a0F1B8;
    FeedAddressLookUp["XEC-KRW"].BaobabFeedAddress = 0xFe5c5E434818BE1Fb622eCa375275D9e41261E02;
    FeedAddressLookUp["XLM-KRW"].BaobabFeedAddress = 0xc685fA474851Fb2Ffb9DAD323a22301F20d86C9a;
    FeedAddressLookUp["XRP-KRW"].BaobabFeedAddress = 0xa4d77012EC322ceAba03A3be4e0Cf0aFdFA8F55a;
    FeedAddressLookUp["XRP-USDT"].BaobabFeedAddress = 0x50B4D087535a8ab5c87584A20f37d8Fa2322a9ee;
    FeedAddressLookUp["ZK-KRW"].BaobabFeedAddress = 0xB0214355455010D193695d4677666D3f4882174E;
    FeedAddressLookUp["ZETA-KRW"].BaobabFeedAddress = 0xAb58DE2ae5fB6edEdb2DE7cDea5AdFD609bfA782;
    FeedAddressLookUp["ZRO-KRW"].BaobabFeedAddress = 0x5F42cB5988E3AC34284Bfd30a6566d7cfDefB8fB;
    FeedAddressLookUp["UNI-USDT"].BaobabFeedAddress = 0xE4b4c779738ebF52523e6f0f21f977af34085842;
    } else if (block.chainid == 8217) {
        
    /** Mainnet Feed Addresses */
    FeedAddressLookUp["ADA-KRW"].CypressFeedAddress = 0xaAb3b9Fc6c2867CF938d4Db9C6573767DAaB6AF8;
    FeedAddressLookUp["AKT-KRW"].CypressFeedAddress = 0xBA4e99bD26b60ba85d641803a0204D37970C9667;
    FeedAddressLookUp["AAVE-KRW"].CypressFeedAddress = 0xB096dEBb2d002fB6504e845a96594d10d222466E;
    FeedAddressLookUp["ADA-USDT"].CypressFeedAddress = 0x22740D5af8Ee07A8cfc717D076e6f83b08553623;
    FeedAddressLookUp["ATOM-USDT"].CypressFeedAddress = 0xa827234224826f3e1f5FD235ca99d845113E4aE3;
    FeedAddressLookUp["APT-KRW"].CypressFeedAddress = 0x2CA0E126c5D00f3E4752Bc60a5B4ef22Df8B53A6;
    FeedAddressLookUp["ASTR-KRW"].CypressFeedAddress = 0x1b82cb4Ac12FD521F84e5DAB3189a0b69f7E5f0D;
    FeedAddressLookUp["AUCTION-KRW"].CypressFeedAddress = 0x6f22df9A216e61Ef8EC996292d1ebeF8907bdeaa;
    FeedAddressLookUp["AVAX-USDT"].CypressFeedAddress = 0x48802c3ab12a7f8859e1D9bbd6fa7B0B23B7A9b7;
    FeedAddressLookUp["ARB-KRW"].CypressFeedAddress = 0xA9C87714633826Dcc3e152a044460BD0F6Be9eBe;
    FeedAddressLookUp["AVAX-KRW"].CypressFeedAddress = 0x3eB6A05B79D483ED9aDA5a8CD4D1426433B7193A;
    FeedAddressLookUp["BCH-KRW"].CypressFeedAddress = 0x24bAa563203B20AA1FdF472682428C48782c1859;
    FeedAddressLookUp["BLUR-KRW"].CypressFeedAddress = 0xE3C5EdE98461e69b79C847f14b0cCcE44A739D70;
    FeedAddressLookUp["AXS-KRW"].CypressFeedAddress = 0x54cB704A0B8205292217a2d3dF4b6577e08c3E4c;
    FeedAddressLookUp["BLAST-KRW"].CypressFeedAddress = 0x8F84017596B4D0B167d18bbB35c09832CF395D49;
    FeedAddressLookUp["BNB-KRW"].CypressFeedAddress = 0x36801b1601293b5eA6AEB377B23291DcEE368c40;
    FeedAddressLookUp["BORA-KRW"].CypressFeedAddress = 0x2FD4255c0A84623FCd78CCeB94B81c18b74c1f79;
    FeedAddressLookUp["BTC-KRW"].CypressFeedAddress = 0x340c4672ec1084700B73788bD8Dc7B020b66BF20;
    FeedAddressLookUp["BTC-USDT"].CypressFeedAddress = 0x60893bBd0fEA7D6DbD94a85A4f1897aD68d93394;
    FeedAddressLookUp["BSV-KRW"].CypressFeedAddress = 0x3d28ef28d0E64450Cdc1eE1Bd1deCAcDD627aBF2;
    FeedAddressLookUp["BTG-KRW"].CypressFeedAddress = 0xE0C964d8FaeD0719447F30018d62ac8B400C0C7B;
    FeedAddressLookUp["BTT-KRW"].CypressFeedAddress = 0x3F61EB2f9bA4d691D4864fd4543F7c6bE74A8E2d;
    FeedAddressLookUp["BONK-KRW"].CypressFeedAddress = 0x6481162Ffc2D39552d11cF1571707dBdd0953F8B;
    FeedAddressLookUp["CHZ-KRW"].CypressFeedAddress = 0x1ba563A1B3a9f82ff579f2665E20487f0a78df4C;
    FeedAddressLookUp["CTC-KRW"].CypressFeedAddress = 0x0E1351c9003409a618B85c0dA80f2b47E71C3Ca6;
    FeedAddressLookUp["DAI-USDT"].CypressFeedAddress = 0x7104DC056E45eFcFbDFf9e24d2aaE76fa4dAb6a3;
    FeedAddressLookUp["DOGE-USDT"].CypressFeedAddress = 0xD24E57982b62e13834d504817c15c92977E13Fa1;
    FeedAddressLookUp["DOGE-KRW"].CypressFeedAddress = 0xC4573f2336ce1839A33eb4A495940647970d73E0;
    FeedAddressLookUp["DOT-KRW"].CypressFeedAddress = 0x340c4F1c352F0210b71850A7e872d92A5d7c880B;
    FeedAddressLookUp["DOT-USDT"].CypressFeedAddress = 0xd4ce8CcD0DA36E2Ad29F94DdA28EEe8eB6cFAF22;
    FeedAddressLookUp["ENS-KRW"].CypressFeedAddress = 0x597Ea2f92A4fF1241bD41635d5BdE733A65A9681;
    FeedAddressLookUp["EOS-KRW"].CypressFeedAddress = 0xD9e7A9E571f72BDcd8DadB6a93f0d575e7F71236;
    FeedAddressLookUp["ETH-USDT"].CypressFeedAddress = 0xbF61f1F8D45EcB33006a335E7c76f306689dcAab;
    FeedAddressLookUp["ETC-KRW"].CypressFeedAddress = 0x43Aa9300BA841D8878D4749835C7a4086528E5d3;
    FeedAddressLookUp["FET-KRW"].CypressFeedAddress = 0x878810fCc981626ED09D32103d80018079bf47F4;
    FeedAddressLookUp["FTM-USDT"].CypressFeedAddress = 0xEa2A00dF67Cb3bA0F2b157318AE37C41F1BC4722;
    FeedAddressLookUp["FLOW-KRW"].CypressFeedAddress = 0x51C52b32341C03D47044D478d0178c3D69FF26DE;
    FeedAddressLookUp["GAS-KRW"].CypressFeedAddress = 0x349b9f2D599B353718eD4c9D50D1B2e0607493FD;
    FeedAddressLookUp["GLM-KRW"].CypressFeedAddress = 0x3f77320Ed9dd1AEf2daCF3CF12cD7432E6FF4315;
    FeedAddressLookUp["ETH-KRW"].CypressFeedAddress = 0xC663b79d9AbfdE7a9d067568B26663b4dbDFc933;
    FeedAddressLookUp["GRT-KRW"].CypressFeedAddress = 0x15cAc1CDCFdf9B4363e1199CfBEF739A8E539Fe8;
    FeedAddressLookUp["HPO-KRW"].CypressFeedAddress = 0x619a2c1db90C89465Fa8e8c801528882C4C2c354;
    FeedAddressLookUp["HBAR-KRWs"].CypressFeedAddress = 0x533Dc18a35C1b8A284E3ac12f5EbCEc449795ed9;
    FeedAddressLookUp["IQ-KRW"].CypressFeedAddress = 0x359087C43d5C0Cfe232395f7c6e03cE491b327c0;
    FeedAddressLookUp["JOY-USDT"].CypressFeedAddress = 0xAA4aDF8428E689c603F4CB0C9073f28f72Aff572;
    FeedAddressLookUp["IMX-KRW"].CypressFeedAddress = 0x4550F716F714c1146D7665242730Fd7e9E2D03ba;
    FeedAddressLookUp["KLAY-KRW"].CypressFeedAddress = 0x925a2087E1cfd4489A7410cCab912650230C156e;
    FeedAddressLookUp["KLAY-USDT"].CypressFeedAddress = 0x6a08d36e8C10D5d89529c7443cEBF37EA2cd01D4;
    FeedAddressLookUp["KNC-KRW"].CypressFeedAddress = 0xe23098c109366Da47641c4a3c34937CCe6A5079b;
    FeedAddressLookUp["KRW-USD"].CypressFeedAddress = 0xc90431Adfa8ee2BfEB97d03800a6E6f765ab117B;
    FeedAddressLookUp["LINK-KRW"].CypressFeedAddress = 0x2f141d92351e341E3e8b3EEE657F4Cc888A200B9;
    FeedAddressLookUp["KSP-KRW"].CypressFeedAddress = 0xC14904bfE59fb6e2d462b9a972Aef253eA8549cd;
    FeedAddressLookUp["LTC-USDT"].CypressFeedAddress = 0x16047900Cf569E63441F0BE392aDa15Ccd9E8B15;
    FeedAddressLookUp["MBL-KRW"].CypressFeedAddress = 0x7299582B4F17B212002106D1Ef7CABB904C61D0e;
    FeedAddressLookUp["MATIC-KRW"].CypressFeedAddress = 0x05A1e40D99dde567C9892c9fDBef6d557b8a31d5;
    FeedAddressLookUp["MBX-KRW"].CypressFeedAddress = 0x4D700EaB8D99614370108886Fe38F5f875b036c9;
    FeedAddressLookUp["MED-KRW"].CypressFeedAddress = 0xc66a689b5688f791de30272cf96bc402c6B648F8;
    FeedAddressLookUp["MATIC-USDT"].CypressFeedAddress = 0x713fc15AD95457f6AE936CE10426914EA6CA31B5;
    FeedAddressLookUp["MLK-KRW"].CypressFeedAddress = 0xaE38873D785D6B111d6bEC3Aa56aA34E9A920bD4;
    FeedAddressLookUp["MINA-KRW"].CypressFeedAddress = 0x1258Ea371231E59A4084dd1C56fe168Bee5E4Bd6;
    FeedAddressLookUp["MNR-KRW"].CypressFeedAddress = 0x669B00079F1e451d62A2f35bF0f2b377D7F5BDe5;
    FeedAddressLookUp["NEAR-KRW"].CypressFeedAddress = 0xC70Fe1af66f0bdF291559a2A05C192Ad56C5f23F;
    FeedAddressLookUp["MTL-KRW"].CypressFeedAddress = 0xB32615168b0B63C353C3251B5677F96f693CEE6D;
    FeedAddressLookUp["ONDO-KRW"].CypressFeedAddress = 0xcB58BcDff5C5f16955e02aeC0509CED4381c88cA;
    FeedAddressLookUp["ONG-KRW"].CypressFeedAddress = 0x5879060dCa7f7bC0A6Ef1db8d3E94299Af7C82B1;
    FeedAddressLookUp["PEPE-KRW"].CypressFeedAddress = 0x95D6c881d21E1E48879CF956f5CDF60E448a6550;
    FeedAddressLookUp["SAND-KRW"].CypressFeedAddress = 0xBbC07A6BfCD801Fa0219063d948Da3E4549906Ec;
    FeedAddressLookUp["PYTH-KRW"].CypressFeedAddress = 0xe194AB61bAdBdf1c1C059942f21519f387d4FFd7;
    FeedAddressLookUp["PAXG-USDT"].CypressFeedAddress = 0x357405f2d669b13C43A6887e9A34288D1bF2131E;
    FeedAddressLookUp["SEI-KRW"].CypressFeedAddress = 0x3B86Ff18b4EbF33Be822468D40504d130a9cE964;
    FeedAddressLookUp["SHIB-KRW"].CypressFeedAddress = 0xF0cECAbBC9CA87e7F56e4A327c592c4F7658D4b1;
    FeedAddressLookUp["SNT-KRW"].CypressFeedAddress = 0x4487C5F81e640204363De4EF2640Cf6b19c0DD89;
    FeedAddressLookUp["PER-KLAY"].CypressFeedAddress = 0x4028ecf422b5A6DDb75e68fC98b079bC41E63630;
    FeedAddressLookUp["SHIB-USDT"].CypressFeedAddress = 0x229Da441c546a17AB4b9C15Ef18f87d6870b9B2b;
    FeedAddressLookUp["PEPE-USDT"].CypressFeedAddress = 0x7EF4bf25C48d837751C3aBDaAB3298C485f9C08B;
    FeedAddressLookUp["SOL-USDT"].CypressFeedAddress = 0xA1d63586497f6DE047DF2bA4CE63718d07e9C7DF;
    FeedAddressLookUp["SOL-KRW"].CypressFeedAddress = 0x9983D451f4424E8a58AF05BF05A92c5b56975182;
    FeedAddressLookUp["STPT-KRW"].CypressFeedAddress = 0x3285B7032dC978712fDE244271f6E59D621eb4a1;
    FeedAddressLookUp["STG-KRW"].CypressFeedAddress = 0x4b3129227b07a0fDBDa70a2374a4Dd7864dD489e;
    FeedAddressLookUp["STX-KRW"].CypressFeedAddress = 0x0084D00bf8fE7cFE465D5514fBC677DE3162FC5e;
    FeedAddressLookUp["STRK-KRW"].CypressFeedAddress = 0x9f343A3522c3Ce5ac05D5E053C1C1a508BCdED6F;
    FeedAddressLookUp["TRX-KRW"].CypressFeedAddress = 0x56139df5fd86F907Ae1C20Edc45Bfa1D69Da3FAE;
    FeedAddressLookUp["SUI-KRW"].CypressFeedAddress = 0x58222376211550A3deE277Cf817C939d8908EC32;
    FeedAddressLookUp["TRX-USDT"].CypressFeedAddress = 0x4090A4eA2F626463b71aFEfdbd5d602dF0fb43cD;
    FeedAddressLookUp["USDT-KRW"].CypressFeedAddress = 0x93Ce21A0C7876dE6c6F4b611A4cb4c83AB2F11ad;
    FeedAddressLookUp["WEMIX-KRW"].CypressFeedAddress = 0x0Be13B64Cb1745e226Cb24318743f3A024a60f74;
    FeedAddressLookUp["USDT-USD"].CypressFeedAddress = 0xa7C4c292Ed720b1318F415B106a443Dc1f052994;
    FeedAddressLookUp["USDC-USDT"].CypressFeedAddress = 0x2a6C17eC5639d495E78bfb0be145B8D575BC9bf2;
    FeedAddressLookUp["WEMIX-USDT"].CypressFeedAddress = 0xCDf1DBC6D4A7a983b06D61efb4D125b97EFf9258;
    FeedAddressLookUp["WLD-KRW"].CypressFeedAddress = 0xEE206DdC549758D93f2De0B96Ed2b096dd9395a5;
    FeedAddressLookUp["WAVES-KRW"].CypressFeedAddress = 0xD74E8DF81873f11CE1A43688A608Aae7CEE07002;
    FeedAddressLookUp["XEC-KRW"].CypressFeedAddress = 0x695DFd8CE789035A7A0e0a76abFcab4A0B2943Df;
    FeedAddressLookUp["XLM-KRW"].CypressFeedAddress = 0x464Fe5e801b46735BDb0aBBda0287B94d310c379;
    FeedAddressLookUp["XRP-KRW"].CypressFeedAddress = 0x56264fE366Ea36aB0d1a39Fd5F279bB5De3dc6D5;
    FeedAddressLookUp["XRP-USDT"].CypressFeedAddress = 0x1dc0cE0328Fee5c52F1EF4f8060FdA2a876Cbe4f;
    FeedAddressLookUp["ZK-KRW"].CypressFeedAddress = 0xf6B5440c69e07681E0ECfDE6b797DB85599A780b;
    FeedAddressLookUp["ZETA-KRW"].CypressFeedAddress = 0x139727b7d5C123D0668907793d0cdbcfBFc990b3;
    FeedAddressLookUp["ZRO-KRW"].CypressFeedAddress = 0x5536Eb1B6B1e182c74ee2464357db48186693F81;
    FeedAddressLookUp["UNI-USDT"].CypressFeedAddress = 0x0c523429A32E8597C3bfF73923d24F4c0b566AfE;
    } else {
        revert PriceFeedAddressManager__PriceFeedAddressNotFound("Invalid Chain ID");
    }
    }

    function getBaobabFeedAddress(string memory quote) public view returns (address) {
        return FeedAddressLookUp[quote].BaobabFeedAddress;
    }

    function getCypressFeedAddress(string memory quote) public view returns (address) {
        return FeedAddressLookUp[quote].CypressFeedAddress;
    }
    
}