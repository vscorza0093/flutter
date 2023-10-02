import 'package:teladelogin/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _tasks.add(task);
  }

  Future<void> updateTask(String id, bool concluded) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _tasks.where((element) => element.getId == id).first.setConcluded =
        concluded;
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((task) => task.getId == id).first);
  }

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _tasks;
  }

  Future<List<Task>> listNotConcluded() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((task) => !task.getConcluded).toList();
  }
}
