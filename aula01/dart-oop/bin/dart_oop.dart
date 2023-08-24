import 'package:dart_oop/classes/pessoa_abstract.dart';
import 'package:dart_oop/classes/PessoaFisica.dart';
import 'package:dart_oop/classes/PessoaJuridica.dart';
import 'package:dart_oop/enum/sys_notification.dart';
import 'package:dart_oop/service/send_notification.dart';

void main(List<String> arguments) {
  var pf = PessoaFisica("Vinicius", "Scorza", "Av 2", "12345678900",
      sysNotification: SysNotification.sms);
  var pj = PessoaJuridica("Empresa1", "Rua da Empresa", "11123456000100",
      sysNotification: SysNotification.email);

  print("$pf\n");
  print("$pj\n");

  SendNotification sendNotification = SendNotification();

  sendNotification.notify(pf);
  sendNotification.notify(pj);
}
