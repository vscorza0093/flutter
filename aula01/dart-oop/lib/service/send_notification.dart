import 'package:dart_oop/enum/sys_notification.dart';
import 'package:dart_oop/service/implementation/email_notification.dart';
import 'package:dart_oop/service/implementation/sms_notification.dart';
import 'package:dart_oop/service/implementation/token_notification.dart';
import 'package:dart_oop/service/notification_interface.dart';
import 'package:dart_oop/classes/pessoa_abstract.dart';

class SendNotification {
  NotificationInterface? notification;

  void notify(Pessoa pessoa) {
    switch (pessoa.getNotificationActivity()) {
      case SysNotification.email:
        notification = EmailNotification();
        break;
      case SysNotification.pushNotification:
        notification = TokenNotification();
        break;
      case SysNotification.sms:
        notification = SmsNotification();
        break;
      default:
        break;
    }
    if (notification != null) {
      notification!.sendNotification(pessoa);
    } else {
      print("${pessoa.getName()} não definiu notificação");
    }
  }
}
