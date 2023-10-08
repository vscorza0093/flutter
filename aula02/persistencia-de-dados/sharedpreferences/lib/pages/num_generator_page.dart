import 'dart:math';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:teladelogin/const_variables.dart';

class NumGeneratorPage extends StatefulWidget {
  const NumGeneratorPage({super.key});

  @override
  State<NumGeneratorPage> createState() => _NumGeneratorPageState();
}

class _NumGeneratorPageState extends State<NumGeneratorPage> {
  int? generatedNumber = 0;
  int? clickQuantity = 0;
  late Box boxRandomNumbers;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    if (Hive.isBoxOpen('box_random_numbers')) {
      boxRandomNumbers = Hive.box('box_random_numbers');
    } else {
      boxRandomNumbers = await Hive.openBox('box_random_numbers');
    }

    generatedNumber = boxRandomNumbers.get(RANDOM_NUM_STORAGE_KEY);
    clickQuantity = boxRandomNumbers.get(CLICK_QUANTITY_KEY);

    setState(() {});
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
          Random rand = Random();
          setState(() {
            generatedNumber = rand.nextInt(9999);
            clickQuantity = (clickQuantity ?? 0) + 1;
          });
          boxRandomNumbers.put(RANDOM_NUM_STORAGE_KEY, generatedNumber);
          boxRandomNumbers.put(CLICK_QUANTITY_KEY, clickQuantity);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
