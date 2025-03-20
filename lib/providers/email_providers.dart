import 'package:flutter/material.dart';
  import '../dto/user.dart';
  import '../service/email_service.dart';

  class EmailProvider with ChangeNotifier {
    final EmailService _emailService;

    EmailProvider({
      required String username,
      required String password,
      required String smtpServerHost,
      required int smtpServerPort,
    }) : _emailService = EmailService(
            username: username,
            password: password,
            smtpServerHost: smtpServerHost,
            smtpServerPort: smtpServerPort,
          );

    Future<void> sendEmail(String recipientEmail, User user) async {
      await _emailService.sendEmail(recipientEmail, user);
      notifyListeners();
    }
  }