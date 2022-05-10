// If there is the "type": "module" in package.json, certain CommonJS variables can't be used
// https://nodejs.org/api/esm.html#no-require-exports-or-moduleexports
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

import bip39 from 'bip39'

const hdkey = require('ethereumjs-wallet/hdkey')

export const getPrivateKeyFromMnemonic = (mnemonic, index, config) => {
	if (index < 0 || index > 9) throw new Error('index should be integer between 0 and 9')
	return bip39.mnemonicToSeed(mnemonic).then(seed => {
		const hdk = hdkey.fromMasterSeed(seed);
		const addr_node = hdk.derivePath(`m/44'/60'/0'/0/${index}`); //m/44'/60'/0'/0/0 is derivation path for the first account. m/44'/60'/0'/0/1 is the derivation path for the second account and so on
		const addr = addr_node.getWallet().getAddressString(); //check that this is the same with the address that ganache lists for the first account to make sure the derivation is correct
		const privKey = "0x"+addr_node.getWallet().getPrivateKey().toString("hex");
		return {sk: privKey, addr: addr};
	}).catch(error => console.log('getTrufflePrivateKey ERROR : ' + error));
}

