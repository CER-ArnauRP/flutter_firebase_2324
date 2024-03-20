
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_2324/models/Missatge.dart';

class ServeiChat {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Retornar llista d'usuaris.
  Stream<List<Map<String, dynamic>>> getStreamUsuaris() {

    return _firestore.collection("Usuaris").snapshots().map((event) {

      return event.docs.map((document){
        final usuari = document.data();

        return usuari;
      }).toList();
    });
  }

  Stream<QuerySnapshot> getMissatges(String idUsuariActual, idUsuariInterlocutor) {

    List<String> idsUsuaris = [idUsuariActual, idUsuariInterlocutor];
    idsUsuaris.sort();
    String idSalaChat = idsUsuaris.join("_");

    return _firestore.collection("sales_chat").doc(idSalaChat)
      .collection("missatges")
      .orderBy("timestamp", descending: false)
      .snapshots();
  }

  Future<void> enviarMissatge(String idDeQuiRepMissatge, missatge) async {

    final String idUsuariActual = _auth.currentUser!.uid;
    final String emailUsuariActual = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Missatge nouMissatge = Missatge(
      idAutor: idUsuariActual, 
      emailAutor: emailUsuariActual, 
      idReceptor: idDeQuiRepMissatge, 
      textMissatge: missatge, 
      timestamp: timestamp,
    );

    List<String> idsUsuaris = [idUsuariActual, idDeQuiRepMissatge];
    idsUsuaris.sort();

    String idSalaChat = idsUsuaris.join("_");

    await _firestore.collection("SalesChat").doc(idSalaChat).collection("Missatges").add(nouMissatge.retornarMapaObjecte());
  }
}