import 'package:flutter_app/entities/question.dart';

enum MultipleChoice { Ja, Nein, Vielleicht }

class AnswerBody {
  QuestionType? questionType;
  MultipleChoice? multipleChoiceAnswer;
  int? skalarAnswer;
  String? textAnswer;

  AnswerBody({
    required QuestionType questionType,
    MultipleChoice? multipleChoiceAnswer,
    int? skalarAnswer,
    String? textAnswer,
  }) {
    this.questionType = questionType;
    this.multipleChoiceAnswer = multipleChoiceAnswer;
    this.skalarAnswer = skalarAnswer;
    this.textAnswer = textAnswer;
  }
}
