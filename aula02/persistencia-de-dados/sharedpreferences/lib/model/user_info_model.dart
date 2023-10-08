import 'package:hive/hive.dart';
import 'package:teladelogin/const_variables.dart';

part 'user_info_model.g.dart';

@HiveType(typeId: USER_INFO_MODEL_ID)
class UserInfoModel extends HiveObject {
  @HiveField(USER_INFO_NAME_ID)
  String? name;

  @HiveField(USER_INFO_LAST_NAME_ID)
  String? lastName;

  @HiveField(USER_INFO_BIRTH_DAY_ID)
  String? birthday;

  @HiveField(USER_INFO_EXPERIENCE_LEVEL_ID)
  String? experienceLevel;

  @HiveField(USER_INFO_FAVORITE_LANGUAGE_ID)
  List<String> favoriteLanguages = <String>[];

  @HiveField(USER_INFO_SALARY_EXPECTATION_ID)
  double? salaryExpectation;

  @HiveField(USER_INFO_EXPERIENCE_TIME_ID)
  int? experienceTime;

  UserInfoModel();

  UserInfoModel.emptyParams() {
    name = '';
    lastName = '';
    birthday = '';
    experienceLevel = '';
    favoriteLanguages = [];
    salaryExpectation = 0;
    experienceTime = 0;
  }
}
