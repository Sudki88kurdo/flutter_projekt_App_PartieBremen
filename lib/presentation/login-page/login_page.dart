import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page_cubit.dart';
import 'package:flutter_app/presentation/login-page/login_page_state.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myComments-list/myComments_list.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../appStyle.dart';
import '../../common/screen_status.dart';
import '../../entities/user.dart';
import '../home-screen/home_screen.dart';
import '../profile/prfileNav/profileEdit-page/ProfileEdit_page.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'profile-page';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  late User user;
  ProfileEditPage pe = ProfileEditPage();
  ProfilePage profilePage = ProfilePage();
  MyPoiListPage myPois = MyPoiListPage();
  MyCommentsListPage myComments = MyCommentsListPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (loginPageContext, loginPageState) {
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Willkommen zurück!',
                          style: AppStyles.commonTextStyle,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _usernameController,
                          decoration: AppStyles.textFieldDecoration('Benutzername', Icons.person),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<LoginPageCubit, LoginPageState>(
                            builder: (loginPageContext, loginPageState) {
                              return TextField(
                                controller: _passwordController,
                                obscureText: !loginPageState.passwordVisible,
                                decoration: AppStyles.textFieldDecoration('Passwort', Icons.lock).copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      loginPageState.passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      loginPageContext.read<LoginPageCubit>().updatePasswordVisible();
                                    },
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 20),
                        BlocBuilder<LoginPageCubit, LoginPageState>(
                          builder: (loginContext, loginState) {
                            return loginState.status != const ScreenStatus.pure()
                                ? const CircularProgressIndicator()
                                : SizedBox(
                              width: AppStyles.buttonWidth, // Use the fixed width from AppStyles
                              child: ElevatedButton(
                                onPressed: () => _login(loginContext, loginPageState),
                                style: AppStyles.buttonStyle(),
                                child: const Text(
                                  'Einloggen',
                                  style: AppStyles.commonTextStyle,
                                ),

                              ),

                            );

                          },
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> _login(
    BuildContext loginContext,
    LoginPageState loginPageState,
  ) async {
    final success = await loginContext.read<LoginPageCubit>().login(
          email: _usernameController.text,
          password: _passwordController.text,
          context: loginContext,
        );
    if (success) {
      user = loginPageState.user!;
      pe.setUser(user);
      profilePage.setUser(user);
      myPois.setUser(user);
      myComments.setUser(user);

      loginContext.pushNamed(HomeScreen.routeName);
    } else {
      ScaffoldMessenger.of(loginContext).showSnackBar(
        const SnackBar(content: Text('Fehler bei der Anmeldung')),
      );
    }
  }
}
