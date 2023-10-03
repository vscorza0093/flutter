import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teladelogin/const_variables.dart';

class NumGeneratorPage extends StatefulWidget {
  const NumGeneratorPage({super.key});

  @override
  State<NumGeneratorPage> createState() => _NumGeneratorPageState();
}

class _NumGeneratorPageState extends State<NumGeneratorPage> {
  int? generatedNumber = 0;
  int? clickQuantity = 0;
  late SharedPreferences storageInstance;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    storageInstance = await SharedPreferences.getInstance();
    setState(() {});
    generatedNumber = storageInstance.getInt(RANDOM_NUM_STORAGE_KEY);
    clickQuantity = storageInstance.getInt(CLICK_QUANTITY_KEY);
  }

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
                generatedNumber == null
                    ? 0.toString()
                    : generatedNumber.toString(),
                style: const TextStyle(fontSize: 36),
              ),
            ],
          ),
          Text(clickQuantity == null ? 0.toString() : clickQuantity.toString())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          storageInstance = await SharedPreferences.getInstance();

          Random rand = Random();
          setState(() {
            generatedNumber = rand.nextInt(9999);
            clickQuantity = (clickQuantity ?? 0) + 1;
          });
          storageInstance.setInt(RANDOM_NUM_STORAGE_KEY, generatedNumber!);
          storageInstance.setInt(CLICK_QUANTITY_KEY, clickQuantity!);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
