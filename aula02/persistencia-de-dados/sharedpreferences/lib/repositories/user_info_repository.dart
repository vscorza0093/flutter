import 'package:hive/hive.dart';
import 'package:teladelogin/const_variables.dart';
import 'package:teladelogin/model/user_info_model.dart';

class UserInfoRepository {
  static late Box _box;

  UserInfoRepository._loadConstructor();

  static Future<UserInfoRepository> loadAsyncUserInfoORepository() async {
    if (Hive.isBoxOpen(USER_INFO_MODEL)) {
      _box = Hive.box(USER_INFO_MODEL);
    } else {
      _box = await Hive.openBox(USER_INFO_MODEL);
    }
    return UserInfoRepository._loadConstructor();
  }

  void saveUserInfo(UserInfoModel userInfoModel) async {
    _box.put("userinfo", userInfoModel);
  }

  UserInfoModel obtainData() {
    dynamic userinfo = _box.get(USER_INFO_MODEL);
    if (userinfo == null) {
      return UserInfoModel.emptyParams();
    }
    return userinfo;
  }
}
