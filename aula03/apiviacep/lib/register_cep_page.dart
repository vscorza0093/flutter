import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterCEPPage extends StatelessWidget {
  const RegisterCEPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        title: const Text('Cadastrar CEP'),
      ),
      body: Container(
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
                onTap: () {},
                style: GoogleFonts.roboto(color: Colors.black),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff151515),
                    ),
                    hintText: "00101000",
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
                      onPressed: () {},
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
    );
  }
}
