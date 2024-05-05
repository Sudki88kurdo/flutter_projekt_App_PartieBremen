import 'package:flutter/material.dart';
import '../appStyle.dart';
import '../presentation/viewHome-page/home_screen.dart';
import '../presentation/viewHome-page/profil.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int initialIndex;

  BottomNavigationBarWidget({this.initialIndex = 0});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileWidget()),
        );
      }
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
