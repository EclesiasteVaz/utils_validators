import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {


    group('NameValidator - For Flutter API', () {
    test('should return null for valid single-word names', () {
      expect(NameValidator.validate('Maria'), null);
    });

    test('should return null for valid full names', () {
      expect(NameValidator.validate('João Pedro', minWords: 2), null);
      expect(NameValidator.validate('Ana Clara de Souza', minWords: 2), null);
      expect(NameValidator.validate('Ana Clara de Souza', minWords: 2, maxWords: 2), isA<String>());
    });

    test('should return error message when maxWords is exceeded', () {
      expect(NameValidator.validate('Ana Clara de Souza', minWords: 2, maxWords: 2), isA<String>());
    });
  });

}