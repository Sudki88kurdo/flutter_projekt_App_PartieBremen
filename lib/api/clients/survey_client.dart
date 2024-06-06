import 'package:dio/dio.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:retrofit/retrofit.dart';

part 'survey_client.g.dart';

extension Iso8061SerializableDateTime on DateTime {
  String toJson() => this.toIso8601String();
}

@RestApi()
abstract class SurveyClient {
  factory SurveyClient(Dio dio, {String baseUrl}) = _SurveyClient;

  @POST("/survey")
  Future<HttpResponse<SurveyResponse>> create({
    @Field("titel") required String titel,
    @Field("beschreibung") required String beschreibung,
    @Field("expiresAt") required String expiresAt,
    @Field("userId") required String userId,
    @Field("poiId") required String poiId,
  });

  @GET("/survey")
  Future<HttpResponse<List<SurveyResponse>>> getAllSurveys();

  @GET("/survey/poi/{poiId}")
  Future<HttpResponse<List<SurveyResponse>>> findAllToPoiId(
      {@Path("poiId") required String poiId});

  @GET("/survey/{surveyId}")
  Future<HttpResponse<SurveyResponse>> findOne(
      {@Path("surveyId") required String surveyId});

  @PUT("/survey/{surveyId}")
  Future<HttpResponse<List<SurveyResponse>>> updateSurvey({
    @Path("surveyId") required String surveyId,
    @Field("titel") required String titel,
    @Field("beschreibung") required String beschreibung,
    @Field("expiresAt") required String expiresAt,
    @Field("userId") required String userId,
    @Field("poiId") required String poiId,
  });
}
