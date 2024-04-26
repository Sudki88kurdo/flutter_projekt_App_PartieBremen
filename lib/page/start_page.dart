
import 'package:flutter/material.dart';
import 'package:flutter_app/sharedModuls/HomeScreen.dart';
import '../appStyle.dart';
import 'login_page.dart';
import 'register_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   ///////
    return Scaffold(
      appBar: AppBar(
        title: Text('Startseite',style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: AppStyles.buttonColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/hintergrundBremen1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => LoginPage()),
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.buttonColor,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: Text(
                  'Einloggen',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyles.buttonColor,
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                ),
                child: Text(
                  'Registrieren',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),

              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
