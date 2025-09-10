import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('LowercaseValidator', () {
    // --- Valid Cases ---
    test('should return true for an all-lowercase string', () {
      expect('hello world'.isLowercase(), isTrue);
    });

    test('should return true for a single-word lowercase string', () {
      expect('dart'.isLowercase(), isTrue);
    });

    test('should return true for a string with numbers and symbols', () {
      expect('123 abc-def_ghi'.isLowercase(), isTrue);
      expect('!@#\$%^&*()_+=123'.isLowercase(), isTrue);
    });

    // --- Invalid Cases ---
    test('should return false for a string with mixed casing', () {
      expect('Hello World'.isLowercase(), isFalse);
      expect('dArt'.isLowercase(), isFalse);
    });

    test('should return false for a string that is all uppercase', () {
      expect('HELLO WORLD'.isLowercase(), isFalse);
      expect('UPPERCASE'.isLowercase(), isFalse);
    });

    // --- Edge Cases ---
    test('should return true for an empty string', () {
      expect(''.isLowercase(), isTrue);
    });

    test('should return true for a string with only spaces', () {
      expect('   '.isLowercase(), isTrue);
    });
  });
}
