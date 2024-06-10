import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/main.dart';

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
    required int expiresAt,
    required String creatorId,
    required String poiId,
  }) async {
    var date = DateTime.now().add(Duration(days: expiresAt));
    var dateFormatted = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(date);

    return execute(
        () => client.create(
            titel: titel,
            beschreibung: beschreibung,
            expiresAt: dateFormatted,
            userId: creatorId,
            poiId: poiId
        ),
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
            poiId: poiId
        ),
      );
}
