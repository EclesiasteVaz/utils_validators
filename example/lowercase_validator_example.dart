// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String allLower = 'hello world';
  String mixedCase = 'Hello World';

  bool isValidLowercase = allLower.isLowercase();
  print('Is "$allLower" all lowercase? $isValidLowercase'); // Output: true

  bool isInvalidLowercase = mixedCase.isLowercase();
  print(
      'Is "$mixedCase" all lowercase? $isInvalidLowercase'); // Output: false
}
