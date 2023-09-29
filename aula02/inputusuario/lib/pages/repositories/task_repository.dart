import 'package:teladelogin/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  void addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void updateTask(String id, bool concluded) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks
        .where((element) => element.getId() == id)
        .first
        .setConcluded(concluded);
  }

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }
}
