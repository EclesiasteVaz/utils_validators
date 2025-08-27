part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for comparing strings.
extension EqualValidator on String {
  /// Checks if this string is equal to another string.
  ///
  /// This method performs a string comparison, with an option for case-sensitive
  /// or case-insensitive matching.
  ///
  /// Parameters:
  /// - `toEqual`: The string to compare against.
  /// - `isCaseSensitive`: If `false`, the comparison is case-insensitive.
  ///   Defaults to `true`.
  ///
  /// Returns `true` if the strings are equal based on the comparison rules,
  /// otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// 'Hello'.equals('hello'); // returns false (case-sensitive by default)
  /// 'Hello'.equals('hello', isCaseSensitive: false); // returns true
  /// 'Dart'.equals('Dart'); // returns true
  /// ```
  bool equals(String toEqual, {bool isCaseSensitive = true}) {
    if (isCaseSensitive) {
      return this == toEqual;
    }
    return toLowerCase() == toEqual.toLowerCase();
  }
}
