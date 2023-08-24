import 'package:dart_oop/classes/pessoa_abstract.dart';
import 'package:dart_oop/enum/sys_notification.dart';

class PessoaJuridica extends Pessoa {
  PessoaJuridica(String name, String address, String registerNumber,
      {SysNotification sysNotification = SysNotification.none})
      : super(name, address, registerNumber, sysNotification: sysNotification);

  @override
  String toString() {
    return {
      "Nome": getName(),
      "Endereço": getAddress(),
      "CNPJ": getRegisterNumber(),
      "Tipo Notificação": getNotificationActivity(),
    }.toString();
  }
}
