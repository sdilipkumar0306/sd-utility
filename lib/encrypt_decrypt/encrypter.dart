part of sd_utility;

class SDEncrypter {
  static String encrypt(String text, [String? publicKey, String? privateKey]) {
    return _genAesCrypt(publicKey).gcm.encrypt(inp: text, iv: privateKey ?? _encrypterPrivateKey);
  }

  static String decrypt(String text, [String? publicKey, String? privateKey]) {
    return _genAesCrypt(publicKey).gcm.decrypt(enc: text, iv: privateKey ?? _encrypterPrivateKey);
  }

  static String encryptCTR(String text, [String? publicKey, String? privateKey]) {
    return _genAesCrypt(publicKey).ctr.encrypt(inp: text, iv: privateKey ?? _encrypterPrivateKey);
  }

  static String decryptCTR(String text, [String? publicKey, String? privateKey]) {
    return _genAesCrypt(publicKey).ctr.decrypt(enc: text, iv: privateKey ?? _encrypterPrivateKey);
  }

  static void setPublicKey(String key) {
    _encrypterPublicKey = key;
  }

  static void setPrivateKey(String key) {
    _encrypterPrivateKey = key;
  }

  static String get generateRandomKey => _genCryptKey.genFortuna();

  static String get generatePublicKey => _genCryptKey.genFortuna();

  static String get generatePrivateKey => _genCryptKey.genDart();
}
