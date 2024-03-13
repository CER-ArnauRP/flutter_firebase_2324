import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

    return Container();
  }

  Widget _construirZonaInputMissatge() {

    return Container();
  }
}