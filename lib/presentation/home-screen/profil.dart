import 'package:flutter/material.dart';

import '../../common/rounded_bottomNavigationBar.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PartiBrmen Profil'),
          centerTitle: true,
          backgroundColor: Colors.green,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profil bearbeiten'),
                  onTap: () {
                    // Hier Profil bearbeiten Aktion einfügen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),

        ),
        bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 3),

      ),
    );
  }
}