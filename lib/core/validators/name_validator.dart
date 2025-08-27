/// Validator for person names with support for multiple validation rules.
///
/// Provides validation for:
/// - Proper uppercase/lowercase formatting
/// - Allowed/blocked special characters
/// - Minimum/maximum name count requirements
/// - Exceptions for prepositions and articles
///
/// Usage example:
/// ```dart
/// final validator = NameValidator(name: 'João da Silva');
/// if (validator.validate()) {
///   print('Valid name');
/// } else {
///   print('Invalid name');
/// }
/// ```
class NameValidator {
  /// Full name to be validated
  final String name;

  /// Default exceptions (prepositions/articles) that don't follow capitalization rules
  static const List<String> _defaultExceptions = [
    "em", "de", "dos", "do", "da", "das", "e"
  ];

  /// Special characters allowed in names
  static const List<String> _defaultAllowedSpecialChars = [
    "'", "-", " "
  ];

  /// Constructs a name validator instance
  ///
  /// [name]: The full name string to be validated
  NameValidator({required this.name});

  /// Validates the name according to configured rules
  ///
  /// Parameters:
  /// - [isFirstAndLastName]: If true, requires at least 2 names (first and last name)
  /// - [minNameCount]: Minimum number of names required
  /// - [maxNameCount]: Maximum number of names allowed
  /// - [allowSpecialChars]: Custom list of allowed special characters
  /// - [customExceptions]: Custom list of exception words
  ///
  /// Returns `true` if the name is valid, `false` otherwise
  bool validate({
    bool isFirstAndLastName = false,
    int minNameCount = 1,
    int? maxNameCount,
    List<String>? allowSpecialChars,
    List<String>? customExceptions,
  }) {
    final effectiveExceptions = customExceptions ?? _defaultExceptions;
    final effectiveAllowedChars = allowSpecialChars ?? _defaultAllowedSpecialChars;

    final trimmedName = name.trim();
    if (trimmedName.isEmpty) return false;

    final names = trimmedName.split(' ').where((part) => part.isNotEmpty).toList();
    
    // Validate name count
    if (names.length < minNameCount) return false;
    if (maxNameCount != null && names.length > maxNameCount) return false;
    if (isFirstAndLastName && names.length < 2) return false;

    for (int i = 0; i < names.length; i++) {
      final word = names[i];
      
      // Validate allowed characters
      if (!_containsOnlyValidChars(word, effectiveAllowedChars)) {
        return false;
      }

      // Validate capitalization (except for exceptions that aren't the first name)
      if (i > 0 && effectiveExceptions.contains(word.toLowerCase())) {
        continue;
      }

      if (!_hasProperCapitalization(word)) {
        return false;
      }
    }

    return true;
  }

  /// Checks if the word contains only valid characters
  ///
  /// [word]: The word to validate
  /// [allowedSpecialChars]: List of allowed special characters
  /// Returns `true` if all characters are valid
  bool _containsOnlyValidChars(String word, List<String> allowedSpecialChars) {
    final escapedChars = allowedSpecialChars.map((char) => RegExp.escape(char)).join();
    final validChars = RegExp(r'^[a-zA-ZÀ-ÿ$escapedChars]+$');
    return validChars.hasMatch(word);
  }

  /// Verifies if the word has proper capitalization
  ///
  /// [word]: The word to check
  /// Returns `true` if capitalization is correct:
  /// - First letter uppercase
  /// - Remaining letters lowercase
  bool _hasProperCapitalization(String word) {
    if (word.length < 2) return false;
    
    // First letter must be uppercase
    if (word[0] != word[0].toUpperCase()) return false;
    
    // Remaining letters should be lowercase
    if (word.length > 1) {
      final remainingLetters = word.substring(1);
      if (remainingLetters != remainingLetters.toLowerCase()) return false;
    }
    
    return true;
  }

  /// Static method for quick validation
  ///
  /// Example:
  /// ```dart
  /// bool isValid = NameValidator.isValid('Maria da Silva');
  /// ```
  ///
  /// [name]: The name to validate
  /// [isFirstAndLastName]: If true, requires first and last name
  /// Returns `true` if the name is valid
  static bool isValid(String name, {bool isFirstAndLastName = false}) {
    return NameValidator(name: name).validate(
      isFirstAndLastName: isFirstAndLastName,
    );
  }

  /// Validates if the name contains only letters and allowed characters
  ///
  /// Useful for real-time validation in text fields
  ///
  /// [name]: The name to validate
  /// [allowedSpecialChars]: Custom allowed characters (optional)
  /// Returns `true` if only valid characters are present
  static bool containsOnlyValidCharacters(
    String name, {
    List<String>? allowedSpecialChars,
  }) {
    final effectiveAllowedChars = allowedSpecialChars ?? _defaultAllowedSpecialChars;
    final escapedChars = effectiveAllowedChars.map((char) => RegExp.escape(char)).join();
    final validPattern = RegExp(r'^[a-zA-ZÀ-ÿ\s$escapedChars]*$');
    return validPattern.hasMatch(name);
  }
}