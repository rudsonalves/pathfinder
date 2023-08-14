import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/ancestry_model.dart';

class AncestryRepository {
  AncestryRepository._();

  static Future<List<AncestryModel>> loadAncestryJson() async {
    String jsonFile = await rootBundle.loadString(
      'assets/tables/ancestries.json',
    );

    final jsonMap = json.decode(jsonFile);

    List<dynamic> listAncestryMaps = jsonMap['ancestries'];

    return listAncestryMaps.map((e) => AncestryModel.fromMap(e)).toList();
  }
}
