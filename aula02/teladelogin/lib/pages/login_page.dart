import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromARGB(255, 60, 60, 60),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png",
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Já tem cadastro?",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Faça seu login e make the change_",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              color: const Color.fromARGB(255, 50, 50, 50),
              width: 380,
              height: 35,
              child: const Text(
                "Insira seu email",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color.fromARGB(255, 50, 50, 50),
              width: 380,
              height: 35,
              child: const Text(
                "Insira sua senha",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: const Color.fromARGB(255, 138, 0, 169),
              width: 160,
              height: 50,
              padding: const EdgeInsets.all(14),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(child: Container()),
            const Text(
              "Criar conta",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Esqueci minha senha",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    ));
  }
}
