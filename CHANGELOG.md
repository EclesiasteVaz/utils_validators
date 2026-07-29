# 1.2.3
Melhorias na validação de e-mail, caracteres e nomes, com correção de bugs no NameValidator.
- Correção: suporte a TLDs longos no EmailValidator (ex: .agency, .photography)
- Correção: EmailValidator agora aceita '+' no local part (ex: user+tag@example.com)
- Correção: CharacterValidator agora suporta letras acentuadas (Unicode)
- Correção: NameValidator agora suporta caracteres Unicode e partículas capitalizadas no início
- Correção: NameValidator não remove mais partículas antes de contar palavras
- Correção: UrlValidator agora valida porta dentro do range válido (0-65535)
- Correção: DateTimeValidator agora rejeita anos com mais de 4 dígitos e anos negativos
- Correção: EqualValidator agora tem tipo String explícito no parâmetro toText
- Correção: CharacterValidator não lança mais exceção para enum desconhecido
- Correção: lowercase_validator_example.dart agora mostra o exemplo correto
- Novo: Testes para UppercaseValidator, CharacterValidator, EqualValidator (Flutter API)
- Novo: Testes para UppercaseValidatorExtension

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
