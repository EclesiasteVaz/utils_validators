part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for URL validation.
extension UrlValidator on String {
  /// Validates if the string is a valid URL.
  ///
  /// This method checks for a valid URL format, including the protocol (http/https/ftp),
  /// a domain name, an optional port, and optional paths or query parameters. The validation
  /// is based on a robust regular expression.
  ///
  /// Returns `true` if the string is a valid URL, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// '[https://www.google.com](https://www.google.com)'.isValidUrl(); // returns true
  /// 'http://localhost:8080'.isValidUrl(); // returns true
  /// 'ftp://example.org/path/to/file'.isValidUrl(); // returns true
  /// 'not-a-url'.isValidUrl(); // returns false
  /// ```
  bool isValidUrl() {
    if (isEmpty) {
      return false;
    }

    const pattern = r'^(https?|ftp):\/\/'
        r'((([a-z\d]([a-z\d-]*[a-z\d])?)\.)*[a-z\d]([a-z\d-]*[a-z\d])|'
        r'(localhost)|'
        r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))'
        r'(:\d{1,5})?'
        r'(\/[-a-z\d%_.~+]*)*'
        r'(\?[;&a-z\d%_.~+=-]*)?'
        r'(#[-a-z\d%_.~+]*)*$';

    final regex = RegExp(pattern, caseSensitive: false);

    return regex.hasMatch(this);
  }
}
