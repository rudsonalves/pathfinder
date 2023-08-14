Aula 05: Interligando Map, Json e Class

```
import 'dart:convert';

class Person{
  String name;
  int age;
  List<String>? like;
  
  Person({
    required this.name, 
    required this.age,
    this.like,
  });
  
  @override
  String toString() {
    return 'Person(name: $name, age: $age, like: $like)';
  }
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'like': ['Games', 'Cook food', 'Watch movies'],
    };
  }
  
  void fromMap(Map<String, dynamic> map) {
    name= map['name'] as String;
    age= map['age'] as int;
    like= (map['like'] as List<dynamic>).map((element)=> element as String).toList();
  }
  
  void fromJson(String jsonStr) {
    final map = json.decode(jsonStr);
    fromMap(map);
  }
  
  String toJson() {
    return json.encode(toMap());
  }
}

main() {
  Person p0 = Person(
    name: 'Rudson', 
    age: 56,
  );
  
  Map<String, dynamic> map = {
    'name': 'Gabriel',
    'age': 28,
    'like': ['Games', 'Cook food', 'Watch movies']
  };
  
  print(p0);
  print(map);
  
  final mapP0 = p0.toMap();
  print(mapP0);
  
  print(p0.name);
  print(mapP0['name']);
  
  print(map['title']);
  // map['title'] = 'Programador Jr';
  
  String jsonStr = json.encode(map);
  
  Map<String, dynamic> jsonMap = json.decode(jsonStr);
  
  print(jsonMap);
  print(jsonStr);
  print(p0.toJson());
  
  print(jsonMap['name']);
}
```
