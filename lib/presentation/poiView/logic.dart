import 'package:flutter_app/presentation/poiView/quiz_model.dart';

Quizmodel loadQuestion(int questionIndex) {
  List<String> defaultAnswers = ['Ja', 'Nein', 'Vielleicht', 'Weiß ich nicht'];
  List<Quizmodel> questionList = [
    Quizmodel(
      'Sollen zusätzliche Bäume entlang der Straßen gepflanzt werden?',
      defaultAnswers,
    ),
    Quizmodel(
      'Soll es eine Erweiterung von Parks geben?',
      defaultAnswers,
    ),
    Quizmodel('Soll es mehr Fahrradwege geben?', defaultAnswers),
    Quizmodel('Soll verkehrsberuhigten Zonen gebaut werden?', defaultAnswers),
    Quizmodel(
      'Sollen neue Spiel- oder Sportplätze gebaut werden?',
      defaultAnswers,
    ),
    Quizmodel(
      'Sollen öffentliche Bereiche barrierefreier zuänglich sein?',
      defaultAnswers,
    ),
  ];
  return questionList[questionIndex - 1];
}
