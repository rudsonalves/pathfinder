import 'package:flutter/services.dart';

class ArmorsRepository {
  ArmorsRepository._(); // esta classe não pode mais ser instanciada em um objeto

  static Future<List<List<String>>> loadArmorsCSV() async {
    String csvFile = await rootBundle.loadString('assets/tables/armor.csv');
    List<String> rows = csvFile.split('\n');

    rows.removeAt(0);
    List<List<String>> csvList = [];
    for (String row in rows) {
      csvList.add(row.split(';'));
    }

    return csvList;
  }
}
