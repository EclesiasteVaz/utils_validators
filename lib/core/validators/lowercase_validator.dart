class LowercaseValidator {
  final String text;

  LowercaseValidator({required this.text});

  bool validate() => text == text.toLowerCase();
}
