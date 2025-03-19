import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Home'),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Center(
          child: SizedBox(
            height: 550,
            width: 400,
            child: Card(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.red,
                          child: Text(
                            title ?? 'Titolo al centro',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.blue,
                          child: Text(
                            title ?? 'Titolo al centro',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          title ?? 'Titolo al centro',
                          style: TextStyle(fontSize: 24),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Text(
                        title ?? 'Logout',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
