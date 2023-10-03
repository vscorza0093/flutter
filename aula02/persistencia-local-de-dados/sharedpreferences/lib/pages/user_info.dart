import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teladelogin/model/form_fields.dart';
import 'package:teladelogin/pages/repositories/language_repository.dart';
import 'package:teladelogin/pages/repositories/level_repository.dart';
import 'package:teladelogin/shared/widgets/callendar_text_field.dart';
import 'package:teladelogin/shared/widgets/simple_text_field.dart';
import 'package:teladelogin/shared/widgets/text_label.dart';
import 'package:teladelogin/const_variables.dart';

import 'package:teladelogin/shared/methods/methods.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late SharedPreferences sharedPreferences;

  LevelRepository levelRepository = LevelRepository();
  LanguageRepository languageRepository = LanguageRepository();

  bool saving = false;

  var experienceMenuOptions = [];
  var languageOption = [];

  FormFields formFields = FormFields(
      TextEditingController(text: ""),
      TextEditingController(text: ""),
      TextEditingController(text: ""),
      <String>[],
      '',
      0,
      1);

  @override
  void initState() {
    experienceMenuOptions = levelRepository.getKnowledgeList();
    languageOption = languageRepository.getLanguageList();
    loadData();
    super.initState();
  }

  void loadData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    formFields.nameController.text =
        sharedPreferences.getString(FIRST_NAME) ?? "";
    formFields.lastNameController.text =
        sharedPreferences.getString(LAST_NAME) ?? "";
    formFields.selectedSalary =
        sharedPreferences.getDouble(SALARY_EXPECTATION) ?? 0.0;
    formFields.selectedExperience =
        sharedPreferences.getString(EXPERIENCE_LEVEL) ?? "";
    formFields.selectedLanguage =
        sharedPreferences.getStringList(FAVORITE_LANGUAGE) ?? [];
    formFields.callendarController.text =
        sharedPreferences.getString(DATE_OF_BIRTH).toString();
    formFields.experienceTime = sharedPreferences.getInt(EXPERIENCE_TIME) ?? 0;
    setState(() {});
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    closePage();
  }

  void closePage() {
    Navigator.pop(context);
  }

  void saveSharedPreferences() async {
    await sharedPreferences.setString(
        FIRST_NAME, formFields.nameController.text);
    await sharedPreferences.setString(
        LAST_NAME, formFields.lastNameController.text);
    await sharedPreferences.setString(
        DATE_OF_BIRTH, formFields.callendarController.text);
    await sharedPreferences.setDouble(
        SALARY_EXPECTATION, formFields.selectedSalary);
    await sharedPreferences.setString(
        EXPERIENCE_LEVEL, formFields.selectedExperience);
    await sharedPreferences.setStringList(
        FAVORITE_LANGUAGE, formFields.selectedLanguage);
    await sharedPreferences.setInt(EXPERIENCE_TIME, formFields.experienceTime);
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
                    value: formFields.experienceTime,
                    isExpanded: true,
                    items: menuItems(30),
                    onChanged: (value) {
                      setState(() {
                        formFields.experienceTime = int.parse(value.toString());
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
                          saveSharedPreferences();
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
