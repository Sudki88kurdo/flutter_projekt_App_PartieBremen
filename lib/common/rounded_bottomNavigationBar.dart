import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_cubit.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../appStyle.dart';
import '../presentation/viewHome-page/home_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int initialIndex;

  BottomNavigationBarWidget({this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppStyles.buttonColor,
            ),
            // BottomNavigationBarItem für Favoriten entfernt
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add point',
              backgroundColor: AppStyles.buttonColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Benachrichtigungen',
              backgroundColor: AppStyles.buttonColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              backgroundColor: AppStyles.buttonColor,
            ),
          ],
          currentIndex: state.selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index) => _onItemTapped(index, context),
        );
      },
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    context.read<HomePageCubit>().updateIndex(index);
    if (index == 3) {
      //context.pushNamed(
      //  context,
      //  MaterialPageRoute(builder: (context) => ProfileWidget()),
      //);
    }
    if (index == 0) {
      context.pushNamed(
        HomeScreen.routeName,
      );
    }
  }
}
