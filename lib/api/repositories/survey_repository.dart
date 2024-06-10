import 'package:dio/dio.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';

import '../../entities/survey_response.dart';
import '../clients/survey_client.dart';

class SurveyRepository extends BaseRepository<SurveyClient> {
  SurveyRepository(String baseUrl, Dio dio)
      : super(client: SurveyClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<SurveyResponse>> findOne({required String surveyId}) async {
    return execute(() => client.findOne(surveyId: surveyId));
  }

  Future<ApiResult<List<SurveyResponse>>> getAllSurveys() async {
    return execute(() => client.getAllSurveys());
  }

  Future<ApiResult<List<SurveyResponse>>> getAllToPoiId(
      {required String poiId}) async {
    return execute(() => client.findAllToPoiId(poiId: poiId));
  }

  Future<ApiResult<SurveyResponse>> create({
    required String titel,
    required String beschreibung,
    required DateTime expiresAt,
    required String creatorId,
    required String poiId,
  }) async {
    return execute(
      () => client.create(
          titel: titel,
          beschreibung: beschreibung,
          expiresAt: expiresAt.toIso8601String(),
          userId: creatorId,
          poiId: poiId),
    );
  }

  Future<ApiResult<List<SurveyResponse>>> updateSurvey({
    required String surveyId,
    required String title,
    required String description,
    required String expiresAt,
    required String userId,
    required String poiId,
  }) async =>
      execute(
        () => client.updateSurvey(
            surveyId: surveyId,
            titel: title,
            beschreibung: description,
            expiresAt: expiresAt,
            userId: userId,
            poiId: poiId),
      );
}
