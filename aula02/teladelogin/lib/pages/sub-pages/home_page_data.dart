import 'package:flutter/material.dart';

class DataSubPage extends StatelessWidget {
  const DataSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Data"),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 111, 134),
      ),
    );
  }
}
