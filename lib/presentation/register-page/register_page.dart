import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/home-screen/home_screen.dart';
import 'package:flutter_app/presentation/register-page/register_page_cubit.dart';
import 'package:flutter_app/presentation/register-page/register_page_state.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../appStyle.dart';
import '../app/app_cubit.dart';
import '../profile/prfileNav/myComments-list/myComments_list.dart';
import '../profile/prfileNav/myPoi-list/myPoi_list.dart';
import '../profile/prfileNav/profile-page/profile_page.dart';
import '../profile/prfileNav/profileEdit-page/ProfileEdit_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ProfileEditPage pe = ProfileEditPage();
  ProfilePage profilePage = ProfilePage();
  MyPoiListPage myPois = MyPoiListPage();
  MyCommentsListPage myComments = MyCommentsListPage();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterPageCubit, RegisterPageState>(
      builder: (registerPageContext, registerPageState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Registrieren',
              style: AppStyles.appBarTitleStyle,
            ),
            backgroundColor: AppStyles.buttonColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                registerPageContext.pushNamed(StartPageProvider.routeName);
              },
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hintergrundBremen.jpg'),
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
                        'Registrieren Sie sich',
                        style: AppStyles.commonTextStyle,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: firstNameController,
                        decoration: AppStyles.textFieldDecoration(
                            'Vorname', Icons.person),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: lastNameController,
                        decoration:
                            AppStyles.textFieldDecoration('Name', Icons.person),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => _selectDate(registerPageContext),
                        child: AbsorbPointer(
                          child: TextFormField(
                            decoration: AppStyles.textFieldDecoration(
                                'Geburtsdatum auswählen', Icons.calendar_today),
                            controller: TextEditingController(
                              text: registerPageState.pickedDate != null
                                  ? '${registerPageState.pickedDate!.day}.${registerPageState.pickedDate!.month}.${registerPageState.pickedDate!.year}'
                                  : '',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: AppStyles.textFieldDecoration(
                            'E-Mail-Adresse', Icons.email),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: AppStyles.textFieldDecoration(
                            'Passwort', Icons.lock),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: AppStyles.buttonWidth,
                        // Use the fixed width from AppStyles
                        child: ElevatedButton(
                          onPressed: () async {
                            await registerPageContext
                                .read<RegisterPageCubit>()
                                .register(
                                  name: firstNameController.text,
                                  surname: lastNameController.text,
                                  dob: registerPageState.pickedDate!,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  verified: true,
                                  active: true,
                                  context: registerPageContext,
                                )
                                .then((value) {
                              if (value) {
                                registerPageContext
                                    .pushNamed(HomeScreen.routeName);
                                var user = registerPageContext
                                    .read<AppCubit>()
                                    .state
                                    .user!;
                                pe.setUser(user);
                                profilePage.setUser(user);
                                myPois.setUser(user);
                                myComments.setUser(user);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Fehler bei der Registrierung',
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          style: AppStyles.buttonStyle(),
                          child: const Text(
                            'Registrieren',
                            style: AppStyles.commonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) async {
      if (value != null) {
        await context.read<RegisterPageCubit>().updatePickedDate(value);
      }
    });
  }
}
