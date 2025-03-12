import 'package:demo_1/pages/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Minimal Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}