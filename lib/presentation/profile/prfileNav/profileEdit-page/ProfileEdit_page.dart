import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profileEdit-page/profileEdit_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../appStyle.dart';
import '../../../../common/screen_status.dart';
import '../../../../entities/user.dart';
import 'profileEdit_page_state.dart';

class ProfileEditPage extends StatelessWidget {
  static User? user1;

  setUser(User user) {
    user1 = user;
  }

  ProfileEditPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = user1?.name ?? '';
    _surnameController.text = user1?.surname ?? '';
    _dobController.text = user1?.dob?.toIso8601String() ?? '';
    _emailController.text = user1?.email ?? '';

    return BlocBuilder<ProfileEditPageCubit, ProfileEditPageState>(
      builder: (profileEditPageContext, profileEditPageState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profil bearbeiten',
              style: AppStyles.appBarTitleStyle,
            ),
            backgroundColor: AppStyles.buttonColor,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfileCard(),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nameController,
                  label: 'Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _surnameController,
                  label: 'Nachname',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(profileEditPageContext),
                  child: AbsorbPointer(
                    child: _buildTextField(
                      controller: _dobController,
                      label: 'Geburtsdatum auswählen',
                      icon: Icons.calendar_today,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _emailController,
                  label: 'E-Mail',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Passwort',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                profileEditPageState.status != const ScreenStatus.pure()
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  onPressed: () => _updateUser(
                      profileEditPageContext, profileEditPageState),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Speichern',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileCard() {
    // Extrahiere die Initialen
    final initials = (user1 != null)
        ? '${user1!.name?.isNotEmpty == true ? user1!.name![0] : ''}${user1!.surname?.isNotEmpty == true ? user1!.surname![0] : ''}'
        : '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppStyles.buttonColor,
            child: Text(
              initials.toUpperCase(),
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        fillColor: AppStyles.textFieldFillColor,
        filled: true,
        labelStyle: AppStyles.labelTextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscureText,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dobController.text = picked.toIso8601String();
      await context.read<ProfileEditPageCubit>().updatePickedDate(picked);
    }
  }

  void _updateUser(BuildContext updateUserContext,
      ProfileEditPageState profileEditPageSt) async {
    if(_passwordController.text.isEmpty){
      _showDialog(updateUserContext);
    }else{
      await updateUserContext.read<ProfileEditPageCubit>().updateUser(
        id: user1!.id!,
        name: _nameController.text,
        surname: _surnameController.text,
        dob: profileEditPageSt.pickedDate!,
        email: _emailController.text,
        password: _passwordController.text,
        verified: true,
        role: 1,
      );
    }
  }
  void _showDialog(
      BuildContext profileEditPageContaxt) {
    showDialog(
      context: profileEditPageContaxt,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Konto löschen'),
          content: Text('Sie müssen Passwort eingeben, um Profile zu bearbeiten'),
          actions: <Widget>[
            TextButton(

              child: Text('Ok', style: AppStyles.commonTextStyle,),
              style: ElevatedButton.styleFrom(
                backgroundColor:  AppStyles.buttonColor,
              ),

              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
