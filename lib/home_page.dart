import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pathfinder/repository/backgound_repository.dart';

import 'models/ancestry_model.dart';
import 'models/armor_model.dart';
import 'models/classes_model.dart';
import 'models/wp_simple_melee_model.dart';
import 'models/wp_unnarmed_model.dart';
import 'repository/ancestry_repository.dart';
import 'repository/armors_repository.dart';
import 'repository/classes_repository.dart';
import 'repository/wp_simple_melee_repository.dart';
import 'repository/wp_unnarmed_repository.dart';

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

  void pressWpUnnarmedButton() async {
    final wpUnnarmedList = await WpUnnarmedRepository.loadWpUnnarmedCSV();

    for (final row in wpUnnarmedList) {
      WpUnnarmedModel weapon = WpUnnarmedModel.fromList(row);
      log(weapon.toString());
    }
  }

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
              onPressed: () async {
                final listAncestry =
                    await AncestryRepository.loadAncestryJson();

                for (AncestryModel ancestry in listAncestry) {
                  log(ancestry.toString());
                }
              },
              child: const Text('Ancestry'),
            ),
            OutlinedButton(
              onPressed: () async {
                final listClasses = await ClassesRepository.loadClassesJson();

                for (ClassesModel classe in listClasses) {
                  log(classe.toString());
                }
              },
              child: const Text('Classes'),
            ),
            TextButton(
              onPressed: () async {
                final listBackgrounds =
                    await BackgroundRepository.loadBackgroundsJson();

                for (final bg in listBackgrounds) {
                  log(bg.toString());
                }
              },
              child: const Text('Backgound'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('>>>'),
                ElevatedButton(
                  onPressed: () {},
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
