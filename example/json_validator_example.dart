// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String validJson = '{"name": "John", "age": 30}';
  String invalidJson = '{"name": "John", "age": 30';

  // Validate a correctly formatted JSON string.
  bool isValidJson = validJson.isJson();
  print('Is "$validJson" a valid JSON? $isValidJson'); // Output: true

  // Validate an invalid JSON string (missing brace).
  bool isInvalidJson = invalidJson.isJson();
  print('Is "$invalidJson" a valid JSON? $isInvalidJson'); // Output: false
}
