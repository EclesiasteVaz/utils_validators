import 'package:flutter_test/flutter_test.dart';
import 'package:utils_validators/utils_validators.dart';

void main() {
  group("Testes de nome", () {
    test('vai ser válido se o nome for aceite', () {
      final result = UtilsValidators.isName("Fredh Muzua");
      expect(result, true);
    });

    test('vai ser válido se o nome não for aceite', () {
      expect(UtilsValidators.isName("Fredh  muzua"), false);
    });

    test(
        'vai ser válido se o nome for passado com  isFirstAndLastName == false',
        () {
      expect(UtilsValidators.isName("Fredh Muzua Felix"), true);
    });

    test(
        'vai ser válido se o nome for negado caso seja passado isFirstAndLastName',
        () {
      expect(
          UtilsValidators.isName("Fredh Muzua Felix", isFirstAndLastName: true),
          false);
    });

    test('vai ser valido se o nome for negado', () {
      expect(UtilsValidators.isName("José Direto 2"), false);
    });

    test('vai ser válido se um nome for aceite', () {
      expect(UtilsValidators.isName("Eclesiaste"), true);
    });

    test('vai ser inválido se o nome não não possuir número', () {
      expect(UtilsValidators.isName("José Direto 2"), false);
    });
  });

  group("Validações de números de celulares", () {
    test("Vai ser válido se o número for aceite", () {
      expect(UtilsValidators.isNumber("939164990"), true);
    });

    test("Vai ser válido se o número não for aceite", () {
      expect(UtilsValidators.isNumber("+243939164990"), false);
    });
  });

  group('validação de url', () {
    test('se for uma url valida, será valido', () {
      expect(UtilsValidators.isURL("https://google.com/"), true);
    });

    test('vai ser valido se a url for valida', () {
      expect(UtilsValidators.isURL("example.com"), true);
    });

    test("vai ser válido se a url não for valida", () {
      expect(UtilsValidators.isURL("https://example"), false);
    });
  });

  group('validações de teste de igualidade', () {
    test('vai ser valido se os textos forem iguais', () {
      expect(UtilsValidators.isEqual("Eclesiaste", "Eclesiaste"), true);
    });

    test('vai ser valido se os textos forem iguais', () {
      expect(
          UtilsValidators.isEqual("Eclesiaste", "eclesiaste",
              isCaseSentive: false),
          true);
    });
  });

  group('validação de email', () {
    test('vai ser válido se o email for valido', () {
      expect(UtilsValidators.isEmail("eclesiaste@gmail.com"), true);
    });

    test('vai ser válido se o email for invalido', () {
      expect(UtilsValidators.isEmail("eclesiaste"), false);
    });
  });

  group('Validação de BI Angolano', () {
    test('vai ser válido se o nif for valido', () {
      expect(UtilsValidators.isAngolanId('001213259CC010'), true);
    });
    test('vai ser válido se o nif for invalido', () {
      expect(UtilsValidators.isAngolanId('001213259AA010'), false);
    });
  });
}
