// main.dart

// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String validAngolanId = '123456789BI123';
  String invalidIdFormat = '123456789BI12';
  String invalidProvinceCode = '123456789XX123';

  // Validate a correctly formatted Angolan ID.
  bool isValidId = validAngolanId.isValidAngolanId();
  print('Is "$validAngolanId" a valid Angolan ID? $isValidId'); // Output: true

  // Validate an ID with an incorrect format (missing digit).
  bool isInvalidFormat = invalidIdFormat.isValidAngolanId();
  print(
      'Is "$invalidIdFormat" a valid Angolan ID? $isInvalidFormat'); // Output: false

  // Validate an ID with an invalid province code.
  bool isInvalidProvince = invalidProvinceCode.isValidAngolanId();
  print(
      'Is "$invalidProvinceCode" a valid Angolan ID? $isInvalidProvince'); // Output: false
}
