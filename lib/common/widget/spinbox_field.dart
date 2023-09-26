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
  final String unit;

  const SpinBoxField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
    this.flex = 1,
    required this.minValue,
    required this.maxValue,
    required this.increment,
    this.unit = '',
  });

  @override
  State<SpinBoxField> createState() => _SpinBoxFieldState<T>();
}

class _SpinBoxFieldState<T extends num> extends State<SpinBoxField> {
  Timer? _incrementTimer;
  Timer? _decrementTimer;

  void _longDecrement() {
    _decrementTimer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        _decrement();
      },
    );
  }

  void _stopDecrement(TapUpDetails details) {
    _decrementTimer?.cancel();
  }

  void _longIncrement() {
    _incrementTimer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        _increment();
      },
    );
  }

  void _stopIncrement(TapUpDetails details) {
    _incrementTimer?.cancel();
  }

  void _decrement() {
    T value =
        num.parse(widget.controller.text.replaceAll(widget.unit, '')) as T;
    if (value > widget.minValue) {
      value = (value - widget.increment) as T;
      if (T == double) {
        widget.controller.text = '${value.toStringAsFixed(2)}${widget.unit}';
      } else {
        widget.controller.text = '${value.toString()}${widget.unit}';
      }
    }
  }

  void _increment() {
    T value =
        num.parse(widget.controller.text.replaceAll(widget.unit, '')) as T;
    if (value < widget.maxValue) {
      value = (value + widget.increment) as T;
      if (T == double) {
        widget.controller.text = '${value.toStringAsFixed(2)}${widget.unit}';
      } else {
        widget.controller.text = '${value.toString()}${widget.unit}';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Row(
        children: [
          InkWell(
            onTap: _decrement,
            onLongPress: _longDecrement,
            onTapUp: _stopDecrement,
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
            onTap: _increment,
            onLongPress: _longIncrement,
            onTapUp: _stopIncrement,
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
