import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/pagines/pagina_configuracio.dart';
import 'package:flutter_firebase_2324/pagines/pagina_inici.dart';

class DrawerAplicacio extends StatelessWidget {
  const DrawerAplicacio({super.key});

  void ferLogout() {

    final ServeiAuth _auth = ServeiAuth();
    _auth.tancarSessio();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 240, 218),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo.
              const DrawerHeader(
                child: Icon(
                  Icons.fireplace,
                  color: Color.fromARGB(255, 255, 147, 108),
                  size: 80,
                ),
              ),

              // Opció Pàgina inicial.
              ListTile(
                title: Text(
                  "INCICI",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 147, 108),
                  ),
                ),
                leading: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 255, 147, 108),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => PaginaInici(), ),
                  );
                },
              ),

              // Opció Configuració.
              ListTile(
                title: Text(
                  "CONFIGURACIÓ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 147, 108),
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 255, 147, 108),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => PaginaConfiguracio(), ),
                  );
                },
              ),
            ],
          ),
          Column(
            children: [
              // Opció Tanca sessió.
              ListTile(
                title: Text(
                  "TANCAR SESSIÓ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 147, 108),
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 255, 147, 108),
                ),
                onTap: ferLogout,
              ),
              SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }
}