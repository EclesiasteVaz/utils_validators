part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for validation.
extension LowercaseValidator on String {
  /// Checks if the entire string is in lowercase.
  ///
  /// This method compares the string to its lowercase version. If they are identical,
  /// it means the string contains only lowercase letters. Numbers and symbols are
  /// considered to be in "lowercase" since they are not affected by the conversion.
  ///
  /// Returns `true` if the string is entirely in lowercase, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// 'hello'.isLowercase(); // returns true
  /// 'Hello'.isLowercase(); // returns false
  /// 'hello world'.isLowercase(); // returns true
  /// '123 abc'.isLowercase(); // returns true
  /// ```
  bool isLowercase() {
    return this == toLowerCase();
  }
}
