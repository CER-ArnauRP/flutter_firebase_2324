
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
}