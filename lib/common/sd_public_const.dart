part of sd_utility;

String _defaultSecureKey = "991U5MzEpH6L29DlzJw7uv9dM2X67a+2kPRt0y21RjA=";

class SDUtilityConst {
  static String _sdSecureKey = _defaultSecureKey;

  static void setSecureKey(String key) {
    SDUtilityConst._sdSecureKey = key;
  }


  // static void setSecureKey(String key) {}
}
