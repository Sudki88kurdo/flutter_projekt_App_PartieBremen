import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(0),

        child: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,   // Leerer AppBar, um den Zurück-Pfeil zu entfernen
        ), //  auf 0 setzen, um die AppBar auszublenden

      ),
      body: const Center(
        child: Text('Willkommen! Sie sind erfolgreich angemeldet.'),
      ),
    );
  }
}


