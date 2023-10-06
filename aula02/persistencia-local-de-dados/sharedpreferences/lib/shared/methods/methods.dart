import 'package:flutter/material.dart';
import 'package:teladelogin/model/form_fields.dart';

bool nameVerification(
    TextEditingController nameController, BuildContext context) {
  bool result = false;
  (nameController.text.length < 3)
      ? ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Nome inválido")))
      : result = true;
  return result;
}

bool lastNameVerification(
    TextEditingController lastNameController, BuildContext context) {
  bool result = false;

  (lastNameController.text.length < 3)
      ? ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sobrenome inválido")))
      : result = true;
  return result;
}

bool callendarVerification(
    TextEditingController callendarController, BuildContext context) {
  bool result = false;
  (callendarController.text == '')
      ? ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data de nascimento inválida")))
      : result = true;
  return result;
}

bool experienceVerification(String selectedExperience, BuildContext context) {
  bool result = false;
  (selectedExperience == '')
      ? ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Selecione o nível de experiência")))
      : result = true;
  return result;
}

bool languageVerification(List<String> selectedLanguage, BuildContext context) {
  bool result = false;
  (selectedLanguage.isEmpty)
      ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Selecione ao menos uma linguagem de programação")))
      : result = true;
  return result;
}

String getLanguagesString(List<String> selectedLanguage) {
  String languages = "Lang:";
  for (var lang in selectedLanguage) {
    languages += " $lang,";
  }
  return replaceLastChar(languages);
}

String replaceLastChar(String str) {
  str = str.replaceFirstMapped(',', (m) => '.', str.length - 1);
  return str;
}

bool salaryVerification(double selectedSalary, BuildContext context) {
  bool result = false;
  (selectedSalary == 0)
      ? ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Salário deve ser maior que 0")))
      : result = true;
  return result;
}

List<DropdownMenuItem<int>> menuItems(int itemsQuantity) {
  List<DropdownMenuItem<int>> items = <DropdownMenuItem<int>>[];
  for (int i = 0; i < itemsQuantity + 1; i++) {
    items.add(DropdownMenuItem(value: i, child: Text(i.toString())));
  }
  return items;
}

void persistData(
    TextEditingController nameController,
    TextEditingController lastNameController,
    TextEditingController callendarController,
    List<String> selectedLanguage,
    String selectedExperience,
    double selectedSalary) {}

  

bool generalVerification(BuildContext context, FormFields formFields) {
  return (nameVerification(formFields.nameController, context) &&
      lastNameVerification(formFields.lastNameController, context) &&
      callendarVerification(formFields.callendarController, context) &&
      languageVerification(formFields.selectedLanguage, context) &&
      experienceVerification(formFields.selectedExperience, context) &&
      salaryVerification(formFields.selectedSalary, context));
}
