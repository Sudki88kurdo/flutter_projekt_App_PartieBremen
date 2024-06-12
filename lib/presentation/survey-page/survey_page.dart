import 'package:flutter/material.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/presentation/survey-page/common/answerBody.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_cubit.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../entities/question.dart';
import '../app/app_cubit.dart';

class SurveyPage extends StatefulWidget {
  static const String routeName = 'survey_page';

  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyState();
}

class _SurveyState extends State<SurveyPage> {
  int currentStep = 0;
  List<double> sliderStepper = [1, 1, 1, 1, 1];

  List<int> buttonStates = [0, 0, 0, 0, 0];

  List<TextEditingController?> textEditingControllers = [
    null,
    null,
    null,
    null,
    null
  ];
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyPageCubit, SurveyPageState>(
      builder: (blocContext, state) {
        switch (state.status) {
          case ScreenStatusLoading():
            return CircularProgressIndicator();
          case ScreenStatusError():
            Navigator.pop(context);
            break;
          case ScreenStatusSuccess():
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    state.survey?.titel! ?? 'Titel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.only(bottom: 32),
                        child: Row(
                          children: [
                            currentStep > 0
                                ? IconButton(
                                    onPressed: () {
                                      if (currentStep != 0) {
                                        setState(() {
                                          currentStep--;
                                        });
                                      }
                                    },
                                    icon:
                                        Icon(Icons.arrow_back_ios_new_outlined),
                                    color: Colors.white,
                                  )
                                : SizedBox(
                                    width: 40,
                                  ),
                            Expanded(
                              child: _buildAnswers(
                                questionNumber: currentStep,
                                state: state,
                                blocContext: blocContext,
                                mainContext: context,
                              ),
                            ),
                            currentStep + 1 < state.questions.length
                                ? IconButton(
                                    onPressed: () {
                                      if (currentStep <
                                          state.questions.length) {
                                        setState(() {
                                          currentStep++;
                                        });
                                      }
                                    },
                                    icon:
                                        Icon(Icons.arrow_forward_ios_outlined),
                                    color: Colors.white,
                                  )
                                : SizedBox(
                                    width: 40,
                                  ),
                          ],
                        ),
                      ),
                      // _buildSurvey(),
                    ],
                  ),
                ),
              ),
            );
        }
        return Container();
      },
    );
  }

  Widget _buildAnswers({
    required int questionNumber,
    required SurveyPageState state,
    required BuildContext blocContext,
    required BuildContext mainContext,
  }) {
    var question = state.questions.elementAt(questionNumber);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Aktueller Schritt:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: StepProgressIndicator(
            totalSteps: state.questions.length,
            currentStep: currentStep + 1,
            selectedColor: Colors.white,
            unselectedColor: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 10, bottom: 10.0, right: 10.0, top: 30.0),
          child: Text(
            question.fragestellung!,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 10,
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        _QuestionAnswers(question, questionNumber, blocContext, state),
        Padding(padding: EdgeInsets.all(20)),
        currentStep + 1 == state.questions.length
            ? Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    if (!isSent &&
                        state.answers
                            .where((element) => element == null)
                            .isEmpty) {
                      setState(() {
                        isSent = true;
                      });
                      sendAnswers(blocContext);
                      showMessage('Umfrage erfolgreich beantwortet!',
                          color: Colors.green);
                      Navigator.pop(mainContext);
                    } else {
                      _showErrorMessage();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Abschicken',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _MultipleChoiceButton(
    BuildContext blocContext,
    int stateIndex,
    String text,
    MultipleChoice multipleChoice,
    int index,
  ) {
    return SizedBox(
      width: 200,
      child: FloatingActionButton(
        backgroundColor: buttonStates[index] == stateIndex
            ? Colors.white70
            : Colors.deepPurple,
        onPressed: () {
          setState(() {
            buttonStates[index] = stateIndex;
          });
          blocContext.read<SurveyPageCubit>().updateList(
                index,
                AnswerBody(
                  multipleChoiceAnswer: multipleChoice,
                  questionType: QuestionType.M_CHOICE,
                ),
              );
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _QuestionAnswers(Question question, int index,
      BuildContext blocContext, SurveyPageState state) {
    switch (question.type!) {
      case QuestionType.SKALA:
        return Slider(
          onChanged: (change) {
            setState(() {
              sliderStepper[index] = change;
            });
            blocContext.read<SurveyPageCubit>().updateList(
                  index,
                  AnswerBody(
                    skalarAnswer: change.round(),
                    questionType: QuestionType.SKALA,
                  ),
                );
          },
          value: sliderStepper[index],
          min: 1,
          max: 5,
          divisions: 4,
          label: sliderStepper[index].toString(),
        );
      case QuestionType.M_CHOICE:
        return Column(
          children: [
            _MultipleChoiceButton(
              blocContext,
              1,
              'Ja!',
              MultipleChoice.Ja,
              index,
            ),
            SizedBox(
              height: 25,
            ),
            _MultipleChoiceButton(
              blocContext,
              2,
              'Nein!',
              MultipleChoice.Nein,
              index,
            ),
            SizedBox(
              height: 25,
            ),
            _MultipleChoiceButton(
              blocContext,
              3,
              'Vielleicht!',
              MultipleChoice.Vielleicht,
              index,
            )
          ],
        );
      case QuestionType.SATZ:
        textEditingControllers[index] = textEditingControllers[index] != null
            ? textEditingControllers[index]
            : TextEditingController();
        return Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingControllers[index],
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              decoration: InputDecoration(hintText: "Antwort mit Text.."),
              onChanged: (value) {
                blocContext.read<SurveyPageCubit>().updateList(
                      index,
                      AnswerBody(
                        textAnswer: value,
                        questionType: QuestionType.SATZ,
                      ),
                    );
              },
            ),
          ),
        );
    }
    return Container();
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: new Text('Sie haben die Umfrage bereits abgeschickt!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void sendAnswers(BuildContext blocContext) {
    blocContext.read<SurveyPageCubit>().createAnswers(
          blocContext.read<AppCubit>().state.user!.id!,
        );
  }

  void showMessage(String message, {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
