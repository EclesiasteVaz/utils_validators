import 'package:string_validator/string_validator.dart' as pckg_extern;

class UrlValidator {
  final String url;

  UrlValidator({required this.url});

  bool validate() => pckg_extern.isURL(url);
}
