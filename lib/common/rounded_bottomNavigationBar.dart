import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/viewHome-page/HomeScreen.dart';
import '../appStyle.dart';
import '../presentation/viewHome-page/prfileNav/profile-page/profile_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int initialIndex;

  BottomNavigationBarWidget({this.initialIndex = 0}); // Optionaler Parameter mit Standardwert 0

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;


  @override
  void initState() {
    super.initState();
    // Setze den initialen Index auf den übergebenen initialIndex-Parameter oder auf 0, wenn kein Parameter übergeben wurde
    _selectedIndex = widget.initialIndex ?? 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) { // Wenn Profil-Tab ausgewählt ist
        Navigator.push( // Navigiere zur Profilseite
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
      // Optional: Wenn du auch zur Startseite navigieren möchtest, wenn der "Home"-Tab ausgewählt ist
      if (_selectedIndex == 0) {
        Navigator.push( // Navigiere zur Startseite
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
