class TaskSQLiteModel {
  int id = 0;
  String description = '';
  bool concluded = false;

  TaskSQLiteModel(this.id, this.description, this.concluded);

  int get getId => id;
  String get getDescription => description;
  bool get getConcluded => concluded;

  set setId(int id) {
    this.id = id;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setConcluded(bool concluded) {
    this.concluded = concluded;
  }
}
