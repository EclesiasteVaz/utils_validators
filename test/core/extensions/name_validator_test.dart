import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group('NameValidator - isValidName()', () {
    // --- Testes para Nomes Válidos ---
    test('should return true for valid single-word names', () {
      expect('Maria'.isValidName(), isTrue);
      expect('José'.isValidName(), isTrue);
      expect('Lucas'.isValidName(), isTrue);
    });

    test('should return true for valid full names', () {
      expect('João Pedro'.isValidName(minWords: 2), isTrue);
      expect('Ana Clara de Souza'.isValidName(minWords: 2), isTrue);
      expect('Pedro de Alcântara'.isValidName(minWords: 2), isTrue);
    });

    test('should return true for names with complex capitalization', () {
      expect('Maria Luíza'.isValidName(), isTrue);
      expect('João dos Santos'.isValidName(), isTrue);
      expect('Luís Fernando'.isValidName(), isTrue);
    });

    test('should return true for names with hyphens and apostrophes', () {
      expect('Jean-Claude'.isValidName(), isTrue);
      expect("D'Angelo".isValidName(), isTrue);
      expect("O'Connell".isValidName(), isTrue);
      expect('Maria Clara Pires-Fernandes'.isValidName(), isTrue);
    });

    test(
        'should return true for names with accented characters from different languages',
        () {
      expect('José'.isValidName(), isTrue);
      expect('Frédéric'.isValidName(), isTrue);
      expect('André'.isValidName(), isTrue);
      expect('João'.isValidName(), isTrue);
      expect('René'.isValidName(), isTrue);
      expect('Léa'.isValidName(), isTrue);
    });

    test('should handle names with multiple spaces correctly', () {
      expect('  Maria   Clara  '.isValidName(), isTrue);
      expect('Ana    Luísa'.isValidName(), isTrue);
    });

    // --- Testes para Nomes Inválidos ---
    test('should return false for names containing numbers', () {
      expect('João123'.isValidName(), isFalse);
      expect('Maria 9'.isValidName(), isFalse);
    });

    test('should return false for names with invalid special characters', () {
      expect('João@Silva'.isValidName(), isFalse);
      expect('Pedro_Souza'.isValidName(), isFalse);
      expect('Ana#Carolina'.isValidName(), isFalse);
    });

    test('should return false for names with incorrect capitalization', () {
      expect('joão da silva'.isValidName(), isFalse);
      expect('maria luíza'.isValidName(), isFalse);
      expect('Pedro DE Paula'.isValidName(), isFalse);
    });

    test('should return false for names with particles at the beginning', () {
      expect('dos Santos'.isValidName(), isFalse);
      expect('de Almeida'.isValidName(), isFalse);
    });

    test('should return false for empty or null strings', () {
      expect(''.isValidName(), isFalse);
      expect('   '.isValidName(), isFalse);
    });

    // --- Testes de Casos de Borda e Parâmetros ---
    test('should return false when minWords requirement is not met', () {
      // "Maria" tem 1 palavra, mas o teste exige no mínimo 2.
      expect('Maria'.isValidName(minWords: 2), isFalse);
    });

    test('should return true when minWords requirement is met', () {
      // "Maria Souza" tem 2 palavras, atendendo à exigência.
      expect('Maria Souza'.isValidName(minWords: 2), isTrue);
    });

    test('should return true for names with more words than the minimum', () {
      // Um nome com 4 palavras é válido para uma exigência de 2.
      expect('Ana Carolina de Jesus'.isValidName(minWords: 2), isTrue);
    });

    test('should return false for names with a single word and minWords > 1',
        () {
      expect('João'.isValidName(minWords: 2), isFalse);
    });
  });

  group('NameValidator - isValidName() with maxWords', () {
    test('should return true when word count is within the maxWords limit', () {
      // 3 palavras, maxWords 4. Válido.
      expect('Ana Carolina de Jesus'.isValidName(maxWords: 4), isTrue);
      // 2 palavras, maxWords 2. Válido.
      expect('João Pedro'.isValidName(maxWords: 2), isTrue);
      // 1 palavra, sem limite. Válido.
      expect('Maria'.isValidName(), isTrue);
    });

    test('should return false when word count exceeds the maxWords limit', () {
      // 4 palavras, maxWords 3. Inválido.
      expect('Ana Carolina de Jesus'.isValidName(maxWords: 3), isFalse);
      // 2 palavras, maxWords 1. Inválido.
      expect('João Pedro'.isValidName(maxWords: 1), isFalse);
    });

    test('should return false when minWords and maxWords are not met', () {
      // 1 palavra, minWords 2, maxWords 3. Falha no minWords.
      expect('João'.isValidName(minWords: 2, maxWords: 3), isFalse);
      // 4 palavras, minWords 2, maxWords 3. Falha no maxWords.
      expect('Ana Carolina de Jesus'.isValidName(minWords: 2, maxWords: 3),
          isFalse);
    });
  });
}
