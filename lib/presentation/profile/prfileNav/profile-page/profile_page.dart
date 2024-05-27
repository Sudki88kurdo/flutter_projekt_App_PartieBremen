import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_cubit.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../appStyle.dart';
import '../../../../appStyle.dart';
import '../../../../appStyle.dart';
import '../../../../appStyle.dart';
import '../../../../appStyle.dart';
import '../../../../appStyle.dart';
import '../../../../common/rounded_bottomNavigationBar.dart';
import '../../../../entities/user.dart';
import '../../../login-page/login_page_provider.dart';
import '../profileEdit-page/ProfileEdit_page.dart';
import '../myPoi-list/myPoi_list.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static User? user;

  setUser(User loginUser) {
    user = loginUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
      builder: (profilePageContext, profilePageState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profil',
              style: AppStyles.appBarTitleStyle,
            ),
            backgroundColor: AppStyles.buttonColor,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Icon(Icons.person_rounded, size: 32.0),
                      SizedBox(width: 8.0),
                      Text(
                        'Profile ${user?.name} ${user?.surname}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _buildCard(
                    context: context,
                    icon: Icons.person,
                    title: 'Profil change',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileEditPage(),
                        ),
                      );
                    },
                  ),
                  _buildCard(
                    context: context,
                    icon: Icons.share_location_outlined,
                    title: 'View POIs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPoiListPage(),
                        ),
                      );
                    },
                  ),

                  _buildCard(
                    context: context,
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () => _showLogoutDialog(
                        profilePageContext, profilePageState),
                  ),
                  _buildCard(
                    context: context,
                    icon: Icons.delete,
                    title: 'Account delete',
                    onTap: () => _showDeleteAccountDialog(
                        profilePageContext, profilePageState),
                  ),

                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 3),
        );
      },
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: ListTile(
          leading: Icon(icon, color: Colors.green),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
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
                backgroundColor:  AppStyles.buttonColor,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Bestätigen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor:  AppStyles.buttonColor,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _Logout(profileContext, profilePageState);
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
                backgroundColor:  AppStyles.buttonColor,
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Bestätigen', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.buttonColor,),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _DeleteAccount(profileContext, profilePageState);
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
    }).catchError((error) {
      print("Error during account deletion: $error");
    });
  }
}
