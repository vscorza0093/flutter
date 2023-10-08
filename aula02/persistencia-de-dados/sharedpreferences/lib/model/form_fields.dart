import 'package:flutter/material.dart';

class FormFields {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController callendarController = TextEditingController(text: '');
  List<String> selectedLanguage = <String>[];
  String selectedExperience = '';
  double selectedSalary = 0;
  int experienceTime = 0;

  FormFields(
      this.nameController,
      this.lastNameController,
      this.callendarController,
      this.selectedLanguage,
      this.selectedExperience,
      this.selectedSalary,
      this.experienceTime);
}
