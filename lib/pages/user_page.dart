
import 'package:demo_1/dto/user.dart';
import 'package:flutter/material.dart';


// Importiamo la classe User

class UserProfilePage extends StatelessWidget {
  final User user;

  const UserProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profilo Utente',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[700],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo[700]!,
              Colors.indigo[100]!,
            ],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '${user.name} ${user.surname}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 2,
                    width: 80,
                    color: Colors.indigo[300],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Nome', user.name),
                  _buildInfoRow('Cognome', user.surname),
                  _buildInfoRow('Età', '${user.age} anni'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}