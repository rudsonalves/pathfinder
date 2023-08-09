import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pathfinder/models/armor_model.dart';
import 'package:pathfinder/models/classes_model.dart';

import 'models/wp_simple_melee_model.dart';
import 'repository/armors_repository.dart';
import 'repository/classes_repository.dart';
import 'repository/wp_simple_melee_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void armorButton() async {
    final armorsList = await ArmorsRepository.loadArmorsCSV();

    for (final row in armorsList) {
      ArmorModel armor = ArmorModel.fromList(row);
      log(armor.toString());
    }
  }

  // void pressWpUnnarmedButton() async {
  //   final wpUnnarmedList = await WpUnnarmedRepository.loadWpUnnarmedCSV();

  //   for (final row in wpUnnarmedList) {
  //     WpUnnarmedModel weapon = WpUnnarmedModel.fromList(row);
  //     log(weapon.toString());
  //   }
  // }

  void pressWpSimpleMeleeButton() async {
    final wpSimpleMeleeList =
        await WpSimpleMeleeRepository.loadWpSimpleMeleeCSV();

    for (final row in wpSimpleMeleeList) {
      WpSimpleMeleeModel weapon = WpSimpleMeleeModel.fromList(row);
      log(weapon.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pathfinder'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('filho 0'),
            const Text('filho 1'),
            const Text('filho 2'),
            ElevatedButton(
              onPressed: armorButton,
              child: const Text('Armors'),
            ),
            OutlinedButton(
              onPressed: armorButton,
              child: const Text('Botão 02'),
            ),
            TextButton(
              onPressed: pressWpSimpleMeleeButton,
              child: const Text('Botão 03'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('>>>'),
                ElevatedButton(
                  onPressed: () async {
                    final listMaps = await ClassesRepository.loadArmorsJson();

                    for (final map in listMaps) {
                      final classModel = ClassesModel.fromMap(map);
                      log(classModel.toString());
                    }
                  },
                  child: const Text('Botão 04'),
                ),
                const Text('<<<'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
