# Aula 05 - Map, List, Class e Json

```
main() {
  List<String> numerosStr = ['1', '2', '3', '5', '7'];
  
//   print(numerosStr);
  
  List<int> numeros = [];
  
  for (String element in numerosStr) {
    numeros.add(int.parse(element));
  }
  
  print(numeros);
  
  int sum = 0;
  for (int element in numeros) {
    sum += element;
  }
  
  print(sum);
}
```

```
main() {
  List<String> numerosStr = ['1', '2', '3', '5', '7'];
  
//   print(numerosStr);
  
  List<int> numeros = [];
  
//   for (String element in numerosStr) {
//     numeros.add(int.parse(element));
//   }
  numeros = numerosStr.map(
    (element) => int.parse(element),
  ).toList();
  
  print(numeros);
  
//   int sum = 0;
//   for (int element in numeros) {
//     sum += element;
//   }
  
  int sum = numeros.fold(0, (a, b) => a + b);
  
  print(sum);
}

```

``` 
class Person{
  String name;
  int age;
  double weight;
  
  Person(this.name, this.age, this.weight);
  
  @override
  String toString() {
    return 'Person(name: $name; age: $age; weight: $weight)';
  }
}

main() {
  Map<String, dynamic> map = {
    'name': 'Gabriel',
    'age': 27,
    'weight': 67.32,
  };
  
//   Person p0 = Person('Rudson', 56, 82.23);
 
  print(map['age']);
  
  map['like'] = ['Games', 'Food', 'Watch movies'];
  
  map['name'] = 'Gabriel Bortolini';
  
  print(map);
//   print(p0);
}
```

```
class Person{
  String name;
  int age;
  double weight;
  
  Person({
    required this.name, 
    required this.age, 
    required this.weight,
  });
  
  @override
  String toString() {
    return 'Person(name: $name; age: $age; weight: $weight)';
  }
  
  void fromMap(Map<String, dynamic> map) {
    name = map['name'] as String;
    age = map['age'] as int;
    weight = map['weight'] as double;
  }
} 

main() {
  Map<String, dynamic> map = {
    'name': 'Gabriel',
    'age': 27,
    'weight': 67.32,
  };
  
  Person p0 = Person(
    name: 'Rudson', 
    age: 56, 
    weight: 82.23,
  );
  
  map['name'] = 'Gabriel Bortolini';
  
  Person p1 = Person(
    name: '',
    age: 0,
    weight: 0.0,
  );
  
  p1.fromMap(map);
  
  print(map);
  print(p0);
  print(p1);
}
```

```
class Person{
  String name;
  int age;
  double weight;
  
  Person({
    required this.name, 
    required this.age, 
    required this.weight,
  });
  
  @override
  String toString() {
    return 'Person(name: $name; age: $age; weight: $weight)';
  }
  
  // Método da classe e não do objeto
  static Person fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      age: map['age'] as int,
      weight: map['weight'] as double,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
    };
  }
} 

main() {
  Map<String, dynamic> map = {
    'name': 'Gabriel',
    'age': 27,
    'weight': 67.32,
  };
  
  Person p0 = Person(
    name: 'Rudson', 
    age: 56, 
    weight: 82.23,
  );
  
  map['name'] = 'Gabriel Bortolini';
  
  Person p1 = Person.fromMap(map);

  print(map);
  print(p0);
  print(p1);
  print(p1.toMap());
}
```

```
import 'dart:convert';

class Person{
  String name;
  int age;
  double weight;
  
  Person({
    required this.name, 
    required this.age, 
    required this.weight,
  });
  
  @override
  String toString() {
    return 'Person(name: $name; age: $age; weight: $weight)';
  }
  
  // Método da classe e não do objeto
  static Person fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      age: map['age'] as int,
      weight: map['weight'] as double,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
    };
  }
  
  static Person fromJson(String jsonString) {
    final map = json.decode(jsonString);
    return fromMap(map);
  }
  
  String toJson() {
    return json.encode(toMap());
  }
} 

main() {
  String jsonStr = '{"name":"Gabriel","age":27,"weight":67.32}';
  
  Person p0 = Person.fromJson(jsonStr);
  
  print(p0);
  print(p0.toJson());
  
}
```