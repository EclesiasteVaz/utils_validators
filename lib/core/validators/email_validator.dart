part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for email validation.
extension EmailValidator on String {
  /// Checks if the string is a valid email address.
  ///
  /// This method uses a regular expression to validate the email format. It checks
  /// for a valid local part, an "@" symbol, a domain, and a top-level domain.
  /// The validation is case-insensitive.
  ///
  /// Returns `true` if the string is a valid email, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// 'test@example.com'.isValidEmail(); // returns true
  /// 'test@example'.isValidEmail(); // returns false
  /// 'test@.com'.isValidEmail(); // returns false
  /// 'test@example.c'.isValidEmail(); // returns false
  /// ```
  bool isValidEmail() {
    if (isEmpty) {
      return false;
    }

    // A robust regular expression for email validation.
    // It checks for:
    // - A valid local part (before the @).
    // - An @ symbol.
    // - A domain name with a TLD (e.g., .com, .org, etc.).
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);

    return regex.hasMatch(this);
  }
}
