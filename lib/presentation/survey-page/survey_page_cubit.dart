import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/question_repository.dart';
import '../../api/repositories/survey_repository.dart';

class SurveyPageCubit extends Cubit<SurveyPageState> {
  final String _survedId;
  final QuestionRepository _questionRepository;
  final SurveyRepository _surveyRepository;

  SurveyPageCubit(
    this._survedId,
    this._questionRepository,
    this._surveyRepository,
  ) : super(const SurveyPageState()) {
    init(surveyId: _survedId);
  }

  Future<bool> init({required String surveyId}) async {
    var successful = true;

    emit(
      state.copyWith(
        status: ScreenStatus.loading(),
      ),
    );
    var res = await this._surveyRepository.findOne(surveyId: surveyId);
    await res.whenOrNull(
      success: (value) {
        emit(
          state.copyWith(survey: value),
        );
      },
      failure: (err) {
        successful = false;
      },
    );
    var questionRes = await this._questionRepository.findQuestionsToSurvey(
          surveyId: surveyId,
        );
    questionRes.whenOrNull(
      success: (questions) {
        List<String?> doubleArray = [];
        questions.asMap().forEach(
          (key, value) {
            doubleArray.add(null);
          },
        );
        emit(
          state.copyWith(
            questions: questions,
            answers: doubleArray,
            status: ScreenStatus.success(),
          ),
        );
      },
      failure: (err) {
        successful = false;
      },
    );

    return successful;
  }

  void updateList(int index, String answer) {
    List<String?> list = [];
    state.answers.asMap().forEach((key, value) {
      list.add(null);
      if (index == key) {
        list[index] = answer;
      } else {
        list[key] = state.answers[index];
      }
    });
    list[index] = answer;
    emit(
      state.copyWith(answers: list),
    );
  }
}
