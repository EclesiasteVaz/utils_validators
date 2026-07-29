# 2.0.1

## Correções
- CI: substituído `dart-lang/setup-dart` por `subosito/flutter-action` para resolver dependência do Flutter SDK

---

# 2.0.0

## 🚨 Breaking Changes

### 1. `EqualValidator.validate()` — parâmetro `toText` agora é `String`
Antes aceitava `dynamic`, agora só `String`. Código que passava não-`String` não compila mais.

### 2. `isValidEmail()` — rejeita local part começando com ponto
`".test@example.com"` agora retorna `false`. Antes retornava `true`.

### 3. `isValidDateTime()` — rejeita anos com >4 dígitos e anos negativos
`"12345-01-01"` e `"-2023-01-01"` agora retornam `false`. Antes retornavam `true`.

### 4. `isValidUrl()` — rejeita portas fora do range 0-65535
`"http://example.com:70000"` agora retorna `false`. Antes retornava `true`.

---

## Melhorias
- Suporte a TLDs longos no EmailValidator (ex: .agency, .photography)
- EmailValidator agora aceita '+' no local part (ex: user+tag@example.com)
- CharacterValidator agora suporta letras acentuadas (Unicode)
- NameValidator agora suporta caracteres Unicode e partículas capitalizadas no início
- `minWords` e `maxWords` no NameValidator contam apenas palavras significativas
- UrlValidator agora valida porta dentro do range válido (0-65535)
- DateTimeValidator agora rejeita anos com mais de 4 dígitos e anos negativos
- CharacterValidator não lança mais exceção para enum desconhecido

## Correções
- EqualValidator: parâmetro `toText` agora tem tipo `String` explícito
- Exemplo `lowercase_validator_example.dart` mostrava `equals()` em vez de `isLowercase()`
- Removido `// main.dart` stray comment no `angola_id_validator_example.dart`
- Testes corrigidos: descrições refletem corretamente as asserções (null/String)
- Partículas no início do nome (`Dos Santos`) agora são validadas corretamente

## Novos testes
- UppercaseValidator, CharacterValidator, EqualValidator (Flutter API)
- UppercaseValidatorExtension

## 1.2.2
Melhorado ainda mais a validação de nomes.

## 1.2.1
Nova API fácil de conexão com os TextField do flutter trazendo um função que retorna String? facilitando a coneão e menos códigos

## 1.2.0
Nova Arquitetura: Todos os validadores foram transformados em extensões de String, proporcionando uma API mais fluida e intuitiva (ex: 'email'.isValidEmail()).

Melhoria: Documentação e exemplos de código aprimorados para uma melhor clareza e experiência do desenvolvedor, seguindo um padrão de documentação de alto nível.

Melhoria: Aprimorada a validação de datas e horas para ser mais robusta, seguindo estritamente o padrão ISO 8601 e corrigindo o problema de "date rollovers".

Melhoria: Aprimorada a validação de números de telefone para ser mais precisa, garantindo a correta aceitação de formatos angolanos.

Nova Funcionalidade: Adicionado o AngolanIdValidator para validação de Bilhetes de Identidade angolanos.

Nova Funcionalidade: Adicionados os validadores CharacterValidator e DateTimeValidator para verificação de caracteres e datas.

Melhoria: Aprimorada a validação de URLs para um suporte mais abrangente e robusto a diferentes formatos, incluindo URLs locais e com portas.

Melhoria: Corrigidos erros nos validadores de e-mail e JSON, tornando a validação mais precisa.

Melhoria: Aprimorado o validador de nome para ser mais seguro e flexível.

## 1.1.2

Melhorado a validação de números de telefone

## 1.1.1

chegada do angola id validation

## 1.1.0

Aumentado mais validators e corrigidos erros

## 1.0.3

Melhorado a segurança na validação de nome

## 1.0.2

Melhoria na validação de nome

## 1.0.0

Versão estabilizada

## 0.0.1

Fase inicial
