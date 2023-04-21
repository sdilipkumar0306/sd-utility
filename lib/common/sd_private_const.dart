part of sd_utility;

var _genCryptKey = CryptKey();

// Default Public Key can be Modified
const String _defaultEncrypterPublicKey = "991U5MzEpH6L29DlzJw7uv9dM2X67a+2kPRt0y21RjA=";

// Default Private Key can be modified
const String _defaultEncrypterPrivateKey = "RVKC9m6mbH7QJUbYnDlHDg==";

/// Public Key can be set with setter method by SDEncrypter.setPublicKey(key)
String? _encrypterPublicKey;

/// Private Key can be set with setter method by SDEncrypter.setPrivateKey(key)
String? _encrypterPrivateKey;
