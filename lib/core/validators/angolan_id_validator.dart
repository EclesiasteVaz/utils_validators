part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method to validate an Angolan Citizen ID.
extension AngolanIdValidator on String {
  /// Validates if the string is a valid Angolan Citizen ID.
  ///
  /// The Angolan ID has a specific format: `NNNNNNNNNPPCCC`.
  /// - `NNNNNNNNN`: 9 numerical digits.
  /// - `PP`: 2 uppercase letters representing the province code.
  /// - `CCC`: 3 numerical digits.
  ///
  /// This method checks the following rules:
  /// - The string must match the format.
  /// - The province code must be one of the officially recognized Angolan provinces.
  ///
  /// Returns `true` if the ID is valid, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// '123456789BI123'.isValidAngolanId(); // returns true
  /// '123456789XX123'.isValidAngolanId(); // returns false
  /// 'invalid'.isValidAngolanId(); // returns false
  /// ```
  bool isValidAngolanId() {
    if (isEmpty) {
      return false;
    }

    // A regular expression to validate the ID format: 9 digits, 2 uppercase letters, 3 digits.
    final regex = RegExp(r'^\d{9}([A-Z]{2})\d{3}$');

    // Check if the string matches the regex pattern.
    if (!regex.hasMatch(this)) {
      return false;
    }

    // Extract the province code from the string.
    final match = regex.firstMatch(this)!;
    final provinceCode = match.group(1);

    // List of valid two-letter province codes in Angola.
    // BI = Bié, BL = Benguela, BG = Bengo, CB = Cabinda, CC = Cunene, CU = Cuanza Sul, HU = Huambo,
    // HD = Huíla, KN = Cuando-Cubango, KS = Cuanza Norte, LU = Luanda, LB = Lunda Sul, LS = Lunda Norte,
    // ML = Malanje, MO = Moxico, NA = Namibe, UI = Uíge, ZA = Zaire.
    const validProvinces = [
      'BL',
      'BG',
      'BI',
      'CB',
      'CC',
      'CU',
      'HU',
      'HD',
      'KN',
      'KS',
      'LU',
      'LB',
      'LS',
      'ML',
      'MO',
      'NA',
      'UI',
      'ZA'
    ];

    // Check if the extracted province code is in the list of valid provinces.
    return validProvinces.contains(provinceCode);
  }
}
