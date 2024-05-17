import 'dart:async';
import 'package:dio/dio.dart';
import '../../entities/user.dart';
import '../clients/user_client.dart';
import '../common/api_result.dart';
import '../common/network_exceptions.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository<UserClient> {
  /// Constructor
  UserRepository(String baseUrl, Dio dio)
      : super(
          client: UserClient(dio, baseUrl: baseUrl),
          dio: dio,
        );

  Future<ApiResult<User>> registerUser({
    required String email,
    required String name,
    required String surname,
    required String password,
    required bool verified,
    required DateTime dob,
    required bool active,
  }) async =>
      execute(
        () => client.registerUser(
            email: email,
            name: name,
            surname: surname,
            password: password,
            verified: verified,
            dob: dob.toIso8601String(),
            active: true),
      );
   User? loggedInUser;
  Future<ApiResult<User>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.loginUser(email: email, password: password);


     loggedInUser = response.data; // Setzen des angemeldeten Benutzers
      return ApiResult.success(data: loggedInUser!);
    } on NetworkExceptions catch (error) {
      return ApiResult.failure(error: error);
    }
  }

  Future<ApiResult<User>> updateUser({
    required String id,
    required String name,
    required String surname,
    required DateTime dob,
    required String email,
    required String password,
    required bool verified,
    required int role,


  }) async {
    try {
      final response = await client.updateUser(id, name: name, surname: surname, email: email, password: password,verified:verified,role:role, dob: dob,);


      loggedInUser = response.data; // Setzen des angemeldeten Benutzers
      print(loggedInUser);

      return ApiResult.success(data: loggedInUser!);
    } on NetworkExceptions catch (error) {
      return ApiResult.failure(error: error);
    }}


   Future<void> logoutUser() async {
    try {
      final loggedInUserId = loggedInUser?.id; // Annahme: loggedInUser hat ein 'id' Feld
      if (loggedInUserId != null) {
        await client.logoutUser(loggedInUserId);
        loggedInUser = null; // Benutzer abmelden
      }
    } on NetworkExceptions catch (error) {
      // Fehlerbehandlung
    }
  }
  Future<void> deleteUser() async {
    try {
      final loggedInUserId = loggedInUser?.id; // Annahme: loggedInUser hat ein 'id' Feld
      if (loggedInUserId != null) {
        await client.deleteUser(loggedInUserId);
        //loggedInUser = null; // Benutzer abmelden
        print("User deleted successfully");
      } else {
        print("No user is logged in.");
      }
    } catch (error) {
      print("Error deleting user: $error");
      // Fehlerbehandlung
    }
  }
}
