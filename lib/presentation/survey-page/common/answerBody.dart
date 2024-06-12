import 'package:flutter_app/entities/question.dart';

enum MultipleChoice { Ja, Nein, Vielleicht }

class AnswerBody {
  String? questionId;

  QuestionType? questionType;
  MultipleChoice? multipleChoiceAnswer;
  int? skalarAnswer;
  String? textAnswer;

  AnswerBody({
    required String questionId,
    required QuestionType questionType,
    MultipleChoice? multipleChoiceAnswer,
    int? skalarAnswer,
    String? textAnswer,
  }) {
    this.questionId = questionId;
    this.questionType = questionType;
    this.multipleChoiceAnswer = multipleChoiceAnswer;
    this.skalarAnswer = skalarAnswer;
    this.textAnswer = textAnswer;
  }
}
