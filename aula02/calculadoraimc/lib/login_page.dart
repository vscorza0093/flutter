import 'package:calculadoraimc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Página de Login',
                        style: GoogleFonts.alata(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cadastre-se ou entre como visitante',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // TextField Email
                  Container(
                    width: double.infinity,
                    height: 35,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.only(left: 3, top: 2),
                    child: TextField(
                      style: GoogleFonts.roboto(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xff151515),
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.roboto(
                              color: const Color(0xff666666), fontSize: 14)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TextField Senha
                  Container(
                    width: double.infinity,
                    height: 35,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.only(left: 3, top: 2),
                    child: TextField(
                      obscureText: isObscureText,
                      style: GoogleFonts.roboto(color: Colors.black),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff151515),
                          ),
                          hintText: "Senha",
                          hintStyle: GoogleFonts.roboto(
                              color: const Color(0xff666666), fontSize: 14)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // TextButton 'Entrar'
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Text('Entrar',
                            style: GoogleFonts.alata(
                                color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TextButton 'Criar Conta'
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Criar conta',
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text("Direitos reservados"),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
