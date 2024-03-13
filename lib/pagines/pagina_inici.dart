import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/chat/servei_chat.dart';
import 'package:flutter_firebase_2324/components/drawer_aplicacio.dart';
import 'package:flutter_firebase_2324/components/item_usuari.dart';

class PaginaInici extends StatelessWidget {
  PaginaInici({super.key});

  final _serveiAuth = ServeiAuth();
  final _serveiChat = ServeiChat();

  void logout() {

    _serveiAuth.tancarSessio();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      appBar: AppBar(
        title: const Text("Inici"),
        backgroundColor: const Color.fromARGB(255, 255, 147, 108),
      ),
      drawer: const DrawerAplicacio(),
      body: _construeixLlistaUsuaris(),
    );
  }

  Widget _construeixLlistaUsuaris() {

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: StreamBuilder(
        stream: _serveiChat.getStreamUsuaris(), 
        builder: (context, snapshot) {
      
          if (snapshot.hasError) {
            return const Text("Error pagina_inici: _construeixLlistaUsuaris");
          }
      
          // Carregar dades.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Carregant dades...");
          }
      
          return ListView(
            children: snapshot.data!.map<Widget>(
              (dadesUsuari) => _construirItemLlista(dadesUsuari, context)).toList(),
          );
      
        },
      ),
    );
  } // O fora de la classe principal?

  Widget _construirItemLlista(Map<String, dynamic> dadesUsuari, BuildContext context) {

    if (dadesUsuari["email"] != _serveiAuth.getUsuariActual()!.email) {

      return ItemUsuari(
        text: dadesUsuari["email"], 
        onTap: () {
          
        },
      );
    } else {
      return Container();
    }
  }
}

