import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {


    group('NameValidator - For Flutter API', () {
    // --- Testes para Nomes Válidos ---
    test('should return true for valid single-word names', () {
      expect(NameValidator.validate('Maria'), null);
    });

    test('should return true for valid full names', () {
      expect(NameValidator.validate('João Pedro', minWords: 2), null);
      expect(NameValidator.validate('Ana Clara de Souza', minWords: 2), null);
      expect(NameValidator.validate('Ana Clara de Souza', minWords: 2, maxWords: 2), isA<String>());
    });
  });

}