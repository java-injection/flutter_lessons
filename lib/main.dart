import 'package:demo_1/providers/email_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'dto/user.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EmailProvider(
          username: 'flutter@microsis.it',
          password: '',
          smtpServerHost: "mail.microsis.it",
          smtpServerPort: 25,

      ),
      child: App(),
    ),
  );
}