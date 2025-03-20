import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../dto/user.dart';

class EmailService {
  final String username;
  final String password;
  final String smtpServerHost;
  final int smtpServerPort;

  EmailService({
    required this.username,
    required this.password,
    required this.smtpServerHost,
    required this.smtpServerPort,
  });

  Future<void> sendEmail(String recipientEmail, User user) async {
    final smtpServer = SmtpServer(
      smtpServerHost,
      port: smtpServerPort,
      username: username,
      password: password,
      ssl: false,
      allowInsecure: true,
    );

    final message = Message()
      ..from = Address(username, 'Your App Name')
      ..recipients.add(recipientEmail)
      ..subject = 'Hello from ${user.name} ${user.surname}'
      ..text = 'This is a test email sent from Flutter app.\n\nUser details:\n${user.toString()}';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
    }
  }
}