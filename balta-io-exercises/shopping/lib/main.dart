import 'package:flutter/material.dart';
import 'package:shopping/pages/tabs.page.dart';
import 'package:shopping/themes/light.theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: const DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
