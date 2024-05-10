import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/home-screen/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../appStyle.dart';

class PoiView extends StatelessWidget {
  const PoiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Titel des Poi..',
          style: AppStyles.appBarTitleStyle,
        ),
        backgroundColor: AppStyles.buttonColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pushNamed(HomeScreen.routeName);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(child: null),
    );
  }
}
