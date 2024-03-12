import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/components/drawer_aplicacio.dart';

class PaginaInici extends StatelessWidget {
  const PaginaInici({super.key});

  void logout() {
    final serveiAuth = ServeiAuth();

    serveiAuth.tancarSessio();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inici"),
        backgroundColor: const Color.fromARGB(255, 255, 147, 108),
      ),
      drawer: const DrawerAplicacio(),
      body: const Placeholder(
        color: Color.fromARGB(255, 250, 183, 159),
      ),
    );
  }
}