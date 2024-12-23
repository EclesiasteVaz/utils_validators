import 'package:string_validator/string_validator.dart' as pckg_extern;

class EmailValidator {
  final String email;

  EmailValidator({required this.email});

  bool validate() => pckg_extern.isEmail(email);
}
