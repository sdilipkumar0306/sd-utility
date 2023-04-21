part of sd_utility;

class SDEncrypter {
  static String encrypt(String text, [String? keyCode]) {
    return _genAesCrypt(keyCode).gcm.encrypt(inp: text, iv: _iv16Key);
  }

  static String decrypt(String text, [String? keyCode]) {
    return _genAesCrypt(keyCode).gcm.decrypt(enc: text, iv: _iv16Key);
  }

  static String encryptCTR(String text, [String? keyCode]) {
    return _genAesCrypt(keyCode).ctr.encrypt(inp: text, iv: _iv16Key);
  }

  static String decryptCTR(String text, [String? keyCode]) {
    return _genAesCrypt(keyCode).ctr.decrypt(enc: text, iv: _iv16Key);
  }

  static String generateKey() {
    return _genCryptKey.genFortuna();
  }
}
