import 'package:flutter/material.dart';

class HomePageSub3 extends StatelessWidget {
  const HomePageSub3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Sub Page 3")),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}
