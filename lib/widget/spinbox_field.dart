import 'dart:async';

import 'package:flutter/material.dart';

class SpinBoxField<T extends num> extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final int flex;
  final T minValue;
  final T maxValue;
  final T increment;

  const SpinBoxField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
    this.flex = 1,
    required this.minValue,
    required this.maxValue,
    required this.increment,
  });

  @override
  State<SpinBoxField> createState() => _SpinBoxFieldState<T>();
}

class _SpinBoxFieldState<T extends num> extends State<SpinBoxField> {
  Timer? _incrementTimer;
  Timer? _decrementTimer;

  void _decrementValue() {
    T value = num.parse(widget.controller.text) as T;

    if (value > widget.minValue) {
      value = (value - widget.increment) as T;
      if (T == double) {
        widget.controller.text = value.toStringAsFixed(2);
      } else {
        widget.controller.text = value.toString();
      }
    } else {
      _decrementTimer?.cancel();
    }
  }

  void _incrementValue() {
    T value = num.parse(widget.controller.text) as T;

    if (value < widget.maxValue) {
      value = (value + widget.increment) as T;
      if (T == double) {
        widget.controller.text = value.toStringAsFixed(2);
      } else {
        widget.controller.text = value.toString();
      }
    } else {
      _incrementTimer?.cancel();
    }
  }

  void _longDecrementValue() {
    _decrementTimer = Timer.periodic(
      const Duration(milliseconds: 50),
      (_) {
        _decrementValue();
      },
    );
  }

  void _longIncrementValue() {
    _incrementTimer = Timer.periodic(
      const Duration(milliseconds: 50),
      (_) {
        _incrementValue();
      },
    );
  }

  void _stopDecrement(TapDownDetails details) {
    _decrementTimer?.cancel();
  }

  void _stopIncrement(TapDownDetails details) {
    _incrementTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Row(
        children: [
          InkWell(
            onTap: _decrementValue,
            onLongPress: _longDecrementValue,
            onTapDown: _stopDecrement,
            child: const Icon(Icons.arrow_back_ios),
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
          InkWell(
            onTap: _incrementValue,
            onLongPress: _longIncrementValue,
            onTapDown: _stopIncrement,
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
