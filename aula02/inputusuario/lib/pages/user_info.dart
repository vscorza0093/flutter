import 'package:flutter/material.dart';
import 'package:teladelogin/pages/repositories/language_repository.dart';
import 'package:teladelogin/pages/repositories/level_repository.dart';
import 'package:teladelogin/shared/widgets/callendar_text_field.dart';
import 'package:teladelogin/shared/widgets/simple_text_field.dart';
import 'package:teladelogin/shared/widgets/text_label.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController lastNameController =
      TextEditingController(text: "");
  final TextEditingController callendarController =
      TextEditingController(text: "");

  LevelRepository levelRepository = LevelRepository();
  LanguageRepository languageRepository = LanguageRepository();
  var menuOptions = [];
  var languageOption = [];
  var selectedLanguage = [];

  double selectedSalary = 0;

  int timeExperience = 0;

  @override
  void initState() {
    menuOptions = levelRepository.getKnowledgeList();
    languageOption = languageRepository.getLanguageList();
    super.initState();
  }

  String txt = '';
  String currentSelected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados cadastrais"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          SimpleTextField(labelText: "Name", controller: nameController),
          const SizedBox(height: 8),
          SimpleTextField(
              labelText: "Last Name", controller: lastNameController),
          const SizedBox(height: 8),
          CallendarTextField(
              labelText: 'Date of birth', controller: callendarController),
          const SizedBox(height: 8),
          const TextLabel(
            text: 'Nível de experiência',
          ),
          Column(
            children: menuOptions
                .map((level) => RadioListTile(
                    title: Text(level.toString()),
                    selected: currentSelected == level,
                    value: level,
                    groupValue: currentSelected,
                    onChanged: (value) {
                      setState(() {
                        currentSelected = value.toString();
                      });
                    }))
                .toList(),
          ),
          const SizedBox(height: 5),
          const TextLabel(text: "Linguagens preferidas"),
          Column(
              children: languageOption
                  .map((language) => CheckboxListTile(
                      title: Text(language),
                      selected: false,
                      value: selectedLanguage.contains(language),
                      onChanged: (bool? value) {
                        if (value!) {
                          setState(() {
                            selectedLanguage.add(language);
                          });
                        } else {
                          setState(() {
                            selectedLanguage.remove(language);
                          });
                        }
                      }))
                  .toList()),
          const TextLabel(text: "Tempo de experiência"),
          DropdownButton(
              value: timeExperience,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 1, child: Text("1")),
                DropdownMenuItem(value: 2, child: Text("2")),
                DropdownMenuItem(value: 3, child: Text("3")),
                DropdownMenuItem(value: 4, child: Text("4")),
              ],
              onChanged: (value) {
                setState(() {
                  timeExperience = int.parse(value.toString());
                });
              }),
          TextLabel(
              text:
                  "Pretensão Salaria: R\$ ${selectedSalary.round().toString()}"),
          Slider(
              min: 0,
              max: 10000,
              value: selectedSalary,
              onChanged: (double value) {
                setState(() {
                  selectedSalary = value;
                });
              }),
          TextButton(
              onPressed: () {
                debugPrint(nameController.text);
                debugPrint(lastNameController.text);
                debugPrint(callendarController.text);
                debugPrint(currentSelected.toString());
                String items = "Lang:";
                for (var lang in selectedLanguage) {
                  items += " $lang,";
                }
                debugPrint(items);
                debugPrint("R\$ ${selectedSalary.round()},00");
              },
              child: const Text("Salvar")),
        ]),
      ),
    );
  }
}
