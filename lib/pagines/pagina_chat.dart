import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/chat/servei_chat.dart';

class PaginaChat extends StatefulWidget {

  final String emailDeAmbQuiParlem;
  final String idDeAmbQuiParlem;

  const PaginaChat({
    super.key,
    required this.emailDeAmbQuiParlem,
    required this.idDeAmbQuiParlem,
  });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

  final ServeiAuth _serveiAuth = ServeiAuth();
  final ServeiChat _serveiChat = ServeiChat();
  final TextEditingController _controllerMissatge = TextEditingController();

  void enviarMissatge() async {

    if (_controllerMissatge.text.isNotEmpty) {
      await _serveiChat.enviarMissatge(widget.idDeAmbQuiParlem, _controllerMissatge.text);

      _controllerMissatge.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emailDeAmbQuiParlem),
      ),
      body: Column(
        children: [
          // Llista missatges.
          Expanded(
            child: _construirLlistaMissatges(),
          ),

          // Zona input nou missatge.
          _construirZonaInputMissatge(),
        ],
      ),
    );
  }

  Widget _construirLlistaMissatges() {

    String idUsuariActual = _serveiAuth.getUsuariActual()!.uid;

    return StreamBuilder(
      stream: _serveiChat.getMissatges(widget.idDeAmbQuiParlem, idUsuariActual), 
      builder: (context, snapshot) {
        // Errors.
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // Carregant.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Carregant...");
        }

        // Retornar llista.
        return ListView(
          children: snapshot.data!.docs.map((document) => _construirItemMissatge(document)).toList(),
        );
      },
    );
  }

  Widget _construirItemMissatge(DocumentSnapshot documentSnapshot) {

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    // Si és usuari actual.
    bool esUsuariActual = data["idDeLAutor"] == _serveiAuth.getUsuariActual()!.uid;

    var aliniament = esUsuariActual ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: aliniament,
      child: Text(data["missatge"]),
    );
  }

  Widget _construirZonaInputMissatge() {

    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 50),
      child: Row(
        children: [
          const Expanded(
            child: TextField(),
          ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: IconButton(
              icon: const Icon(Icons.arrow_upward),
              color: Colors.white,
              onPressed: enviarMissatge,
            ),
          ),
        ],
      ),
    );
  }
}