part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for validation.
extension UppercaseValidator on String {
  /// Checks if the entire string is in uppercase.
  ///
  /// This method compares the string to its uppercase version. If they are identical,
  /// it means the string contains only uppercase letters.
  ///
  /// Returns `true` if the string is entirely in uppercase, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// 'HELLO'.isUppercase(); // returns true
  /// 'Hello'.isUppercase(); // returns false
  /// 'HELLO WORLD'.isUppercase(); // returns true
  /// '123 ABC'.isUppercase(); // returns true
  /// ```
  bool isUppercase() {
    return this == toUpperCase();
  }
}
