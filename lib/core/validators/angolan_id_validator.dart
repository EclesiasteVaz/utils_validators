class AngolanIdValidator {
  bool validate({required String value}) {
    if (value.isEmpty) {
      return false;
    }

    final regex = RegExp(r'^\d{9}([A-Z]{2})\d{3}$');

    const validProvinces = [
      'BL',
      'BG',
      'BI',
      'CB',
      'CC',
      'CU',
      'HU',
      'HD',
      'KN',
      'KS',
      'LU',
      'LB',
      'LS',
      'ML',
      'MO',
      'NA',
      'UI',
      'ZA'
    ];

    if (!regex.hasMatch(value)) {
      return false;
    }

    final provinceCode = regex.firstMatch(value)!.group(1);

    return validProvinces.contains(provinceCode);
  }
}
