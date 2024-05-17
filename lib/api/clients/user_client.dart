import 'package:dio/dio.dart';
import 'package:flutter_app/entities/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_client.g.dart';

extension Iso8061SerializableDateTime on DateTime {
  String toJson() => this.toIso8601String();
}

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST("/user")
  Future<HttpResponse<User>> registerUser({
    @Field("name") required String name,
    @Field("surname") required String surname,
    @Field("dob") required String dob,
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

  @PUT("/user/{id}")
  Future<HttpResponse<User>> updateUser(
    @Path("id") String id, {
    @Field("name") required String name,
    @Field("surname") required String surname,
    @Field("dob") required DateTime dob,
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("verified") required bool verified,
    @Field("role") required int role,
  });

  @POST("/user/logout/{id}")
  Future<void> logoutUser(@Path("id") String id);

  @DELETE("/user/delete/{id}")
  Future<void> deleteUser(@Path("id") String id);
}
