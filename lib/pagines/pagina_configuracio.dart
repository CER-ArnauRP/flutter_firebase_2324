import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/components/drawer_aplicacio.dart';

class PaginaConfiguracio extends StatelessWidget {
  const PaginaConfiguracio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuració"),
        backgroundColor: const Color.fromARGB(255, 255, 147, 108),
      ),
      drawer: const DrawerAplicacio(),
      body: Container(
        color: Color.fromARGB(255, 250, 183, 159),
        child: const Center(
          child: Text("Configuració"),
        ),
      ),
    );
  }
}