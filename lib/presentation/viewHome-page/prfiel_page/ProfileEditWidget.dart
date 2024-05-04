import 'package:flutter/material.dart';

import '../../../appStyle.dart';

class ProfileEditWidget extends StatefulWidget {
  @override
  _ProfileEditWidgetState createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Profil bearbeiten'),
        centerTitle: true,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 20,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Nachname',
              ),
            ),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Geburtsdatum',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Passwort',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hier kannst du die Werte speichern oder verarbeiten
                String name = _nameController.text;
                String surname = _surnameController.text;
                String dob = _dobController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                // Beispiel: Ausgabe der eingegebenen Werte
                print('Name: $name');
                print('Nachname: $surname');
                print('Geburtsdatum: $dob');
                print('E-Mail: $email');
                print('Passwort: $password');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.buttonColor,
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              ),
              child: Text('Speichern',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

