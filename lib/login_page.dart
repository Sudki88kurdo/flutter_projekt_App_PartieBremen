import 'package:flutter/material.dart';
import 'api_service.dart'; // Importiere die API-Verbindung
import 'HomeScreen.dart';
import 'appStyle.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  void _login() async {
    setState(() {
      _isLoading = true;
      print("stany ok");
    });

    bool success = await APIService.loginUser(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      // Navigiere zur Hauptseite nach erfolgreicher Anmeldung
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Fehlermeldung anzeigen oder erneut versuchen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fehler beim Einloggen')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
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
            image: AssetImage('lib/assets/hintergrundBremen2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Benutzername',
                fillColor: AppStyles.textFieldFillColor,
                labelStyle: AppStyles.labelTextStyle(),
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Passwort',
                fillColor: AppStyles.textFieldFillColor,
                labelStyle: AppStyles.labelTextStyle(),
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.buttonColor,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: Text(
                'Einloggen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
