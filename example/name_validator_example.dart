// ignore_for_file: avoid_print

import 'package:utils_validators/utils_validators.dart';

void main() {
  String fullName = 'João Pedro dos Santos';
  String invalidName = 'joão silva';
  String singleName = 'Maria';

  // Validate a full name with at least 2 words.
  bool isFullNameValid = fullName.isValidName(minWords: 2);
  print('"$fullName" is a valid full name? $isFullNameValid'); // Output: true

  // Validate a name with incorrect capitalization.
  bool isInvalidNameValid = invalidName.isValidName();
  print('"$invalidName" is a valid name? $isInvalidNameValid'); // Output: false

  // Check the minimum word count.
  bool isSingleNameValid = singleName.isValidName(minWords: 2);
  print(
      '"$singleName" is a valid full name? $isSingleNameValid'); // Output: false
}
