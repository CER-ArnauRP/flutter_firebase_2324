
import 'package:cloud_firestore/cloud_firestore.dart';

class ServeiChat {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}