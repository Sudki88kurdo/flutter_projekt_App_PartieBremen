import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/viewHome-page/prfileNav/profileEdit-page/profileEdit_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../appStyle.dart';
import '../../../../common/screen_status.dart';
import '../../../../entities/user.dart';
import '../../../login-page/login_page_state.dart';
import 'profileEdit_page_state.dart';

class ProfileEditWidget extends StatelessWidget {
  static User? user1;

  setUser(User user) {
    user1 = user;
  }

  ProfileEditWidget({Key? key}) : super(key: key);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text=user1!.name!;
    _surnameController.text=user1!.surname!;
    _dobController.text=user1!.dob!.toIso8601String();
    _emailController.text=user1!.email!;


    return BlocBuilder<ProfileEditPageCubit, ProfileEditPageState>(
      builder: (profileEditPageContext, profileEditPageState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profil bearbeiten'),
            centerTitle: true,
            backgroundColor: Colors.green,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                    labelText: 'Nachname',
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(profileEditPageContext),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Geburtsdatum auswählen',
                        fillColor: AppStyles.textFieldFillColor,
                        filled: true,
                        labelStyle: AppStyles.labelTextStyle(),
                      ),
                      controller: TextEditingController(
                        text: profileEditPageState.pickedDate != null
                            ? '${profileEditPageState.pickedDate!.day}.${profileEditPageState.pickedDate!
                            .month}.${profileEditPageState.pickedDate!.year}'
                            : '',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Passwort',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                profileEditPageState.status != const ScreenStatus.pure()
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () => _updateUser(profileEditPageContext,profileEditPageState),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  ),
                  child: Text(
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      await context.read<ProfileEditPageCubit>().updatePickedDate(picked);
    }
  }


  void _updateUser(BuildContext updateUserContext, ProfileEditPageState profileEditPageSt)
  async {


    await updateUserContext.read<ProfileEditPageCubit>().updateUser(
      id: user1!.id!,
      name: _nameController.text,
      surname:  _surnameController.text,
      //dob:profileEditPageSt.pickedDate!,
      email: _emailController.text,
      password: _passwordController.text,
      verified:true,
      role:1,

    );

  }
}
