import 'dart:convert';

class BackgroundModel {
  String name;
  String description;
  List<dynamic> boosts;
  List<String> trained;
  List<String> feat;

  BackgroundModel({
    required this.name,
    required this.description,
    required this.boosts,
    required this.trained,
    required this.feat,
  });

  @override
  String toString() {
    return 'BackgroundModel(\n'
        ' name: $name,\n'
        ' description: $description,\n'
        ' boosts: $boosts,\n'
        ' trained: $trained,\n'
        ' feat: $feat\n'
        ')';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'boosts': boosts,
      'trained': trained,
      'feat': feat,
    };
  }

  factory BackgroundModel.fromMap(Map<String, dynamic> map) {
    return BackgroundModel(
      name: map['name'] as String,
      description: map['description'] as String,
      boosts: List<dynamic>.from(
        (map['boosts'] as List<dynamic>).map(
          (element) {
            if (element is List) {
              return element.map((e) => e as String).toList();
            } else {
              return element as String;
            }
          },
        ),
      ),
      trained: List<String>.from((map['trained'] as List<dynamic>)
          .map((element) => element as String)),
      feat: List<String>.from(
          (map['feat'] as List<dynamic>).map((element) => element as String)),
    );
  }

  String toJson() => json.encode(toMap());

  factory BackgroundModel.fromJson(String source) =>
      BackgroundModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
