import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginPage(),
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.rudaTextTheme(),
        ));
  }
}
