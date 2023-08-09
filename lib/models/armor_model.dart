class ArmorModel {
  String name;
  String armorProficiency;
  String? price;
  int acBonus;
  int? dexCap;
  int? checkPenalty;
  String? speedPenalty;
  int? strenght;
  String? bulk;
  String? group;
  String? armorTraits;

  ArmorModel({
    required this.name,
    required this.armorProficiency,
    this.price,
    required this.acBonus,
    this.dexCap,
    this.checkPenalty,
    this.speedPenalty,
    this.strenght,
    this.bulk,
    this.group,
    this.armorTraits,
  });

  static ArmorModel fromList(List<String> armorList) {
    if (armorList.length != 11) {
      throw Exception('armorList deve possuir 11 elementos!');
    }

    return ArmorModel(
      name: armorList[0],
      armorProficiency: armorList[1],
      price: armorList[2],
      acBonus: int.tryParse(armorList[3]) ?? 0,
      dexCap: int.tryParse(armorList[4]),
      checkPenalty: int.tryParse(armorList[5]),
      speedPenalty: armorList[6],
      strenght: int.tryParse(armorList[7]),
      bulk: armorList[8],
      group: armorList[9],
      armorTraits: armorList[10],
    );
  }

  @override
  String toString() {
    return 'Armor: $name\n'
        ' Proficiency: $armorProficiency\n'
        ' Price: $price\n'
        ' DexCap: $dexCap\n'
        ' Check penalty: $checkPenalty\n'
        ' Speed penalty: $speedPenalty\n'
        ' Strenght: $strenght\n'
        ' Bulk: $bulk\n'
        ' Group: $group\n'
        ' Armor traits: $armorTraits';
  }
}
