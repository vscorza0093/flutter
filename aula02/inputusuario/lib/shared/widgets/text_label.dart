import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  const TextLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
