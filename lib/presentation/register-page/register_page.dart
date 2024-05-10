import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/home-screen/home_screen.dart';
import 'package:flutter_app/presentation/register-page/register_page_cubit.dart';
import 'package:flutter_app/presentation/register-page/register_page_state.dart';
import 'package:flutter_app/presentation/start-page/start_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../appStyle.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                const SizedBox(height: 20),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    fillColor: AppStyles.textFieldFillColor,
                    filled: true,
                    labelStyle: AppStyles.labelTextStyle(),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(registerPageContext),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Geburtsdatum auswählen',
                        fillColor: AppStyles.textFieldFillColor,
                        filled: true,
                        labelStyle: AppStyles.labelTextStyle(),
                      ),
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
                  decoration: InputDecoration(
                    labelText: 'E-Mail-Adresse',
                    fillColor: AppStyles.textFieldFillColor,
                    filled: true,
                    labelStyle: AppStyles.labelTextStyle(),
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                ElevatedButton(
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
                            active: true)
                        .then((value) => {
                              if (value)
                                {
                                  registerPageContext
                                      .pushNamed(HomeScreen.routeName)
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Fehler bei der Registrierung')))
                                }
                            });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  ),
                  child: const Text(
                    'Registrieren',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
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
