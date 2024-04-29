import 'dart:async';
import 'package:dio/dio.dart';
import '../../entities/user.dart';
import '../clients/user_client.dart';
import '../common/api_result.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository<UserClient> {
  /// Constructor
  UserRepository(String baseUrl, Dio dio)
      : super(
          client: UserClient(dio, baseUrl: 'https://api.partibremen.student.28apps-software.de'),
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
        () => client.registerUser(email: email, name: name, surname: surname, password: password, verified: verified, dob: dob, active: true),
      );

  Future<ApiResult<User>> loginUser({
    required String email,
    required String password,
  }) async =>
      execute(
            () => client.loginUser(email: email, password: password),
      );
}
