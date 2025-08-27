// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String alphabeticText = 'helloWorld';
  String numericText = '12345';
  String alphanumericText = 'user123';
  String specialCharacterText = 'hello-world';

  // Check if a string is purely alphabetic.
  bool isAlphabetic = alphabeticText.isAlphabetic;
  print('Is "$alphabeticText" alphabetic? $isAlphabetic'); // Output: true

  // Check if a string is purely numeric.
  bool isNumeric = numericText.isNumeric;
  print('Is "$numericText" numeric? $isNumeric'); // Output: true

  // Check if a string is alphanumeric (letters and numbers).
  bool isAlphanumeric = alphanumericText.isAlphanumeric;
  print('Is "$alphanumericText" alphanumeric? $isAlphanumeric'); // Output: true

  // Demonstrate how it fails for special characters.
  bool isSpecialCharacterAlphanumeric = specialCharacterText.isAlphanumeric;
  print(
      'Is "$specialCharacterText" alphanumeric? $isSpecialCharacterAlphanumeric'); // Output: false
}
