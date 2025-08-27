// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String validDate = '2023-10-27';
  String fullDateTime = '2023-10-27T10:30:00Z';
  String invalidDate = '31-02-2023'; // Invalid month/day combination

  // Validate a standard date string.
  bool isDateValid = validDate.isValidDateTime();
  print('Is "$validDate" a valid date? $isDateValid'); // Output: true

  // Validate a full date and time string with timezone.
  bool isFullDateTimeValid = fullDateTime.isValidDateTime();
  print(
      'Is "$fullDateTime" a valid date and time? $isFullDateTimeValid'); // Output: true

  // Validate a clearly invalid date.
  bool isInvalidDate = invalidDate.isValidDateTime();
  print('Is "$invalidDate" a valid date? $isInvalidDate'); // Output: false
}
