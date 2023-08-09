class WpSimpleMeleeModel {
  String name;
  String? price;
  String damage;
  int? bulk;
  int hands;
  String group;
  String weaponTraits;

  WpSimpleMeleeModel({
    required this.name,
    this.price,
    required this.damage,
    this.bulk,
    required this.hands,
    required this.group,
    required this.weaponTraits,
  });

  static WpSimpleMeleeModel fromList(List<String> wpSimpleMeleeList) {
    if (wpSimpleMeleeList.length != 7) {
      throw Exception('wpSimpleMeleeList must have 7 elements!');
    }
    return WpSimpleMeleeModel(
      name: wpSimpleMeleeList[0],
      price: wpSimpleMeleeList[1],
      damage: wpSimpleMeleeList[2],
      bulk: int.tryParse(wpSimpleMeleeList[3]) ?? 0,
      hands: int.tryParse(wpSimpleMeleeList[4]) ?? 0,
      group: wpSimpleMeleeList[5],
      weaponTraits: wpSimpleMeleeList[6],
    );
  }

  @override
  String toString() {
    return ' Weapon: $name\n'
        ' Price: $price\n'
        ' Damage: $damage\n'
        ' Bulk: $bulk\n'
        ' Hands: $hands\n'
        ' Group: $group\n'
        ' Traits: $weaponTraits';
  }
}
