class WpUnnarmedModel {
  String name;
  String? price;
  String damage;
  int? bulk;
  int hands;
  String group;
  String weaponTraits;

  WpUnnarmedModel({
    required this.name,
    this.price,
    required this.damage,
    this.bulk,
    required this.hands,
    required this.group,
    required this.weaponTraits,
  });

  static WpUnnarmedModel fromList(List<String> wpUnnarmedList) {
    if (wpUnnarmedList.length != 7) {
      throw Exception('wpUnnarmedList must have 7 elements!');
    }
    return WpUnnarmedModel(
      name: wpUnnarmedList[0],
      price: wpUnnarmedList[1],
      damage: wpUnnarmedList[2],
      bulk: int.tryParse(wpUnnarmedList[3]) ?? 0,
      hands: int.tryParse(wpUnnarmedList[4]) ?? 0,
      group: wpUnnarmedList[5],
      weaponTraits: wpUnnarmedList[6],
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
