import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Página inicial"),
        ),
        backgroundColor: const Color(0xff151515),
        body: SingleChildScrollView(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Text(
                "Meu nome é Alexandre Natale",
                style: GoogleFonts.roboto(
                    fontSize: 20, color: const Color(0xffffffff)),
              ),
            ),
            Expanded(child: Container()),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 90, 29, 151))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Text(
                  "Logout",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
