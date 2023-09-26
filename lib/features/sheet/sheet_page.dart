import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/constants/constants.dart';
import '../../common/widget/custom_dropdown_form_field.dart';
import '../../common/widget/custom_text_field.dart';
import '../../common/widget/spinbox_field.dart';
import 'sheet_controller.dart';
import 'sheet_state.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
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

  final _controller = SheetController();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

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
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                // Sheet State Loading
                if (_controller.state is SheetStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Sheet State Success
                if (_controller.state is SheetStateSuccess) {
                  final ancestryNames = _controller.ancestryList
                      .map((elment) => elment.name)
                      .toList();

                  final classesNames = _controller.classesList
                      .map((element) => element.name)
                      .toList();

                  print(classesNames);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomTextField(
                            controller: characterNameController,
                            labelText: 'Character Name',
                            hintText: "Enter your Caracter's Name",
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          CustomDropdownFormField(
                            controller: alignmentController,
                            labelText: 'Alignment',
                            hintText: 'Select',
                            items: alignmentList,
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
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SpinBoxField(
                            initialValue: 1,
                            controller: levelController,
                            labelText: 'Level',
                            minValue: 1,
                            maxValue: 20,
                            increment: 1,
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
                      Row(
                        children: [
                          CustomDropdownFormField(
                            controller: ancestryController,
                            labelText: 'Ancestry',
                            hintText: 'Select',
                            items: ancestryNames,
                          ),
                          const SizedBox(width: 16),
                          CustomTextField(
                            controller: heritageController,
                            labelText: 'Heritage',
                          ),
                          const SizedBox(width: 16),
                          CustomDropdownFormField(
                            controller: classController,
                            labelText: 'Class',
                            hintText: 'Select',
                            items: classesNames,
                          ),
                          const SizedBox(width: 16),
                          CustomTextField(
                            controller: sizeController,
                            labelText: 'Size',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CustomTextField(
                            controller: genderController,
                            labelText: 'Gender',
                          ),
                          const SizedBox(width: 16),
                          SpinBoxField(
                            initialValue: 18,
                            minValue: 15,
                            maxValue: 65,
                            increment: 1,
                            controller: ageController,
                            labelText: 'Age',
                          ),
                          const SizedBox(width: 16),
                          SpinBoxField(
                            initialValue: 1.60,
                            minValue: .50,
                            maxValue: 2.70,
                            increment: .01,
                            controller: heightController,
                            labelText: 'Height',
                            unit: 'm',
                          ),
                          const SizedBox(width: 16),
                          SpinBoxField(
                            initialValue: 70,
                            minValue: 50,
                            maxValue: 180,
                            increment: 2,
                            controller: weightController,
                            labelText: 'Weight',
                            unit: 'kg',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
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
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              log(characterNameController.text);
                              log(playerNameController.text);
                              log(alignmentController.text);
                            },
                            child: const Text('Print'),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                // Sheet State Error
                return const Center(child: Text('Error!!!'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
