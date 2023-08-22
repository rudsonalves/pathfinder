import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/backgounds_model.dart';

class BackgroundRepository {
  BackgroundRepository._();

  static Future<List<BackgroundModel>> loadBackgroundsJson() async {
    String jsonFile = await rootBundle.loadString(
      'assets/tables/backgrounds.json',
    );

    final jsonMap = json.decode(jsonFile);

    List<dynamic> listClassesMaps = jsonMap['backgrounds'];

    return listClassesMaps.map((e) => BackgroundModel.fromMap(e)).toList();
  }
}
