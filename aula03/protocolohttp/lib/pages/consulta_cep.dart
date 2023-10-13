import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:protocolohttp/model/via_cep_model.dart';
import 'package:protocolohttp/repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  TextEditingController cepController = TextEditingController(text: '');
  String endereco = '';
  String cidade = '';
  String estado = '';
  bool loading = false;
  ViaCEPModel viaCEPModel = ViaCEPModel();
  ViaCEPRepository viaCEPRepository = ViaCEPRepository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                'Consulta de CEP',
                style: GoogleFonts.alata(fontSize: 20),
              ),
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                onChanged: (String value) async {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  debugPrint(cep);
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    viaCEPModel = await viaCEPRepository.consultCEP(cep);
                  }
                  setState(() {
                    loading = false;
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                viaCEPModel.logradouro ?? 'Logradouro',
                style: GoogleFonts.alata(fontSize: 20),
              ),
              Text(
                '${viaCEPModel.localidade ?? 'Cidade'} - ${viaCEPModel.uf ?? 'Estado'}',
                style: GoogleFonts.alata(fontSize: 20),
              ),
              Visibility(
                visible: loading,
                child: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: () async {}),
      ),
    );
  }
}
