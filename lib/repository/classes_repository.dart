// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';

class ClassesRepository {
  ClassesRepository._();

  static Future<List<dynamic>> loadArmorsJson() async {
    String jsonFile = await rootBundle.loadString('assets/tables/classes.json');

    final parsedJson = json.decode(jsonFile);

    return parsedJson['classes'] as List<dynamic>;
  }
}
