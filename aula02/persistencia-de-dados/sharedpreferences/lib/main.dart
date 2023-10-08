import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:teladelogin/model/user_info_model.dart';
import 'package:teladelogin/pages/login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(UserInfoModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
