import 'package:flutter/material.dart';

class CallendarTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CallendarTextField(
      {super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onTap: () async {
          var userBirth = await showDatePicker(
            context: context,
            initialDate: DateTime(2000, 1, 1),
            firstDate: DateTime(1900, 1, 1),
            lastDate: DateTime.now(),
          );
          (userBirth != null)
              ? controller.text = userBirth.toString()
              : controller.text = controller.text;
        },
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ));
  }
}
