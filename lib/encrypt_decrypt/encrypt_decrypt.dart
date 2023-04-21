part of sd_utility;

AesCrypt _genAesCrypt([String? key]) => AesCrypt(key: key ?? SDUtilityConst._sdSecureKey, padding: PaddingAES.pkcs7);
