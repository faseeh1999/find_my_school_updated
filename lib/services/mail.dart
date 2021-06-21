import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class MailService {
//String name , String email, String message
  Future sendMail(String name, String email, String message) async {
    String username = 'findmyschool2021@gmail.com';
    String password = 'findmyschool123';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);

    // Create our message.
    final adminMessage = Message()
      ..from = Address(username)
      ..recipients.add('faseehshahzad.fs@gmail.com')
      ..subject = '$name from $email has a Query'
      ..text = '$message';
    // ..html =
    //     "<h1>Write Content Here</h1>\n<p>Hey! Here's some HTML content</p>";

    final userMessage = Message()
      ..from = Address(username)
      ..recipients.add(email)
      ..subject = 'Thanks for contacting Find My School.'
      ..text =
          'Our Administration team is working day and night on better customer support and to resolve your queries.\nWe will get back to you within 24 hrs.\n\nRegards, Find My School Admin Team';
    // ..html =
    //     "<h1>Write Content Here</h1>\n<p>Hey! Here's some HTML content</p>";

    // try {
    //   final sendReport = await send(adminMessage, smtpServer);
    //   print('Message sent: ' + sendReport.toString());
    // } on MailerException catch (e) {
    //   print('Message not sent.');
    //   for (var p in e.problems) {
    //     print('Problem: ${p.code}: ${p.msg}');
    //   }
    // }

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(adminMessage);
    await connection.send(userMessage);

    // close the connection
    await connection.close();
    // DONE
  }

  Future sendRegisterMail(String name, String email) async {
    String username = 'findmyschool2021@gmail.com';
    String password = 'findmyschool123';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);

    // Create our message.
    // final adminMessage = Message()
    //   ..from = Address(username)
    //   ..recipients.add('faseehshahzad.fs@gmail.com')
    //   ..subject = '$name from $email has a Query'
    //   ..text = '$message';
    // ..html =
    //     "<h1>Write Content Here</h1>\n<p>Hey! Here's some HTML content</p>";

    final userMessage = Message()
      ..from = Address(username)
      ..recipients.add(email)
      ..subject = 'Hello $name\nAccount Has Been Created @ Find My School!!!'
      ..text =
          'Your Account has been created & activated.\nYou can LOGIN NOW using $email & your created password.\nHappy Finding Schools!\n\nRegards, Find My School Admin Team';
    // ..html =
    //     "<h1>Write Content Here</h1>\n<p>Hey! Here's some HTML content</p>";

    // try {
    //   final sendReport = await send(adminMessage, smtpServer);
    //   print('Message sent: ' + sendReport.toString());
    // } on MailerException catch (e) {
    //   print('Message not sent.');
    //   for (var p in e.problems) {
    //     print('Problem: ${p.code}: ${p.msg}');
    //   }
    // }

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    //await connection.send(adminMessage);
    await connection.send(userMessage);

    // close the connection
    await connection.close();
    // DONE
  }
}
