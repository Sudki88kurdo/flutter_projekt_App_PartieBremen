import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app/app_view_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/repositories/user_repository.dart';
import 'presentation/start-page/start_page.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final dio = Dio(); // Provide a dio instance
  //dio.options.headers['Demo-Header'] = 'demo header'; // config your dio headers globally

  runApp(EasyLocalization(supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'), path: 'assets/translations', child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: UserRepository('https://api.partibremen.student.28apps-software.de/', dio)),
        ],
        child: const AppViewProvider(),)));
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }

}