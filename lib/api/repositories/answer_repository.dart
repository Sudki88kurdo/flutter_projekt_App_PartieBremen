import 'package:dio/dio.dart';
import 'package:flutter_app/api/clients/answer_client.dart';
import 'package:flutter_app/api/common/api_result.dart';
import 'package:flutter_app/api/repositories/base_repository.dart';
import 'package:flutter_app/entities/answer.dart';
import 'package:flutter_app/presentation/survey-page/common/answerBody.dart';

class AnswerRepository extends BaseRepository<AnswerClient> {
  AnswerRepository(String baseUrl, Dio dio)
      : super(client: AnswerClient(dio, baseUrl: baseUrl), dio: dio);

  Future<ApiResult<List<Answer>>> getAllFromUserToSurvey(
      {required String questionId, required String userId}) async {
    return execute(
      () =>
          client.getAllFromUserToSurvey(userId: userId, questionId: questionId),
    );
  }

  Future<ApiResult<List<Answer>>> getAllToQuestion(
      {required String questionId}) async {
    return execute(() => client.findAllToQuestion(questionId: questionId));
  }

  Future<ApiResult<Answer>> create(
      {required String titel,
      required String questionId,
      required String answererId,
      String? textAnswer,
      MultipleChoice? multipleChoiceAnswer,
      int? skalarAnswer}) async {
    return execute(
      () => client.create(
        titel: titel,
        questionId: questionId,
        answererId: answererId,
        textAnswer: textAnswer,
        multipleChoiceAnswer: multipleChoiceAnswer?.name,
        skalarAnswer: skalarAnswer,
      ),
    );
  }
}
