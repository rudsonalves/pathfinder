import 'dart:convert';

class AncestryModel {
  String name;
  String description;
  List<String> boosts;
  String? flaw;

  AncestryModel({
    required this.name,
    required this.description,
    required this.boosts,
    this.flaw,
  });

  @override
  String toString() {
    return 'AncestryModel(\n'
        ' name: $name\n'
        ' description: $description'
        ' boots: $boosts\n'
        ' flaw: $flaw\n'
        ')';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'boots': boosts,
      'flaw': flaw,
    };
  }

  static AncestryModel fromMap(Map<String, dynamic> map) {
    return AncestryModel(
      name: map['name'] as String,
      description: map['description'] as String,
      boosts: (map['boosts'] as List).map((e) => e as String).toList(),
      flaw: map['flaw'] != null ? map['flaw'] as String : null,
    );
  }

  static AncestryModel fromJson(String jsonString) {
    final map = json.decode(jsonString);

    return fromMap(map);
  }

  String toJson() {
    final map = toMap();
    return json.encode(map);
  }
}
