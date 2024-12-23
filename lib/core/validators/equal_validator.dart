class EqualValidator {
  final String text;
  final String toEqual;
  final bool isCaseSentive;
  EqualValidator(
      {required this.text, required this.toEqual, this.isCaseSentive = true});

  bool validate() => !isCaseSentive
      ? text.toLowerCase() == toEqual.toLowerCase()
      : text == toEqual;
}
