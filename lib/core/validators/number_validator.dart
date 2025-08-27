part of '../../utils_validators.dart';

/// A utility extension for validating phone numbers based on country-specific rules.
///
/// This extension provides a streamlined way to check if a string represents a valid
/// phone number for a given country, currently supporting Angola (AO).
extension NumberValidator on String {
  /// A list of supported countries for phone number validation.
  ///
  /// This enum helps to avoid string-based errors and makes the API clearer.
  // ignore: constant_identifier_names
  static const List<NumberCountry> supportedCountries = [NumberCountry.ao];

  /// Validates a phone number based on the rules of a specific country.
  ///
  /// Parameters:
  /// - `country`: The country for which to validate the number.
  ///
  /// Returns `true` if the number is valid for the specified country, otherwise `false`.
  /// Throws an [UnsupportedError] if the country is not supported.
  bool isValidPhoneNumber({NumberCountry country = NumberCountry.ao}) {
    switch (country) {
      case NumberCountry.ao:
        return _validateAngola();
      default:
        throw UnsupportedError(
            'Phone number validation for this country is not supported.');
    }
  }

  /// Validates an Angolan (AO) phone number.
  ///
  /// This method checks the following rules:
  /// - The number must have exactly 9 digits after removing non-digit characters and country codes.
  /// - The number must start with a valid Angolan operator prefix (e.g., 91, 92, 93, 94, 95, 96, 97).
  /// - It ignores any country code prefix (e.g., +244).
  ///
  /// Example:
  /// `'+244923456789'.isValidPhoneNumber(country: NumberCountry.ao)` returns `true`.
  bool _validateAngola() {
    // 1. Clean the number: remove all non-digit characters.
    final cleanedNumber = replaceAll(RegExp(r'\D'), '');

    // 2. Remove the country code if present.
    // Angola's country code is 244. A 12-digit number starting with 244 is assumed to have the code.
    final numberWithoutCountryCode =
        cleanedNumber.length == 12 && cleanedNumber.startsWith('244')
            ? cleanedNumber.substring(3)
            : cleanedNumber;

    // 3. Check length and prefix.
    // Angolan numbers have 9 digits and start with '9'.
    if (numberWithoutCountryCode.length != 9 ||
        !numberWithoutCountryCode.startsWith('9')) {
      return false;
    }

    // 4. Validate the operator prefix.
    final prefix = numberWithoutCountryCode.substring(0, 2);
    const validPrefixes = ['91', '92', '93', '94', '95', '96', '97'];

    return validPrefixes.contains(prefix);
  }
}

/// An enum representing the country codes for phone number validation.
enum NumberCountry {
  /// Angola
  ao,

  /// Brasil
  br,

  /// TODO: Add other countries here...
}
