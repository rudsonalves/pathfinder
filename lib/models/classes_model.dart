// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassesModel {
  String name;
  String description;
  List<String> primary;
  List<String> secondary;

  ClassesModel({
    required this.name,
    required this.description,
    required this.primary,
    required this.secondary,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'primary': primary,
      'secondary': secondary,
    };
  }

  factory ClassesModel.fromMap(Map<String, dynamic> map) {
    return ClassesModel(
      name: map['name'] as String,
      description: map['description'] as String,
      primary: (map['primary'] as List).map((e) => e as String).toList(),
      secondary: (map['secondary'] as List).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassesModel.fromJson(String source) =>
      ClassesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassesModel(\n'
        ' name: $name,\n'
        ' description: $description,\n'
        ' primary: $primary,\n'
        ' secondary: $secondary\n'
        ')';
  }
}
