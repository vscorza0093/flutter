import 'package:apiviacep/register_cep_model.dart';
import 'package:apiviacep/register_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCEPPage extends StatefulWidget {
  const ListCEPPage({super.key});

  @override
  State<ListCEPPage> createState() => _ListCEPPageState();
}

class _ListCEPPageState extends State<ListCEPPage> {
  bool loading = false;
  var cepList = RegisterCEPModel([]);
  var registerCEPRepository = RegisterCEPRepository();

  @override
  void initState() {
    super.initState();
    getCEP();
  }

  void getCEP() async {
    setState(() {
      loading = true;
    });
    cepList = await registerCEPRepository.getCEP();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 60, 60),
        title: const Text('Visualizar Cadastrados'),
      ),
      body: Column(
        children: [
          loading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                  itemCount: cepList.ceps.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var cep = cepList.ceps[index];
                    return Dismissible(
                        key: Key(cep.cep),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cep.cep,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    cep.bairro,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                )),
        ],
      ),
    );
  }
}
