import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final characterNameController = TextEditingController();
  final alignmentController = TextEditingController();
  final playerNameController = TextEditingController();
  final levelController = TextEditingController();
  final experienceController = TextEditingController();
  final deityController = TextEditingController();
  final homelandController = TextEditingController();
  final ancestryController = TextEditingController();
  final heritageController = TextEditingController();
  final classController = TextEditingController();
  final sizeController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final eyesController = TextEditingController();
  final hairController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pathfinder 2'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/PathFinder.png',
                  scale: 2,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomTextField(
                  controller: characterNameController,
                  labelText: 'Character Name',
                  hintText: "Enter your Caracter's Name",
                  flex: 2,
                ),
                const SizedBox(width: 8),
                CustomTextField(
                  controller: alignmentController,
                  labelText: 'Alignment',
                  hintText: 'True Neutral',
                ),
                const SizedBox(width: 8),
                CustomTextField(
                  controller: playerNameController,
                  labelText: "Player's Name",
                  hintText: 'Enter your Name',
                  flex: 2,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomTextField(
                  controller: levelController,
                  labelText: 'Level',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: experienceController,
                  labelText: 'Experience',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: deityController,
                  labelText: 'Deity',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: homelandController,
                  labelText: 'Homeland',
                ),
                const SizedBox(height: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(children: [
              CustomTextField(
                controller: ancestryController,
                labelText: 'Ancestry',
              ),
              const SizedBox(width: 16),
              CustomTextField(
                controller: heritageController,
                labelText: 'Heritage',
              ),
              const SizedBox(width: 16),
              CustomTextField(
                controller: classController,
                labelText: 'Class',
              ),
              const SizedBox(width: 16),
              CustomTextField(
                controller: sizeController,
                labelText: 'Size',
              ),
            ]),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomTextField(
                  controller: genderController,
                  labelText: 'Gender',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: ageController,
                  labelText: 'Age',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: heightController,
                  labelText: 'Height',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: weightController,
                  labelText: 'Weight',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: eyesController,
                  labelText: 'Eyes',
                ),
                const SizedBox(width: 16),
                CustomTextField(
                  controller: hairController,
                  labelText: 'Hair',
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    log(characterNameController.text);
                    log(alignmentController.text);
                    log(playerNameController.text);
                  },
                  child: const Text('Print'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final int flex;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
