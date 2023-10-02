import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = '';
  bool _concluded = false;

  Task(this._description, this._concluded);

  String get getId => _id;

  String get getDescription => _description;

  bool get getConcluded => _concluded;

  set setDescription(String description) {
    _description = description;
  }

  set setConcluded(bool concluded) {
    _concluded = concluded;
  }
}
