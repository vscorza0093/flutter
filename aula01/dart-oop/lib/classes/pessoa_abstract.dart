import 'package:dart_oop/enum/sys_notification.dart';

abstract class Pessoa {
  String _name = "";
  String? _address;
  String _registerNumber = "";
  SysNotification _sysNotification = SysNotification.none;
  String _email = "";
  String _phoneNumber = "";
  String _token = "";

  void setName(String name) => _name = name;
  void setAddress(String address) => _address = address;
  void setRegisterNumber(String registerNumber) =>
      _registerNumber = registerNumber;
  void setNotificationManager(SysNotification sysNotification) {
    _sysNotification = sysNotification;
  }

  void setEmail(String email) => _email = email;
  void setPhoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  void setToken(String token) => _token = token;

  String getName() => _name;
  String? getAddress() => _address;
  String getRegisterNumber() => _registerNumber;
  SysNotification getNotificationActivity() => _sysNotification;
  String getEmail() => _email;
  String getPhoneNumber() => _phoneNumber;
  String getToken() => _token;

  Pessoa(String name, String? address, String registerNumber,
      {SysNotification sysNotification = SysNotification.none}) {
    _name = name;
    _address = address;
    _registerNumber = registerNumber;
    _sysNotification = sysNotification;
  }

  @override
  String toString() {
    return {
      "Nome": _name,
      "Endereço": _address,
      "Notificação": _sysNotification,
    }.toString();
  }
}
