import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/openplz_repository.dart';
import 'package:flutter_app/api/repositories/petition_repository.dart';
import 'package:flutter_app/api/repositories/poi_repository.dart';
import 'package:flutter_app/api/repositories/signature_repository.dart';
import 'package:flutter_app/api/repositories/survey_repository.dart';
import 'package:flutter_app/api/repositories/voting_repository.dart';
import 'package:flutter_app/presentation/app/app_view_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'api/repositories/comment_repository.dart';
import 'api/repositories/user_repository.dart';
import 'presentation/start-page/start_page.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const baseUrl = 'https://api.partibremen.student.28apps-software.de/';
  const openPlzBaseUrl = 'https://openplzapi.org/';
  final baseOptions = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'client-type': 'app',
    },
    validateStatus: (status) {
      return status! < 400;
    },
    followRedirects: false,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final dio = Dio(baseOptions); // Provide a dio instance
  //dio.options.headers['Demo-Header'] = 'demo header'; // config your dio headers globally

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: UserRepository(baseUrl, dio)),
          RepositoryProvider.value(value: PoiRepository(baseUrl, dio)),
          RepositoryProvider.value(value: CommentRepository(baseUrl, dio)),
          RepositoryProvider.value(value: VotingRepository(baseUrl, dio)),
          RepositoryProvider.value(value: SurveyRepository(baseUrl, dio)),
          RepositoryProvider.value(value: PetitionRepository(baseUrl, dio)),
          RepositoryProvider.value(value: SignatureRepository(baseUrl, dio)),
          RepositoryProvider.value(
              value: OpenplzRepository(openPlzBaseUrl, dio)),
        ],
        child: const AppViewProvider(),
      )));
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
