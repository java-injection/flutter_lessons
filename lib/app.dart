import 'package:demo_1/pages/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Titolo bellissimo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}