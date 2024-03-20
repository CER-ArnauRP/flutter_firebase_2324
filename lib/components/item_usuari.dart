import 'package:flutter/material.dart';

class ItemUsuari extends StatelessWidget {

  final String text;
  final void Function()? onTap;

  const ItemUsuari({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 147, 108),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 25,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Icona.
            const Icon(Icons.person),

            const SizedBox(width: 10,),

            // Nom usuari.
            Text(text),
          ],
        ),
      ),
    );
  }
}