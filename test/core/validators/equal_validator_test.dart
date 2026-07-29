import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('EqualValidator FOR FLUTTER API', () {
    test('should return null when strings are identical (case-sensitive)', () {
      expect(EqualValidator.validate(text: 'Dart', toText: 'Dart'), null);
    });

    test('should return error message when strings have different casing', () {
      expect(
        EqualValidator.validate(text: 'Hello', toText: 'hello'),
        isA<String>(),
      );
    });

    test('should return null when case-insensitive and strings match', () {
      expect(
        EqualValidator.validate(
          text: 'HELLO',
          toText: 'hello',
          isCaseSensitive: false,
        ),
        null,
      );
    });

    test('should return error message when strings are different', () {
      expect(
        EqualValidator.validate(text: 'Dart', toText: 'Flutter'),
        isA<String>(),
      );
    });

    test('should return null when both strings are empty', () {
      expect(EqualValidator.validate(text: '', toText: ''), null);
    });
  });
}
