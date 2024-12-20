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

    test('vai ser valido se o nom for negado', () {
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
}
