import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_cubit.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/rounded_bottomNavigationBar.dart';
import '../../../login-page/login_page_provider.dart';
import '../profileEdit-page/ProfileEditWidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
        builder: (profilePageContext, profilePageState) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profil'),
          centerTitle: true,
          backgroundColor: Colors.green,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Persönliche Daten bearbeiten'),
                  onTap: () {
                    // Öffne ProfileEditWidget
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileEditWidget()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () =>
                      _showLogoutDialog(profilePageContext, profilePageState),
                ),
                const SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Konto löschen'),
                  onTap: () => _showDeleteAccountDialog(
                      profilePageContext, profilePageState),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 3),
      );
    });
  }

  void _showLogoutDialog(
      BuildContext profileContext, ProfilePageState profilePageState) {
    showDialog(
      context: profileContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Möchten Sie sich wirklich ausloggen?'),
          actions: <Widget>[
            TextButton(
              child: Text('Abbrechen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Schließt den Dialog
              },
            ),
            TextButton(
              child: Text('Bestätigen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Schließt den Dialog
                _Logout(
                    profileContext, profilePageState); // Führt den Logout durch
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog(
      BuildContext profileContext, ProfilePageState profilePageState) {
    showDialog(
      context: profileContext,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Konto löschen'),
          content: Text('Möchten Sie sich wirklich deinen Konto löschen?'),
          actions: <Widget>[
            TextButton(
              child: Text('Abbrechen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Schließt den Dialog
              },
            ),
            TextButton(
              child: Text('Bestätigen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Schließt den Dialog
                _DeleteAccount(
                    profileContext, profilePageState); // Führt den Logout durch
              },
            ),
          ],
        );
      },
    );
  }

  void _Logout(
      BuildContext profileContext, ProfilePageState profilePageState) async {
    await profileContext.read<ProfilePageCubit>().logoutUser().then((value) {
      profileContext.pushNamed(LoginPageProvider.routeName);
    }).catchError((error) {
      print("Error during account logout: $error");
    });
  }

  void _DeleteAccount(
      BuildContext profileContext, ProfilePageState profilePageState) async {
    await profileContext.read<ProfilePageCubit>().deleteUser().then((value) {
      print("Account deleted");
      // Optionale Weiterleitung oder Benachrichtigung des Benutzers
      //profileContext.pushNamed(LoginPageProvider.routeName);
    }).catchError((error) {
      print("Error during account deletion: $error");
    });
  }
}
