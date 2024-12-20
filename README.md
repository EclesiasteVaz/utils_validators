# utils_validators

Um pacote Flutter e Dart abrangente para validações comuns de dados, oferecendo validadores úteis para simplificar o desenvolvimento de seus aplicativos. Ideal para formulários de cadastro, entradas de usuário e muito mais.

## Definição

Este pacote fornece um conjunto robusto de validadores para seus projetos Flutter e Dart. Ele aborda casos comuns, como validação de nomes, números de celular (inicialmente com suporte para Angola +244) e endereços de e-mail, economizando tempo e esforço no desenvolvimento.

## Features

Recursos oferecidos pelo pacote:

*   **Validação de Nomes:** Verifica se uma string corresponde a um nome válido, com opções para considerar apenas primeiro e último nome.
*   **Validação de Números de Celular:** Valida números de celular, com suporte inicial para o formato de Angola (+244).
## Migrar de 1.0.1 para 1.0.2
Foi implementada mais segurança na validação de nomes de usuários

## Getting Started

Para começar a usar o `utils_validators` em seu projeto:

1.  **Adicione a dependência:**

```bash
flutter pub add utils_validators
```

2.  **Importe o package:**

````dart
import 'package:utils_validators/utils_validators.dart';
````
## Usage

Aqui estão alguns exemplos de uso dos validadores:

### Validação de nome

```dart
import 'package:utils_validators/utils_validators.dart';

void main() {
  print(UtilsValidators.isName("Eclesiaste Vaz")); // true
  print(UtilsValidators.isName("Eclesiaste vaz")); // false (espaço extra no meio)
  print(UtilsValidators.isName("Eclesiaste Pedro Vaz")); // true
  print(UtilsValidators.isName("Eclesiaste Pedro Vaz", isFirstAndLastName: true)); // false (valida apenas primeiro e último nome)
    print(UtilsValidators.isName("Eclesiaste")); //false
}
```

### Validação de Número de Celular (Angola +244)
```dart
import 'package:utils_validators/utils_validators.dart';

void main() {
  print(UtilsValidators.isNumber("939164990")); // true
  print(UtilsValidators.isNumber("9391649900")); // false (número muito longo)
    print(UtilsValidators.isNumber("+244939164990")); //true
    print(UtilsValidators.isNumber("939 164 990")); //true
    print(UtilsValidators.isNumber("939-164-990"));// true
}```


