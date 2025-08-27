part of '../../utils_validators.dart';

/// An extension on [String] that provides a utility method for date and time validation.
extension DateTimeValidator on String {
  /// Checks if the string can be parsed into a valid [DateTime] object
  /// according to the full ISO 8601 standard.
  ///
  /// This method uses a robust regular expression to match various ISO 8601 formats,
  /// including dates, dates with time, and dates with timezone offsets or UTC.
  /// It then confirms the validity using `DateTime.tryParse`.
  ///
  /// Returns `true` if the string is a valid ISO 8601 date-time format, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// '2023-10-27'.isValidDateTime(); // returns true
  /// '2023-10-27T10:30:00Z'.isValidDateTime(); // returns true
  /// '2023-10-27 10:30:00'.isValidDateTime(); // returns true
  /// '2023-13-01'.isValidDateTime(); // returns false (invalid month)
  /// ```
  bool isValidDateTime() {
    if (isEmpty) {
      return false;
    }

    // This regex covers most common ISO 8601 formats.
    const pattern = r'^(-?(?:[1-9][0-9]*)?[0-9]{4})' // Ano
        r'(-?(?:1[0-2]|0[1-9]))' // Mês
        r'(-?(?:3[01]|0[1-9]|[12][0-9]))' // Dia
        r'(?:T| )?' // Separador de tempo opcional 'T' ou um espaço
        r'(?:(?:[01]?[0-9]|2[0-3]))?' // Hora opcional
        r'(?::?[0-5]?[0-9])?' // Minuto opcional
        r'(?::?[0-5]?[0-9])?' // Segundo opcional
        r'(?:[.,]?[0-9]+)?' // Milissegundos/microssegundos opcionais
        r'(?:Z|[+-][01]?[0-9]:?[0-5]?[0-9])?$'; // Fuso horário opcional

    final regex = RegExp(pattern);

    if (!regex.hasMatch(this)) {
      return false;
    }

    // A validação final com tryParse garante que datas como 2023-02-30 sejam rejeitadas.
    return DateTime.tryParse(this) != null;
  }
}
