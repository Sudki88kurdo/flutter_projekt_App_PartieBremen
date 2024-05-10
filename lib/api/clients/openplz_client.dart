import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_app/entities/street.dart';

part 'openplz_client.g.dart';

@RestApi(baseUrl: "https://openplzapi.org/de/")
abstract class OpenplzClient {
  factory OpenplzClient(Dio dio, {String baseUrl}) = _OpenplzClient;

  @GET("/de/Streets")
  Future<HttpResponse<List<Street>>> getStreets(
      @Query("name") String name,
      @Query("locality") String locality,
      @Query("page") int page,
      @Query("pageSize") int pageSize);
}
