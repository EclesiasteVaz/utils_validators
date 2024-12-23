class UppercaseValidator {
  final String text;

  UppercaseValidator({required this.text});

  bool validate() => text == text.toUpperCase();
}
