import 'package:dio/dio.dart';
import 'package:flutter_app/entities/petition_response.dart';
import 'package:retrofit/retrofit.dart';

part 'petition_client.g.dart';

extension Iso8061SerializableDateTime on DateTime {
  String toJson() => this.toIso8601String();
}

@RestApi()
abstract class PetitionClient {
  factory PetitionClient(Dio dio, {String baseUrl}) = _PetitionClient;

  @POST("/petition")
  Future<HttpResponse<PetitionResponse>> createPetition({
    @Field("titel") required String titel,
    @Field("description") required String description,
    @Field("expireAt") required String expireAt,
    @Field("goal") required int goal,
    @Field("poiId") required String poiId,
  });

  @GET("/petition/poi/{poiId}")
  Future<HttpResponse<List<PetitionResponse>>> getAllPetitions(
      {@Path("poiId") required String poiId});

  @GET("/petition/{id}")
  Future<HttpResponse<PetitionResponse>> findOne(
      {@Path("id") required String id});
}
