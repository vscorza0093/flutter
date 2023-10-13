import 'package:flutter/material.dart';

class BorderTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const BorderTextField(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      controller: controller,
    );
  }
}
