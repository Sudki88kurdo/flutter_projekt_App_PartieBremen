import 'package:flutter_app/entities/question.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/screen_status.dart';

part 'survey_page_state.freezed.dart';

@freezed
class SurveyPageState with _$SurveyPageState {
  const factory SurveyPageState({
    @Default(ScreenStatus.pure()) ScreenStatus status,
    @Default(null) SurveyResponse? survey,
    @Default([]) List<Question> questions,
    @Default([]) List<String?> answers,
  }) = _SurveyPageState;
}
