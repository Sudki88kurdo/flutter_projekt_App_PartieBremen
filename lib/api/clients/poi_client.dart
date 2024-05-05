import 'package:dio/dio.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:retrofit/retrofit.dart';

part 'poi_client.g.dart';

@RestApi()
abstract class PoiClient {
  factory PoiClient(Dio dio, {String baseUrl}) = _PoiClient;

  @POST("/poi")
  Future<HttpResponse<Poi>> create({
    @Field("title") required String title,
    @Field("description") required String description,
    @Field("active") required bool active,
    @Field("creatorId") required String creatorId,
    @Field("latitude") required String latitude,
    @Field("longitude") required String longitude,
  });

  @GET("/poi/Only")
  Future<HttpResponse<List<Poi>>> getAllPois();
}
