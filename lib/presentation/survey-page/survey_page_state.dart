import 'package:flutter_app/entities/question.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:flutter_app/presentation/survey-page/common/answerBody.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';
import '../../entities/answer.dart';

part 'survey_page_state.freezed.dart';

@freezed
class SurveyPageState with _$SurveyPageState {
  const factory SurveyPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(null) SurveyResponse? survey,
    @Default([]) List<Question> questions,
    @Default([]) List<AnswerBody?> answers,
    @Default([]) List<Answer> answersFromUser,
    @Default(<Question, List<Answer>>{})
    Map<Question, List<Answer>> answersFromSurvey,
  }) = _SurveyPageState;
}
