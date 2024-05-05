import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page_cubit.dart';
import 'package:flutter_app/presentation/login-page/login_page_state.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/screen_status.dart';
import '../viewHome-page/home_screen.dart';
import '../../appStyle.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPageCubit, LoginPageState>(builder: (loginPageContext, loginPageState) {
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
              loginPageContext.pushNamed(StartPageProvider.routeName);
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hintergrundBremen2.jpg'),
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
              BlocBuilder<LoginPageCubit, LoginPageState>(builder: (loginPageContext, loginPageState) {
                return TextField(
                  controller: _passwordController,
                  obscureText: !loginPageState.passwordVisible,
                  decoration: InputDecoration(
                      labelText: 'Passwort',
                      fillColor: AppStyles.textFieldFillColor,
                      labelStyle: AppStyles.labelTextStyle(),
                      filled: true,
                      suffixIcon: BlocBuilder<LoginPageCubit, LoginPageState>(builder: (loginContext, loginState) {
                        return IconButton(
                          icon: Icon(
                            loginPageState.passwordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            loginPageContext.read<LoginPageCubit>().updatePasswordVisible();
                          },
                        );
                      })
                  ),
                );
              }),
              const SizedBox(height: 20),
              BlocBuilder<LoginPageCubit, LoginPageState>(builder: (loginContext, loginState) {
                return loginState.status != const ScreenStatus.pure()
                    ?  const CircularProgressIndicator()
                    :  ElevatedButton(
                  onPressed: () => _login(loginContext, loginPageState),
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
    });
  }
  void _login(BuildContext loginContext, LoginPageState loginPageState) async {

    await loginContext.read<LoginPageCubit>().login(
      email: _usernameController.text,
      password: _passwordController.text,
    ).then((value) => {
    // Navigiere zur Hauptseite nach erfolgreicher Anmeldung
    if(value) {
        loginContext.pushNamed(HomeScreen.routeName)
    } else {
      ScaffoldMessenger.of(loginContext).showSnackBar(const SnackBar(
      content: Text('Fehler bei der Registrierung')))
    }
    });
  }
}
