import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumGeneratorPage extends StatefulWidget {
  const NumGeneratorPage({super.key});

  @override
  State<NumGeneratorPage> createState() => _NumGeneratorPageState();
}

class _NumGeneratorPageState extends State<NumGeneratorPage> {
  int generatedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Gerador de números"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                generatedNumber.toString(),
                style: const TextStyle(fontSize: 36),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final SharedPreferences storageInstance =
              await SharedPreferences.getInstance();

          Random rand = Random();
          setState(() {
            generatedNumber = rand.nextInt(9999);
          });
          await storageInstance.setInt('random_number', generatedNumber);

          int? num = storageInstance.getInt('random_number');

          debugPrint("$num");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
