import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class MailService {
//String name , String email, String message
  Future sendMail() async {
    String username = 'findmyschool2021@gmail.com';
    String password = 'findmyschool123';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username)
      ..recipients.addAll(['faseehshahzad.fs@gmail.com', 'faseehdon@gmail.com'])
      ..subject = 'Test Subject :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Write Content Here</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // close the connection
    await connection.close();
    // DONE
  }
}
