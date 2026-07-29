part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility for character validation.
extension CharacterValidatorExtension on String {
  /// Checks if the string contains only alphabetic characters.
  ///
  /// This includes both uppercase and lowercase letters.
  bool get isAlphabetic => RegExp(r'^\p{L}+$', unicode: true).hasMatch(this);

  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  bool get isAlphanumeric => RegExp(r'^[\p{L}0-9]+$', unicode: true).hasMatch(this);
}