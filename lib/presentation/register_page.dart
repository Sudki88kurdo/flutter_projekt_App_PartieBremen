import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entities/user.dart';
import '../api/clients/user_client.dart';
import 'login-page/login_page.dart';
import '../appStyle.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserClient _userClient = new UserClient(new Dio());
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrieren',
          style: AppStyles.appBarTitleStyle,
        ),
        backgroundColor: AppStyles.buttonColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/hintergrundBremen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'Vorname',
                fillColor: AppStyles.textFieldFillColor,
                filled: true,
                labelStyle: AppStyles.labelTextStyle(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: AppStyles.textFieldFillColor,
                filled: true,
                labelStyle: AppStyles.labelTextStyle(),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Geburtsdatum auswählen',
                    fillColor: AppStyles.textFieldFillColor,
                    filled: true,
                    labelStyle: AppStyles.labelTextStyle(),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}'
                        : '',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-Mail-Adresse',
                fillColor: AppStyles.textFieldFillColor,
                filled: true,
                labelStyle: AppStyles.labelTextStyle(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Passwort',
                fillColor: AppStyles.textFieldFillColor,
                filled: true,
                labelStyle: AppStyles.labelTextStyle(),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                // Erstelle ein User-Objekt mit den eingegebenen Daten
                User user = User(
                  name: firstNameController.text,
                  surname: lastNameController.text,
                  dob: _selectedDate,
                  email: emailController.text,
                  password: passwordController.text,
                  verified: true, // Annahme: Der Benutzer wird als verifiziert markiert
                );
                bool success = (await _userClient.registerUser(
                  name: firstNameController.text,
                  surname: lastNameController.text,
                  dob: _selectedDate,
                  email: emailController.text,
                  password: passwordController.text,
                  verified: true,)) as bool;
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Fehler bei der Registrierung')));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.buttonColor,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: Text(
                'Registrieren',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
