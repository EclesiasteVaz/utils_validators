part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility for character validation.
extension CharacterValidator on String {
  /// Checks if the string contains only alphabetic characters.
  ///
  /// This includes both uppercase and lowercase letters.
  bool get isAlphabetic => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  /// Checks if the string contains only numeric digits.
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Checks if the string contains only alphanumeric characters.
  ///
  /// This includes letters and numbers.
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
}
