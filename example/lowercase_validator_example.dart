// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String text1 = 'Dart';
  String text2 = 'dart';

  // Perform a case-sensitive comparison (default behavior).
  bool areEqualCaseSensitive = text1.equals(text2);
  print(
      'Are "$text1" and "$text2" equal (case-sensitive)? $areEqualCaseSensitive'); // Output: false

  // Perform a case-insensitive comparison.
  bool areEqualCaseInsensitive = text1.equals(text2, isCaseSensitive: false);
  print(
      'Are "$text1" and "$text2" equal (case-insensitive)? $areEqualCaseInsensitive'); // Output: true
}
