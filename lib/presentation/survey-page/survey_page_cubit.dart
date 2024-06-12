import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/entities/question.dart';
import 'package:flutter_app/presentation/survey-page/common/answerBody.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/answer_repository.dart';
import '../../api/repositories/question_repository.dart';
import '../../api/repositories/survey_repository.dart';
import '../../entities/answer.dart';

class SurveyPageCubit extends Cubit<SurveyPageState> {
  final String _survedId;
  final String _userId;
  final QuestionRepository _questionRepository;
  final SurveyRepository _surveyRepository;
  final AnswerRepository _answerRepository;

  SurveyPageCubit(
    this._survedId,
    this._userId,
    this._questionRepository,
    this._surveyRepository,
    this._answerRepository,
  ) : super(SurveyPageState()) {
    init(
      surveyId: _survedId,
      userId: _userId,
    );
  }

  Future<bool> init({required String surveyId, required String userId}) async {
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
        List<AnswerBody?> answerArray = [];
        questions.asMap().forEach(
          (key, value) {
            answerArray.add(null);
          },
        );
        emit(
          state.copyWith(
            questions: questions,
            answers: answerArray,
          ),
        );
      },
      failure: (err) {
        successful = false;
      },
    );

    var answerRes = await this._answerRepository.getAllFromUserToSurvey(
          questionId: state.questions[0].id!,
          userId: userId,
        );

    await answerRes.whenOrNull(success: (value) async {
      //Answers of User, if they exist different widget is built
      emit(
        state.copyWith(
          answersFromUser: value,
        ),
      );
      //All answers to all questions
      state.questions.asMap().forEach(
        (key, value) async {
          var answerFromSurveyRes = await this
              ._answerRepository
              .getAllToQuestion(questionId: value.id!);
          answerFromSurveyRes.whenOrNull(
            success: (allAnswers) {
              var list =
                  Map<Question, List<Answer>>.from(state.answersFromSurvey);
              list.addAll({value: allAnswers});
              emit(
                state.copyWith(
                  answersFromSurvey: list,
                ),
              );
              if (key + 1 == state.questions.length) {
                emit(
                  state.copyWith(
                    status: ScreenStatus.success(),
                  ),
                );
              }
            },
            failure: (err) {
              emit(
                state.copyWith(
                  status: ScreenStatus.error(),
                ),
              );
            },
          );
        },
      );
    }, failure: (err) {
      emit(
        state.copyWith(
          status: ScreenStatus.error(),
        ),
      );
    });

    return successful;
  }

  void updateList(int index, AnswerBody answer) {
    List<AnswerBody?> list = [];
    state.answers.asMap().forEach((key, value) {
      list.add(null);
      if (index == key) {
        list[index] = answer;
      } else {
        list[key] = value;
      }
    });
    emit(
      state.copyWith(answers: list),
    );
  }

  Future<bool> createAnswers(String userId) async {
    print("answershere");
    state.answers.forEach((element) async {
      print(element);
      print(state.answers.length);
      switch (element?.questionType!) {
        case null:
          break;
        case QuestionType.SKALA:
          await this._answerRepository.create(
                titel: 'idk',
                questionId: element!.questionId!,
                answererId: userId,
                skalarAnswer: element?.skalarAnswer!,
              );
        case QuestionType.M_CHOICE:
          await this._answerRepository.create(
                titel: 'idk',
                questionId: element!.questionId!,
                answererId: userId,
                multipleChoiceAnswer: element?.multipleChoiceAnswer!,
              );
        case QuestionType.SATZ:
          await this._answerRepository.create(
                titel: 'idk',
                questionId: element!.questionId!,
                answererId: userId,
                textAnswer: element?.textAnswer!,
              );
      }
    });

    return true;
  }
}
