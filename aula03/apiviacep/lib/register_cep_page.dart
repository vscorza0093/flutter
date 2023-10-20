import 'package:apiviacep/register_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterCEPPage extends StatefulWidget {
  const RegisterCEPPage({super.key});

  @override
  State<RegisterCEPPage> createState() => _RegisterCEPPageState();
}

class _RegisterCEPPageState extends State<RegisterCEPPage> {
  RegisterCEPRepository registerCEPRepository = RegisterCEPRepository();
  TextEditingController textController = TextEditingController();

  void successMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CEP cadastrado com sucesso')));
  }

  void errorMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('CEP inválido')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        title: const Text('Cadastrar CEP'),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 80,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Insira um CEP para cadastrá-lo no sistema',
                style: GoogleFonts.roboto(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  maxLength: 8,
                  controller: textController,
                  onChanged: (value) {
                    textController.text = value;
                    setState(() {});
                  },
                  style: GoogleFonts.roboto(color: Colors.black),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff151515),
                      ),
                      hintText: "01001000",
                      hintStyle: GoogleFonts.roboto(
                          color: const Color(0xff666666), fontSize: 18)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {
                          if (textController.text.length == 8) {
                            (registerCEPRepository
                                        .postCEP(textController.text)
                                        .toString() ==
                                    '1')
                                ? errorMessage(context)
                                : successMessage(context);
                          }
                        },
                        child: Text(
                          'Cadastrar',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
