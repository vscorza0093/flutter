import 'package:hive/hive.dart';
import 'package:teladelogin/const_variables.dart';
import 'package:teladelogin/model/configurations_model.dart';

class ConfigRepository {
  static late Box _box;

  ConfigRepository._loadConstructor();

  static Future<ConfigRepository> loadAsyncConfigRepository() async {
    if (Hive.isBoxOpen(CONFIGURATIONS)) {
      _box = Hive.box(CONFIGURATIONS);
    } else {
      _box = await Hive.openBox(CONFIGURATIONS);
    }
    return ConfigRepository._loadConstructor();
  }

  void saveConfigurations(ConfigurationsModel configurationsModel) async {
    _box.put(CONFIGURATIONS_MODEL, {
      USER_NAME_KEY: configurationsModel.getUserName(),
      USER_HEIGHT_KEY: configurationsModel.getUserHeight(),
      DARK_MODE_KEY: configurationsModel.getDarkMode(),
      RECEIVE_NOTIFICATION_KEY: configurationsModel.getReceiveNotification()
    });
  }

  ConfigurationsModel obtainData() {
    dynamic configurations = _box.get(CONFIGURATIONS_MODEL);
    if (configurations == null) {
      return ConfigurationsModel.empty();
    } else {
      return ConfigurationsModel(
          configurations[USER_NAME_KEY],
          configurations[USER_HEIGHT_KEY],
          configurations[DARK_MODE_KEY],
          configurations[RECEIVE_NOTIFICATION_KEY]);
    }
  }
}
