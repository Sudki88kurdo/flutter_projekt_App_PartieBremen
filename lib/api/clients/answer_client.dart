import 'package:dio/dio.dart';
import 'package:flutter_app/entities/answer.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:retrofit/retrofit.dart';

part 'answer_client.g.dart';

extension Iso8061SerializableDateTime on DateTime {
  String toJson() => this.toIso8601String();
}

@RestApi()
abstract class AnswerClient {
  factory AnswerClient(Dio dio, {String baseUrl}) = _AnswerClient;

  @POST("/answer")
  Future<HttpResponse<Answer>> create({
    @Field("titel") required String titel,
    @Field("questionId") required String questionId,
    @Field("answererId") required String answererId,
    @Field("multipleChoiceAnswer") String? multipleChoiceAnswer,
    @Field("skalarAnswer") int? skalarAnswer,
    @Field("textAnswer") String? textAnswer,
  });

  @GET("/answer/user/{userId}/question/{questionId}")
  Future<HttpResponse<List<Answer>>> getAllFromUserToSurvey({
    @Path("userId") required String userId,
    @Path("questionId") required String questionId,
  });

  @GET("/answer/question/{questionId}")
  Future<HttpResponse<List<Answer>>> findAllToQuestion(
      {@Path("questionId") required String questionId});
}
