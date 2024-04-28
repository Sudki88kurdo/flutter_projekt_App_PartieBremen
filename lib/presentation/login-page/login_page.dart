import 'package:flutter/material.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/presentation/login-page/login_page_cubit.dart';
import 'package:flutter_app/presentation/login-page/login_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../hauptseite.dart';
import '../../appStyle.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  void _login(LoginPageCubit loginPageCubit) async {
    setState(() {
      _isLoading = true;
    });

    ApiResult success = (await loginPageCubit.login(
      email: _usernameController.text,
      password: _passwordController.text,
    ));

    setState(() {
      _isLoading = false;
    });

    if (success != null) {
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
        title: const Text(
          'Login',
          style: AppStyles.appBarTitleStyle,
        ),
        backgroundColor: AppStyles.buttonColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : BlocBuilder<LoginPageCubit, LoginPageState>(builder: (loginContext, loginState) {
                  return ElevatedButton(
            onPressed: () => _login(loginContext.read<LoginPageCubit>()),
            style: ElevatedButton.styleFrom(
            backgroundColor: AppStyles.buttonColor,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
            child: const Text(
            'Einloggen',
            style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            );})
          ],
        ),
      ),
    );
  }
}
