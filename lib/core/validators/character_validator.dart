part of '../../utils_validators.dart';

class CharacterValidator {
  CharacterValidator._();

  static String? validate(String text,
      {String message = 'Invalid', required CharacterValidation validation}) {
    if (validation == CharacterValidation.alphaNumeric) {
      return _validateAlphaNumeric(text, message);
    }

    if (validation == CharacterValidation.alphabetic) {
      return _validateAlphabetic(text, message);
    }

    if (validation == CharacterValidation.numeric) {
      return _validateNumeric(text, message);
    }

    return message;
  }

  static String? _validateAlphaNumeric(String text, String message) {
    if (text.isAlphanumeric) return null;
    return message;
  }

  static String? _validateNumeric(String text, String message) {
    if (text.isNumeric) return null;
    return message;
  }

  static String? _validateAlphabetic(String text, String message) {
    if (text.isAlphabetic) return null;
    return message;
  }
}

enum CharacterValidation { alphaNumeric, numeric, alphabetic }
