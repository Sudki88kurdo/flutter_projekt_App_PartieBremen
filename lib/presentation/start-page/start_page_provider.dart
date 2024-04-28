import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/start-page/start_page.dart';

/// Main entry point of the application if the user is authenticated.
class StartPageProvider extends StatelessWidget {
  static const String routeName = 'start-page';
  const StartPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return StartPage();
  }
}
