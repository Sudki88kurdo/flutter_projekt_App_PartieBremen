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

  Future<ApiResult<SurveyResponse>> create({
    required String titel,
    required String beschreibung,
    required String expiresAt,
    required String creatorId,
    required double poiId,
  }) async =>
      execute(
        () => client.create(
            titel: titel,
            beschreibung: beschreibung,
            expiresAt: DateTime.now().add(const Duration(days: 90)).toString(),
            userId: creatorId,
            poiId: poiId),
      );
}
