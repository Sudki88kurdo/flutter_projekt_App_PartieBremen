import 'package:dio/dio.dart';
import 'package:flutter_app/entities/poi.dart';
import 'package:retrofit/retrofit.dart';

part 'poi_client.g.dart';

@RestApi()
abstract class PoiClient {
  factory PoiClient(Dio dio, {String baseUrl}) = _PoiClient;

  @GET("/poi/Only")
  Future<HttpResponse<List<Poi>>> getAllPois();
}
