import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/question_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/question.dart';

class QuestionRepository extends BaseRepository<QuestionClient> {
  QuestionRepository(String baseUrl, Dio dio)
      : super(client: QuestionClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<List<Question>>> findQuestionsToSurvey(
      {required String surveyId}) async {
    return execute(() => client.findAllFromSurvey(id: surveyId));
  }

  Future<ApiResult<Question>> createQuestion({
    required String surveyId,
    required String fragestellung,
    required QuestionType type,
  }) async {
    return execute(
      () => client.createQuestion(
        surveyId: surveyId,
        fragestellung: fragestellung,
        type: type.name,
      ),
    );
  }
}
