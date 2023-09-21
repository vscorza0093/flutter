import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teladelogin/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: "email@email.com");
  TextEditingController passwordController = TextEditingController();

  //String? login;
  //String? password;
  bool isObscureText = false;
  bool isEmailFieldFirstTimeClicked = false;

  @override
  void initState() {
    super.initState();
    isObscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff222222),
      //backgroundColor: const Color.fromARGB(255, 60, 60, 60),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
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
                height: 30,
              ),
              Text(
                "Já tem cadastro?",
                style: GoogleFonts.roboto(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Faça seu login e make the change_",
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(left: 3, top: 2),
                color: const Color.fromARGB(255, 50, 50, 50),
                child: TextField(
                  onTap: () {
                    if (!isEmailFieldFirstTimeClicked) {
                      setState(() {
                        emailController.text = "";
                        isEmailFieldFirstTimeClicked =
                            !isEmailFieldFirstTimeClicked;
                      });
                    }
                  },
                  controller: emailController,
                  style: GoogleFonts.roboto(color: Colors.white),
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
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(left: 3, top: 2),
                color: const Color.fromARGB(255, 50, 50, 50),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: isObscureText,
                  style: GoogleFonts.roboto(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: GoogleFonts.roboto(
                        color: const Color(0xff666666), fontSize: 14),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 22,
                      color: Color(0xff151515),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromARGB(255, 141, 79, 151),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 90, 29, 151))),
                      child: Text(
                        "Entrar",
                        style: GoogleFonts.alata(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        if (emailController.text == 'v' &&
                            passwordController.text.trim() == 'v') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //         content: Text("Login efetuado com sucesso")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Email ou senha inválidos")));
                        }
                      },
                    ),
                  )),
              Expanded(child: Container()),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Criar conta",
                  style: GoogleFonts.alata(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueci minha senha",
                    style: GoogleFonts.alata(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    ));
  }
}
