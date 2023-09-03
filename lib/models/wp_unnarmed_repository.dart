import 'package:flutter/services.dart';

class WpUnnarmedRepository {
  WpUnnarmedRepository._();

  static Future<List<List<String>>> loadWpUnnarmedCSV() async {
    String csvFile =
        await rootBundle.loadString('assets/tables/weapons_unnarmed.csv');
    List<String> rows = csvFile.split('\n');

    rows.removeAt(0);
    List<List<String>> csvList = [];
    for (String row in rows) {
      csvList.add(row.split(';'));
    }

    return csvList;
  }
}
