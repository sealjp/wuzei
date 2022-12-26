import '../../lib.dart';

class Validator {
  static String? publickey(String? v) {
    if (v == null || v.isEmpty) return 'validator_notEmpty';
    if (v.length != 392 ||
        v.substring(0, 44) != 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' ||
        v.substring(v.length - 6, v.length) != 'IDAQAB')
      return 'validator_notRSA'.tr;
    return null;
  }

  static String? name(String? v) {
    if (v == null || v.isEmpty) return 'validator_notEmpty';
    return null;
  }
}
