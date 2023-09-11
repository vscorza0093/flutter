import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 250, 196, 0),
          body: SizedBox(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                    child: const Icon(
                      Icons.person,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 400,
                    height: 35,
                    color: const Color(0xffEEEEEE),
                    child: Text(
                      "Informe seu email",
                      style: GoogleFonts.abel(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 104, 104, 104)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 35,
                    color: const Color(0xffEEEEEE),
                    child: Text(
                      "Informe sua senha",
                      style: GoogleFonts.abel(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 104, 104, 104)),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: 190,
                    height: 60,
                    color: const Color(0xffEEEEEE),
                    child: Text(
                      "Acessar",
                      style: GoogleFonts.abel(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: 190,
                    height: 60,
                    color: const Color(0xffEEEEEE),
                    child: Text(
                      "Nova conta",
                      style: GoogleFonts.abel(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Container()),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                      child: Text(
                    "Direitos reservados",
                    style: GoogleFonts.roboto(fontSize: 16),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
          )),
    );
  }
}
