part of '../../utils_validators.dart';

class AngolanIdValidator {
  AngolanIdValidator._();

  static String? validate(String angolanId,
      [String message = 'Identifier invalid']) {
    if (angolanId.isValidAngolanId()) {
      return null;
    }
    return message;
  }
}
