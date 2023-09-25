import 'package:flutter/material.dart';
import 'package:teladelogin/model/form_fields.dart';
import 'package:teladelogin/pages/repositories/language_repository.dart';
import 'package:teladelogin/pages/repositories/level_repository.dart';
import 'package:teladelogin/shared/widgets/callendar_text_field.dart';
import 'package:teladelogin/shared/widgets/simple_text_field.dart';
import 'package:teladelogin/shared/widgets/text_label.dart';

import 'package:teladelogin/shared/methods/methods.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  LevelRepository levelRepository = LevelRepository();
  LanguageRepository languageRepository = LanguageRepository();

  int timeExperience = 1;
  bool saving = false;

  var experienceMenuOptions = [];
  var languageOption = [];

  static const VERIFY_DATA = "Verifique os dados inseridos";
  static const SUCCESS = "Dados salvos com sucesso";

  FormFields formFields = FormFields(
      TextEditingController(text: ""),
      TextEditingController(text: ""),
      TextEditingController(text: ""),
      <String>[],
      '',
      0);

  @override
  void initState() {
    experienceMenuOptions = levelRepository.getKnowledgeList();
    languageOption = languageRepository.getLanguageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados cadastrais"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: saving
            ? const Center(child: CircularProgressIndicator())
            : ListView(children: [
                SimpleTextField(
                    labelText: "Name", controller: formFields.nameController),
                const SizedBox(height: 8),
                SimpleTextField(
                    labelText: "Last Name",
                    controller: formFields.lastNameController),
                const SizedBox(height: 8),
                CallendarTextField(
                    labelText: 'Date of birth',
                    controller: formFields.callendarController),
                const SizedBox(height: 8),
                const TextLabel(text: "Linguagens preferidas"),
                Column(
                    children: languageOption
                        .map((language) => CheckboxListTile(
                            title: Text(language),
                            selected: false,
                            value:
                                formFields.selectedLanguage.contains(language),
                            onChanged: (bool? value) {
                              if (value!) {
                                setState(() {
                                  formFields.selectedLanguage.add(language);
                                });
                              } else {
                                setState(() {
                                  formFields.selectedLanguage.remove(language);
                                });
                              }
                            }))
                        .toList()),
                const TextLabel(
                  text: 'Nível de experiência',
                ),
                Column(
                  children: experienceMenuOptions
                      .map((level) => RadioListTile(
                          title: Text(level.toString()),
                          selected: formFields.selectedExperience == level,
                          value: level,
                          groupValue: formFields.selectedExperience,
                          onChanged: (value) {
                            setState(() {
                              formFields.selectedExperience = value.toString();
                            });
                          }))
                      .toList(),
                ),
                const SizedBox(height: 5),
                TextLabel(
                    text:
                        "Pretensão Salarial: R\$ ${formFields.selectedSalary.round().toString()}"),
                Slider(
                    min: 0,
                    max: 10000,
                    value: formFields.selectedSalary,
                    onChanged: (double value) {
                      setState(() {
                        formFields.selectedSalary = value;
                      });
                    }),
                const SizedBox(
                  height: 8,
                ),
                const TextLabel(
                  text: "Tempo de experiência",
                ),
                DropdownButton(
                    value: timeExperience,
                    isExpanded: true,
                    items: menuItems(30),
                    onChanged: (value) {
                      setState(() {
                        timeExperience = int.parse(value.toString());
                      });
                    }),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        saving = false;
                      });
                      String snackbarText = VERIFY_DATA;
                      if (generalVerification(context, formFields)) {
                        setState(() {
                          snackbarText = SUCCESS;
                          saving = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            saving = false;
                          });
                        });
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(snackbarText)));
                    },
                    child: const Text("Salvar")),
              ]),
      ),
    );
  }
}
