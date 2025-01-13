import 'package:string_validator/string_validator.dart' as pckg_extern;

class EmailValidator {
  final String email;

  EmailValidator({required this.email});

  /// TODO: implements a validation no dependecie of the package extern
  bool validate() => pckg_extern.isEmail(email);
}
