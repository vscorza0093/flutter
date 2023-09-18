import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String pageTitle;
  const UserInfo({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: const Center(child: Text("Informações do usuário")),
    );
  }
}
