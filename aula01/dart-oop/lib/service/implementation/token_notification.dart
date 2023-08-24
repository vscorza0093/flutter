import 'package:dart_oop/classes/pessoa_abstract.dart';
import 'package:dart_oop/service/notification_interface.dart';

class TokenNotification implements NotificationInterface {
  @override
  void sendNotification(Pessoa pessoa) {
    print("Enviando token para ${pessoa.getName()}");
  }
}
