part of '../../utils_validators.dart';

class EqualValidator {
  EqualValidator._();

  static String? validate({
    required String text,
    required toText,
    bool isCaseSensitive = true,
    String message = 'Are Not equal',
  }) {
    if (text.equals(toText, isCaseSensitive: isCaseSensitive)) {
      return null;
    }
    return message;
  }
}
