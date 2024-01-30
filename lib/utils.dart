import 'dart:convert';

import 'package:flutter/services.dart';

class CSCPickerUtils {
  CSCPickerUtils._();

  static List<Map<String, String>>? _translations;

  static Future<List<Map<String, String>>> getCountriesTranslations() async {
    if (_translations != null) return _translations!;

    var res = await rootBundle
        .loadString('packages/csc_picker/lib/assets/translations.json');

    final list = jsonDecode(res) as List<dynamic>;
    final listMap = list.map((e) => e as Map<String, dynamic>).toList();

    _translations = listMap.map((e) {
      return <String, String>{for (var x in e.entries) x.key: x.value as String};
    }).toList();

    return _translations!;
  }
}
