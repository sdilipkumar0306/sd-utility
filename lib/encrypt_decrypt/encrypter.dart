part of sd_utility;

class SDEncrypter {
  static String _getPrivateKey(String? key) => key ?? _encrypterPrivateKey ?? _defaultEncrypterPrivateKey;

  static AesCrypt _genAesCrypt([String? key]) => AesCrypt(key: key ?? _encrypterPublicKey ?? _defaultEncrypterPublicKey, padding: PaddingAES.pkcs7);

  static String encrypt(String text, [String? public, String? private]) => _genAesCrypt(public).gcm.encrypt(inp: text, iv: _getPrivateKey(private));

  static String decrypt(String text, [String? public, String? private]) => _genAesCrypt(public).gcm.decrypt(enc: text, iv: _getPrivateKey(private));

  static String encryptCTR(String text, [String? public, String? private]) =>
      _genAesCrypt(public).ctr.encrypt(inp: text, iv: _getPrivateKey(private));

  static String decryptCTR(String text, [String? public, String? private]) =>
      _genAesCrypt(public).ctr.decrypt(enc: text, iv: _getPrivateKey(private));

  static void setPublicKey(String key) => _encrypterPublicKey = key;

  static void setPrivateKey(String key) => _encrypterPrivateKey = key;

  static String get generateRandomKey => _genCryptKey.genFortuna();

  static String get generatePublicKey => _genCryptKey.genFortuna();

  static String get generatePrivateKey => _genCryptKey.genDart();

  static bool verifyPublicKey(String key) => key == _encrypterPublicKey;

  static bool verifyPrivateKey(String key) => key == _encrypterPrivateKey;

  static void resetKeys() => {_encrypterPublicKey = null, _encrypterPrivateKey = null};

  static void resetPublicKey() => _encrypterPublicKey = null;

  static void resetPrivateKey() => _encrypterPrivateKey = null;
}
