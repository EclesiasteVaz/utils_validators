// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String angolanNumber = '923456789';
  String numberWithCode = '244931234567';
  String invalidNumber = '901234567';

  // Validate a 9-digit Angolan number.
  bool isAngolanNumberValid =
      angolanNumber.isValidPhoneNumber(country: NumberCountry.ao);
  print(
      '"$angolanNumber" is a valid Angolan number? $isAngolanNumberValid'); // Output: true

  // Validate a number with the country code.
  bool isNumberWithCodeValid =
      numberWithCode.isValidPhoneNumber(country: NumberCountry.ao);
  print(
      '"$numberWithCode" is a valid Angolan number? $isNumberWithCodeValid'); // Output: true

  // Validate a number with an invalid prefix.
  bool isInvalidNumber =
      invalidNumber.isValidPhoneNumber(country: NumberCountry.ao);
  print(
      '"$invalidNumber" is a valid Angolan number? $isInvalidNumber'); // Output: false
}
