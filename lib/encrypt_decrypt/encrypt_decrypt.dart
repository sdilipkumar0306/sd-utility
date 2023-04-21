part of sd_utility;

AesCrypt _genAesCrypt([String? key]) => AesCrypt(key: key ?? _encrypterPublicKey, padding: PaddingAES.pkcs7);
