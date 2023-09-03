import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/background_model.dart';

class BackgroundRepository {
  BackgroundRepository._();

  static Future<List<BackgroundModel>> loadBackgroungJson() async {
    String jsonFile = await rootBundle.loadString(
      'assets/tables/backgrounds.json',
    );

    final jsonMap = json.decode(jsonFile);

    List<dynamic> listBackgroundMaps = jsonMap['backgrounds'];

    return listBackgroundMaps.map((e) => BackgroundModel.fromMap(e)).toList();
  }
}
