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

  @override
  String toString() {
    return 'ClassesModel(\n'
        ' name: $name\n'
        ' description: $description\n'
        ' primary: $primary\n'
        ' secondary: $secondary\n'
        ')';
  }

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
      primary:
          (map['primary'] as List<dynamic>).map((e) => e as String).toList(),
      secondary:
          (map['secondary'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassesModel.fromJson(String source) {
    Map<String, dynamic> map = json.decode(source) as Map<String, dynamic>;
    return ClassesModel.fromMap(map);
  }
}
