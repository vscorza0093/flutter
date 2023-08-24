import 'package:dart_oop/classes/pessoa_abstract.dart';
import 'package:dart_oop/enum/sys_notification.dart';

class PessoaFisica extends Pessoa {
  String _lastname = "";

  PessoaFisica(
      String name, String lastname, String address, String registerNumber,
      {SysNotification sysNotification = SysNotification.none})
      : super(name, address, registerNumber, sysNotification: sysNotification) {
    _lastname = lastname;
  }

  @override
  String toString() {
    return {
      "Nome": getName(),
      "Sobrenome": _lastname,
      "Endereço": getAddress(),
      "CPF": getRegisterNumber(),
      "Tipo Notificação": getNotificationActivity(),
    }.toString();
  }
}
