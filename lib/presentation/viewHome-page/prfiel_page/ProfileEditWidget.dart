import 'package:flutter/material.dart';
import '../../../appStyle.dart';
import '../../../entities/user.dart';

class ProfileEditWidget extends StatelessWidget {
 static User? user1;
  setUser(User user) {
    user1 = user;

    print("*****************");
    print(user1);
  }

  ProfileEditWidget({Key? key}) : super(key: key);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _nameController.text=user1!.name!;
    _surnameController.text=user1!.surname!;
    _dobController.text=user1!.dob!.toString();
    _emailController.text=user1!.email!;
    _passwordController.text=user1!.password!;

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
                print(user1);


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

