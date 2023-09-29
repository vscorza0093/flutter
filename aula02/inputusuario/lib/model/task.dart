import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = '';
  bool _concluded = false;

  Task(this._description, this._concluded);

  String getId() {
    return _id;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String description) {
    _description = description;
  }

  bool getConcluded() {
    return _concluded;
  }

  void setConcluded(bool concluded) {
    _concluded = concluded;
  }
}
