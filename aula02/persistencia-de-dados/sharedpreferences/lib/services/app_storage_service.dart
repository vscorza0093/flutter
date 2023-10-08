import 'package:shared_preferences/shared_preferences.dart';
import 'package:teladelogin/const_variables.dart';

class AppStorageService {
  Future<void> setUserInfoName(String name) async {
    _setString(FIRST_NAME, name);
  }

  Future<String> getUserInfoName() async {
    return _getString(FIRST_NAME);
  }

  Future<void> setUserInfoLastName(String lastName) async {
    _setString(LAST_NAME, lastName);
  }

  Future<String> getUserInfoLastName() async {
    return _getString(LAST_NAME);
  }

  Future<void> setUserInfoBirthDay(DateTime callendar) async {
    _setString(DATE_OF_BIRTH, callendar.toString());
  }

  Future<String> getUserInfoBirthDay() async {
    return _getString(DATE_OF_BIRTH);
  }

  Future<void> setUserInfoExperienceLevel(String experienceLevel) async {
    _setString(EXPERIENCE_LEVEL, experienceLevel);
  }

  Future<String> getUserInfoExperienceLevel() async {
    return _getString(EXPERIENCE_LEVEL);
  }

  Future<void> setUserInfoSalaryExpactation(double salary) async {
    _setDouble(SALARY_EXPECTATION, salary);
  }

  Future<double> getUserInfoSalary() async {
    return _getDouble(SALARY_EXPECTATION);
  }

  Future<void> setUserInfoFavoriteLanguage(
      List<String> favoriteLanguages) async {
    _setStringList(FAVORITE_LANGUAGE, favoriteLanguages);
  }

  Future<List<String>> getUserInfoFavoriteLanguages() async {
    return _getStringList(FAVORITE_LANGUAGE);
  }

  Future<void> setUserInfoExperienceTime(int experienceTime) async {
    _setInt(EXPERIENCE_TIME, experienceTime);
  }

  Future<int> getUserInfoExperienceTime() async {
    return _getInt(EXPERIENCE_TIME);
  }

  Future<void> setConfigUserName(String name) async {
    _setString(USER_NAME_KEY, name);
  }

  Future<String> getConfigUSerName() async {
    return _getString(USER_NAME_KEY);
  }

  Future<void> setConfigUserHeight(double value) async {
    _setDouble(USER_HEIGHT_KEY, value);
  }

  Future<double> getConfigUserHeight() async {
    return _getDouble(USER_HEIGHT_KEY);
  }

  Future<void> setConfigNotification(bool value) async {
    _setBool(RECEIVE_NOTIFICATION_KEY, value);
  }

  Future<bool> getConfigNotification() async {
    return _getBool(RECEIVE_NOTIFICATION_KEY);
  }

  Future<void> setConfigDarkMode(bool value) async {
    _setBool(DARK_MODE_KEY, value);
  }

  Future<bool> getConfigDarkMode() async {
    return _getBool(DARK_MODE_KEY);
  }

  Future<void> _setString(String key, String value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  Future<void> _setInt(String key, int value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  Future<void> _setDouble(String key, double value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  Future<void> _setStringList(String key, List<String> value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setStringList(key, value);
  }

  Future<List<String>> _getStringList(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  Future<void> _setBool(String key, bool value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }
}
