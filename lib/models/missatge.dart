import 'package:cloud_firestore/cloud_firestore.dart';

class Missatge {

  final String idAutor;
  final String emailAutor;
  final String idReceptor;
  final String textMissatge;
  final Timestamp timestamp;

  Missatge({
    required this.idAutor,
    required this.emailAutor,
    required this.idReceptor,
    required this.textMissatge,
    required this.timestamp,
  });

  Map<String, dynamic> retornarMapaObjecte() {

    return {
      "idAutor": idAutor,
      "emailAutor": emailAutor,
      "idReceptor": idReceptor,
      "textMissatge": textMissatge,
      "timestamp": timestamp,
    };
  }
}