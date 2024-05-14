import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/login-page/login_page_provider.dart';
import 'package:flutter_app/presentation/register-page/register_page_provider.dart';
import 'package:flutter_app/presentation/start-page/start_page_cubit.dart';
import 'package:flutter_app/presentation/start-page/start_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../appStyle.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startseite',style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: AppStyles.buttonColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/hintergrundBremen1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              BlocBuilder<StartPageCubit, StartPageState>(builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.pushNamed(LoginPageProvider.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  ),
                  child: const Text(
                    'Einloggen',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              },
              ),
              const SizedBox(height: 20),
              BlocBuilder<StartPageCubit, StartPageState>(builder: (context, state){
                return ElevatedButton(
                  onPressed: () {
                    context.pushNamed(RegisterPageProvider.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                  ),
                  child: const Text(
                    'Registrieren',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),

                );
              }),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
