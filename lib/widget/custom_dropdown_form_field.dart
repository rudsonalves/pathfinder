import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final int flex;
  final List<String> items;

  const CustomDropdownFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.flex = 1,
    required this.items,
  });

  List<DropdownMenuItem<String>> itemsDropdownMenu() {
    return items
        .map(
          (element) => DropdownMenuItem(
            value: element,
            child: Text(element),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: DropdownButtonFormField(
        alignment: Alignment.center,
        items: itemsDropdownMenu(),
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
        onChanged: (value) {
          if (value != null && controller != null) {
            controller!.text = value;
          }
        },
      ),
    );
  }
}
