import 'package:dio/dio.dart';
import 'package:protocolohttp/model/back4app/task_back4app_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksBack4AppRepository {
  Future<TaskBack4AppModel> getTask() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "PZvYqYwfKcgYXZkHGX00gkgTZLiyTwWNbVko380z";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "A1WXHDCPe3S4x4wBEMguteJFQ2USDalRQ75yjPv1";
    dio.options.headers["Content-Type"] = "application/json";

    var result = await dio.get("https://parseapi.back4app.com/classes/tasks");
    print(result.statusCode);
    return TaskBack4AppModel.fromJson(result.data);
  }
}
