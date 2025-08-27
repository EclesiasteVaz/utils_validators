part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for JSON validation.
extension JsonValidator on String {
  /// Checks if the string is a valid JSON.
  ///
  /// This method attempts to parse the string using `json.decode` from
  /// the `dart:convert` library. If the parsing is successful, the string
  /// is considered a valid JSON. If a `FormatException` is thrown during
  /// parsing, the string is not a valid JSON.
  ///
  /// Returns `true` if the string is a valid JSON, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// '{"name": "John", "age": 30}'.isJson(); // returns true
  /// '{"name": "John", "age": 30'.isJson(); // returns false
  /// ''.isJson(); // returns false
  /// ```
  bool isJson() {
    if (isEmpty) {
      return false;
    }

    try {
      json.decode(this);
      return true;
    } on FormatException {
      return false;
    }
  }
}
