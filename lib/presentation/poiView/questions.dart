import 'package:flutter_app/presentation/poiView/quiz_model.dart';

Quizmodel loadQuestion(int questionIndex) {
  List<String> defaultAnswers = ['Ja', 'Nein', 'Vielleicht', 'Weiß ich nicht'];
  List<Quizmodel> questionList = [
    Quizmodel(
      1,
      'Sollen zusätzliche Bäume entlang der Straßen gepflanzt werden?',
      defaultAnswers,
    ),
    Quizmodel(
      2,
      'Soll es eine Erweiterung von Parks geben?',
      defaultAnswers,
    ),
    Quizmodel(3, 'Soll es mehr Fahrradwege geben?', defaultAnswers),
    Quizmodel(
        4, 'Soll verkehrsberuhigten Zonen gebaut werden?', defaultAnswers),
    Quizmodel(
      5,
      'Sollen neue Spiel- oder Sportplätze gebaut werden?',
      defaultAnswers,
    ),
    Quizmodel(
      6,
      'Sollen öffentliche Bereiche barrierefreier zuänglich sein?',
      defaultAnswers,
    ),
  ];
  return questionList[questionIndex - 1];
}
