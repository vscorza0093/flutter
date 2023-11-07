import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: const Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            search(),
          ],
        ),
      ),
    );
  }
}

Widget search() {
  return Container(
    height: 60,
    padding: const EdgeInsets.only(
      left: 20,
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
      borderRadius: const BorderRadius.all(
        Radius.circular(128),
      ),
    ),
    child: Row(
      children: [
        const Icon(Icons.search),
        Container(
          padding: const EdgeInsets.all(10),
          width: 300,
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Search...",
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
