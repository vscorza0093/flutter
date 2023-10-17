import 'package:protocolohttp/model/back4app/task_back4app_model.dart';
import 'package:protocolohttp/repositories/back4app/back4app_custom_dio.dart';

class TasksBack4AppRepository {
  final _customDio = Back4AppCustomDio();

  TasksBack4AppRepository();

  Future<TaskBack4AppModel> getTask(bool notConcluded) async {
    var url = "/tasks";
    if (notConcluded) {
      url = "$url?where={\"concluded\":false}";
    }
    var response = await _customDio.getDio.get(url);
    return TaskBack4AppModel.fromJson(response.data);
  }

  Future<void> postTask(Task task) async {
    var url = "/tasks";
    try {
      await _customDio.getDio.post(url, data: task.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> putTask(Task task) async {
    var url = "/tasks/${task.objectId}";
    try {
      await _customDio.getDio.put(url, data: task.toUpdateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(String objectId) async {
    var url = "/tasks/$objectId";
    try {
      await _customDio.getDio.delete(url);
    } catch (e) {
      rethrow;
    }
  }
}
