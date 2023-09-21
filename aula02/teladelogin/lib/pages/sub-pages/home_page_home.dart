import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/login_page.dart';

class HomeSubPage extends StatelessWidget {
  const HomeSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Container(
          color: Colors.blueGrey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(child: Container()),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 90, 29, 151))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text(
                "Logout",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
