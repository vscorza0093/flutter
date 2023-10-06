class ConfigurationsModel {
  String _userName = "";
  double _userHeight = 0;
  bool _darkMode = false;
  bool _receiveNotifications = false;

  ConfigurationsModel.empty() {
    _userName = "";
    _userHeight = 0;
    _darkMode = false;
    _receiveNotifications = false;
  }

  ConfigurationsModel(this._userName, this._userHeight, this._darkMode,
      this._receiveNotifications);

  void setUserName(String userName) {
    _userName = userName;
  }

  String getUserName() => _userName;

  void setUserHeight(double userHeight) {
    _userHeight = userHeight;
  }

  double getUserHeight() => _userHeight;

  void setDarkMode(bool darkMode) {
    _darkMode = darkMode;
  }

  bool getDarkMode() => _darkMode;

  void setReceiveNotification(bool receiveNotification) {
    _receiveNotifications = receiveNotification;
  }

  bool getReceiveNotification() => _receiveNotifications;
}
