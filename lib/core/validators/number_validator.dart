part of '../../utils_validators.dart';

class NumberValidator {
  NumberValidator._();

  static String? validate(String text,
      {NumberCountry numberCountry = NumberCountry.ao,
      String message = 'Number invalid'}) {
    if (text.isValidPhoneNumber(country: numberCountry)) {
      return null;
    }

    return message;
  }
}
