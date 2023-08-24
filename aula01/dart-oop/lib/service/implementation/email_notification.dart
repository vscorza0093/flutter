import 'package:dart_oop/classes/pessoa_abstract.dart';
import 'package:dart_oop/service/notification_interface.dart';

class EmailNotification implements NotificationInterface {
  @override
  void sendNotification(Pessoa pessoa) {
    print("Enviando email para ${pessoa.getName()}");
  }
}
