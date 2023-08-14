import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/classes_model.dart';

class ClassesRepository {
  ClassesRepository._();

  static Future<List<ClassesModel>> loadClassesJson() async {
    String jsonFile = await rootBundle.loadString(
      'assets/tables/classes.json',
    );

    final jsonMap = json.decode(jsonFile);

    List<dynamic> listClassesMaps = jsonMap['classes'];

    return listClassesMaps.map((e) => ClassesModel.fromMap(e)).toList();
  }
}
