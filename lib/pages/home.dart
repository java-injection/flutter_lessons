import 'package:demo_1/dto/user.dart';
import 'package:demo_1/pages/user_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  String? title;
  int counter = 0;

  void _navigateToMainPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  UserProfilePage(
          user: User(
            id: 1,
            name: 'Mario',
            surname: 'Rossi',
            age: 33,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home'),
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
                            'Contatore click: $counter',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: counter > 10 ? Colors.green : Colors.red,
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
                      child: ElevatedButton(
                        onPressed: () {
                          setState(_navigateToMainPage);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 70,
                          ),
                          backgroundColor: Color(0xFF003366),
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
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
