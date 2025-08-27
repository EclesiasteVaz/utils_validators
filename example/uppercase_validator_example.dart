// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String uppercaseText = 'HELLO WORLD';
  String mixedCaseText = 'Hello World';

  // Check if the string is entirely in uppercase.
  bool isUppercase = uppercaseText.isUppercase();
  print('Is "$uppercaseText" all uppercase? $isUppercase'); // Output: true

  // Check a string with mixed casing.
  bool isMixedCaseUppercase = mixedCaseText.isUppercase();
  print(
      'Is "$mixedCaseText" all uppercase? $isMixedCaseUppercase'); // Output: false
}
