import 'package:sqflite/sqflite.dart';
import 'package:teladelogin/model/task_sqlite_model.dart';
import 'package:teladelogin/repositories/sqlite/database.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> obtainData() async {
    List<TaskSQLiteModel> tasks = [];
    Database database = await DataBaseClass().getDataBase();
    var result =
        await database.rawQuery('SELECT id, description, concluded FROM tasks');
    for (var element in result) {
      tasks.add(TaskSQLiteModel(int.parse(element['id'].toString()),
          element['description'].toString(), element['concluded'] == "1"));
    }
    return tasks;
  }

  Future<void> saveData(TaskSQLiteModel taskSQLiteModel) async {
    Database database = await DataBaseClass().getDataBase();
    database
        .rawInsert('INSERT INTO tasks (description, concluded) values(?,?)', [
      taskSQLiteModel.description,
      taskSQLiteModel.concluded,
    ]);
  }

  Future<void> updateData(TaskSQLiteModel taskSQLiteModel) async {
    Database database = await DataBaseClass().getDataBase();
    database.rawInsert(
        'UPDATE tasks SET description = ?, concluded = ? WHERE id = ?', [
      taskSQLiteModel.description,
      taskSQLiteModel.concluded,
      taskSQLiteModel.id
    ]);
  }

  Future<void> removeData(int id) async {
    Database database = await DataBaseClass().getDataBase();
    database.rawInsert('DELETE FROM tasks WHERE id = ?', [id]);
  }
}
