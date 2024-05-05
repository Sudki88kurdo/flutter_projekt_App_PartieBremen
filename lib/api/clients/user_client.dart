import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_app/entities/user.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST("/user")
  Future<HttpResponse<User>> registerUser({
    @Field("name") required String name,
    @Field("surname") required String surname,
    @Field("dob") required DateTime dob,
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("verified") required bool verified,
    @Field("active") required bool active,
  });

  @POST("/user/login")
  Future<HttpResponse<User>> loginUser({
    @Field("email") required String email,
    @Field("password") required String password,
  });
}
