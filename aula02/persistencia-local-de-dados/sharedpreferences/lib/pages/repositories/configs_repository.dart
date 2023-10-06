import 'package:hive/hive.dart';
import 'package:teladelogin/model/configurations_model.dart';

class ConfigRepository {
  static late Box _box;

  ConfigRepository._loadConstructor();

  static Future<ConfigRepository> loadAsyncConfigRepository() async {
    if (Hive.isBoxOpen("configurations")) {
      _box = Hive.box("configurations");
    } else {
      _box = await Hive.openBox("configurations");
    }
    return ConfigRepository._loadConstructor();
  }

  void saveConfigurations(ConfigurationsModel configurationsModel) async {
    _box.put("configurationsModel", {
      "userName": configurationsModel.getUserName(),
      "userHeight": configurationsModel.getUserHeight(),
      "darkMode": configurationsModel.getDarkMode(),
      "receiveNotifications": configurationsModel.getReceiveNotification()
    });
  }

  ConfigurationsModel obtainData() {
    dynamic configurations = _box.get("configurationsModel");
    if (configurations == null) {
      return ConfigurationsModel.empty();
    } else {
      return ConfigurationsModel(
          configurations["userName"],
          configurations["userHeight"],
          configurations["darkMode"],
          configurations["receiveNotifications"]);
    }
  }
}
