import 'package:flutter/material.dart';

class DevicesSubPage extends StatelessWidget {
  const DevicesSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Devices")),
        backgroundColor: const Color.fromARGB(255, 0, 68, 255),
      ),
    );
  }
}
