import 'package:flutter/material.dart';

class Elenco extends StatelessWidget {
  const Elenco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elenco'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (index) {
            return Text(
              'Elemento ${index + 1}',
              style: const TextStyle(fontSize: 24),
            );
          }),
        ),
      ),
    );
  }
}