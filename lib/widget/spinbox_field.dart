import 'package:flutter/material.dart';

class SpinBoxField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final int flex;
  final int minValue;
  final int maxValue;

  const SpinBoxField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
    this.flex = 1,
    this.minValue = 0,
    this.maxValue = 100,
  });

  @override
  State<SpinBoxField> createState() => _SpinBoxFieldState();
}

class _SpinBoxFieldState extends State<SpinBoxField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              int value = int.parse(widget.controller.text);
              if (value > widget.minValue) {
                value--;
                widget.controller.text = value.toString();
              }
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: widget.controller,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.labelText,
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              int value = int.parse(widget.controller.text);
              if (value < widget.maxValue) {
                value++;
                widget.controller.text = value.toString();
              }
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
