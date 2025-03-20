
import 'package:demo_1/dto/user.dart';
import 'package:demo_1/providers/email_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Importiamo la classe User

class UserProfilePage extends StatefulWidget {
  final User user;

  const UserProfilePage({super.key, required this.user});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  void _inviaEmail(String email, User user) {

    //print email and user data
    print('Email: $email');
    print('User: $user');


    // Ottieni l'istanza del provider
    final emailProvider = Provider.of<EmailProvider>(context, listen: false);

    // Chiama il metodo per inviare l'email
    emailProvider.sendEmail(email, user).then((_) {
      // Mostra un messaggio di successo
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email inviata con successo')),
      );
    }).catchError((error) {
      //print the whole stack trace
      print(error);
      // Gestisce eventuali errori
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Errore nell\'invio dell\'email: $error')),
      );
    });
  }

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
          child: Stack(
            children: [

              Card(
                margin: const EdgeInsets.fromLTRB(40, 48, 40, 40),
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
                      const SizedBox(height: 50),
                      Text(
                        '${widget.user.name} ${widget.user.surname}',
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
                      _buildInfoRow('Nome', widget.user.name),
                      _buildInfoRow('Cognome', widget.user.surname),
                      _buildInfoRow('Età', '${widget.user.age} anni'),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          suffixText: '@microsis.it',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Inserisci la tua email',
                        ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _inviaEmail('${_emailController.text}@microsis.it', widget.user);
                        },
                        child: const Text('Invia Email'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: const CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.indigo,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ],
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

