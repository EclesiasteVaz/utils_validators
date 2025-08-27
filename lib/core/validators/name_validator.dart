part of '../../utils_validators.dart';

/// A simple validator for names, implemented as an extension on String.
///
/// This extension provides a streamlined way to check if a string
/// represents a valid name, with options for customizing validation rules.
extension NameValidator on String {
  /// A regular expression pattern to check for a valid name.
  ///
  /// This pattern ensures the string contains only letters, spaces,
  /// and specific characters common in names, such as hyphens and
  /// apostrophes, as well as accented letters in many languages.
  /// It correctly handles multiple spaces between words.
  static final RegExp _namePattern = RegExp(
    r"^[a-zA-Z\s'’´`áàãâéêíóôõúüçÁÀÃÂÉÊÍÓÔÕÚÜÇ-]+$",
  );

  /// A list of common name particles (prepositions) that should not be capitalized
  /// when not at the start of the name.
  /// Following Brazilian Portuguese conventions.
  static const List<String> _nameParticles = ['da', 'de', 'do', 'dos'];

  /// Validates if the string is a valid name based on a set of rules.
  ///
  /// The validation rules are:
  /// - The string must not be empty or contain only spaces.
  /// - It must not contain invalid characters (numbers, most symbols).
  /// - The number of words must be at least [minWords] and at most [maxWords].
  /// - Each significant word must start with an uppercase letter.
  /// - Name particles (e.g., "de", "da") are an exception to the capitalization rule.
  ///
  /// Parameters:
  /// - [minWords]: The minimum number of words required. Default is 1.
  /// - [maxWords]: The maximum number of words allowed. Null means no limit.
  ///
  /// Example usage:
  /// ```dart
  /// 'John Doe'.isValidName(minWords: 2); // returns true
  /// 'Maria de Souza'.isValidName(minWords: 2, maxWords: 4); // returns true
  /// 'João Pedro'.isValidName(minWords: 3); // returns false (minWords not met)
  /// 'Ana Carolina de Jesus'.isValidName(maxWords: 3); // returns false (maxWords exceeded)
  /// ```
  bool isValidName({int minWords = 1, int? maxWords}) {
    final trimmedName = trim();

    if (trimmedName.isEmpty || !_namePattern.hasMatch(trimmedName)) {
      return false;
    }

    final words = trimmedName
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    final wordCount = words.length;

    // 1. Check if the word count is within the specified range.
    if (wordCount < minWords) {
      return false;
    }
    if (maxWords != null && wordCount > maxWords) {
      return false;
    }

    // 2. Validate capitalization for each word.
    for (var i = 0; i < wordCount; i++) {
      final word = words[i];
      final lowerCaseWord = word.toLowerCase();

      if (_nameParticles.contains(lowerCaseWord) && i > 0) {
        if (word != lowerCaseWord) {
          return false;
        }
      } else {
        if (word[0] != word[0].toUpperCase()) {
          return false;
        }
      }
    }

    return true;
  }
}
