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
        title: const Text(
          'Startseite',
          style: AppStyles.appBarTitleStyle,
        ),
        backgroundColor: AppStyles.buttonColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hintergrundBremen1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              BlocBuilder<StartPageCubit, StartPageState>(
                builder: (context, state) {
                  return SizedBox(
                    width: AppStyles.buttonWidth, // Use the fixed width from AppStyles
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(LoginPageProvider.routeName);
                      },
                      style: AppStyles.buttonStyle(),
                      child: const Text(
                        'Einloggen',
                        style: AppStyles.commonTextStyle,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<StartPageCubit, StartPageState>(
                builder: (context, state) {
                  return SizedBox(
                    width: AppStyles.buttonWidth, // Use the fixed width from AppStyles
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(RegisterPageProvider.routeName);
                      },
                      style: AppStyles.buttonStyle(),
                      child: const Text(
                        'Registrieren',
                        style: AppStyles.commonTextStyle,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
