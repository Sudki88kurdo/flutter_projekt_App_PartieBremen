import 'package:flutter/material.dart';
import 'package:flutter_app/common/screen_status.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_cubit.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../entities/question.dart';

class SurveyPage extends StatefulWidget {
  static const String routeName = 'survey_page';

  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyState();
}

class _SurveyState extends State<SurveyPage> {
  int currentStep = 0;
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
                              ),
                            ),
                            currentStep < state.questions.length
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

  Widget _buildAnswers(
      {required int questionNumber,
      required SurveyPageState state,
      required BuildContext blocContext}) {
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
        Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              if (!isSent) {
                setState(() {
                  isSent = true;
                });
                sendAnswers();
              } else {
                _showErrorMessage();
              }
            },
            child: currentStep + 1 == state.questions.length
                ? Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Abschicken',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }

  Widget _QuestionAnswers(Question question, int index,
      BuildContext blocContext, SurveyPageState state) {
    var sliderStep = state.answers[index];
    switch (question.type!) {
      case QuestionType.SKALA:
        return Slider(
          onChanged: (change) =>
              blocContext.read<SurveyPageCubit>().updateList(index, change),
          value: sliderStep,
          min: 0,
          max: 5,
          divisions: 4,
          label: sliderStep.toString(),
        );
      case QuestionType.M_CHOICE:
      // TODO: Handle this case.
      case QuestionType.SATZ:
      // TODO: Handle this case.
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

  void sendAnswers() {}
}
