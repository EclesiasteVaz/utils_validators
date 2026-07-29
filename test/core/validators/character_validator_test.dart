import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('CharacterValidator FOR FLUTTER API', () {
    test('should return null for alphabetic string', () {
      expect(
        CharacterValidator.validate(
          'helloWorld',
          validation: CharacterValidation.alphabetic,
        ),
        null,
      );
    });

    test('should return String? for non-alphabetic string', () {
      expect(
        CharacterValidator.validate(
          'hello123',
          validation: CharacterValidation.alphabetic,
        ),
        isA<String>(),
      );
    });

    test('should return null for numeric string', () {
      expect(
        CharacterValidator.validate(
          '12345',
          validation: CharacterValidation.numeric,
        ),
        null,
      );
    });

    test('should return String? for non-numeric string', () {
      expect(
        CharacterValidator.validate(
          '123abc',
          validation: CharacterValidation.numeric,
        ),
        isA<String>(),
      );
    });

    test('should return null for alphanumeric string', () {
      expect(
        CharacterValidator.validate(
          'user123',
          validation: CharacterValidation.alphaNumeric,
        ),
        null,
      );
    });

    test('should return String? for non-alphanumeric string', () {
      expect(
        CharacterValidator.validate(
          'user-123',
          validation: CharacterValidation.alphaNumeric,
        ),
        isA<String>(),
      );
    });

    test('should return String? for empty string', () {
      expect(
        CharacterValidator.validate(
          '',
          validation: CharacterValidation.alphabetic,
        ),
        isA<String>(),
      );
    });
  });
}
