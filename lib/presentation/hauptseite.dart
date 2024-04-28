import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        child: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,   // Leerer AppBar, um den Zurück-Pfeil zu entfernen
        ),
        preferredSize: Size.fromHeight(0), //  auf 0 setzen, um die AppBar auszublenden

      ),
      body: Center(
        child: Text('Willkommen! Sie sind erfolgreich angemeldet.'),
      ),
    );
  }
}


