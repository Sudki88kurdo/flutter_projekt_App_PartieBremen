import 'package:dio/dio.dart';
import 'package:flutter_app/entities/question.dart';
import 'package:retrofit/retrofit.dart';

part 'question_client.g.dart';

@RestApi()
abstract class QuestionClient {
  factory QuestionClient(Dio dio, {String baseUrl}) = _QuestionClient;

  @POST("/question")
  Future<HttpResponse<Question>> createQuestion({
    @Field("type") required String type,
    @Field("fragestellung") required String fragestellung,
    @Field("surveyId") String? surveyId,
  });

  @GET("/question/surveyId/{id}")
  Future<HttpResponse<List<Question>>> findAllFromSurvey(
      {@Path("id") required String id});
}
