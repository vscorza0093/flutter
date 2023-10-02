import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final String message;
  const AlertMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(child: Text(message));
  }
}
