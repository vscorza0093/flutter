import 'package:calculadoraimc/const_attributes.dart';
import 'package:calculadoraimc/custom_widgets/custom_app_bar.dart';
import 'package:calculadoraimc/custom_widgets/border_text_field.dart';
import 'package:calculadoraimc/sqlite/person_sqlite_model.dart';
import 'package:calculadoraimc/sqlite/person_sqlite_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IMCPageCard extends StatefulWidget {
  const IMCPageCard({super.key});

  @override
  State<IMCPageCard> createState() => _IMCPageCardState();
}

class _IMCPageCardState extends State<IMCPageCard> {
  PersonSQLiteRepository personRepository = PersonSQLiteRepository();
  bool saving = false;
  var _persons = const <PersonSQLiteModel>[];
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtainPersons();
  }

  void obtainPersons() async {
    _persons = await personRepository.obtainData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(IMC_TITLE, IMC_KEY, IMC_COLOR),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Insira os dados a baixo',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BorderTextField(labelText: 'Idade', controller: ageController),
              const SizedBox(
                height: 25,
              ),
              BorderTextField(labelText: 'Peso', controller: weightController),
              const SizedBox(
                height: 25,
              ),
              // TextField Altura
              BorderTextField(
                labelText: 'Altura',
                controller: heightController,
              ),
              const SizedBox(
                height: 30,
              ),
              // TextButton Confirmar
              SizedBox(
                child: TextButton(
                  onPressed: () async {
                    double calc = 0;
                    calc = double.parse(weightController.text) /
                        double.parse(heightController.text);
                    int imc = int.parse(calc.round().toString());

                    await personRepository.saveData(PersonSQLiteModel(imc));
                    debugPrint(ageController.text);
                    debugPrint(weightController.text);
                    debugPrint(heightController.text);
                    debugPrint('dados salvos');
                    setState(() {});
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 0, 0, 0))),
                  child: Text(
                    'Confirmar',
                    style: GoogleFonts.alata(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
