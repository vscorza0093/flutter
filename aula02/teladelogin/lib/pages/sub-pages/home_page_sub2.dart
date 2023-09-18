import 'package:flutter/material.dart';

class HomePageSub2 extends StatelessWidget {
  const HomePageSub2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sub Page 2"),
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
