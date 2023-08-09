import 'package:flutter/services.dart';

class WpSimpleMeleeRepository {
  WpSimpleMeleeRepository._();

  static Future<List<List<String>>> loadWpSimpleMeleeCSV() async {
    String csvFile =
        await rootBundle.loadString('assets/tables/weapons_simple_melee.csv');
    List<String> rows = csvFile.split('\n');

    rows.removeAt(0);
    List<List<String>> csvList = [];
    for (String row in rows) {
      csvList.add(row.split(';'));
    }

    return csvList;
  }
}
