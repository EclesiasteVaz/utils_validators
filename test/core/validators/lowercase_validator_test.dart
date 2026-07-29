
import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {

    group('LowercaseValidator FOR FLUTTER API', () {
    test('should return null for an all-lowercase string', () {
      expect(LowercaseValidator.validate('hello world'), null);
    });

    test('should return null for a single-word lowercase string', () {
      expect(LowercaseValidator.validate('dart'), null);
    });

    test('should return null for a string with numbers and symbols', () {
      expect(LowercaseValidator.validate('123 abc-def_ghi'), null);
      expect(LowercaseValidator.validate('!@#\$%^&*()_+=123'), null);
    });

    test('should return error message for a string with mixed casing', () {
      expect(LowercaseValidator.validate('Hello World'), isA<String>());
      expect(LowercaseValidator.validate('dArt'), isA<String>());
    });

    test('should return error message for a string that is all uppercase', () {
      expect(LowercaseValidator.validate('HELLO WORLD'), isA<String>());
      expect(LowercaseValidator.validate('UPPERCASE'), isA<String>());
    });

  });
}