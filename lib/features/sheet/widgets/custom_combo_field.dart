import 'package:flutter/material.dart';

class CustomComboField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final int flex;
  final List<String> items;

  const CustomComboField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.flex = 1,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: DropdownButtonFormField(
        alignment: Alignment.center,
        items: items
            .map(
              (element) => DropdownMenuItem(
                value: element,
                child: Text(element),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null && controller != null) {
            controller!.text = value;
          }
        },
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
