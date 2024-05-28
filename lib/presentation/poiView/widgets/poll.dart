import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/poiView/questions.dart';
import 'package:flutter_app/presentation/poiView/widgets/poll_answer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Poll extends StatefulWidget {
  const Poll({super.key});

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
  int currentStep = 1;
  int totalSteps = 6;
  var selectedAnswerMap = {};
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Umfragen',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Icon(
                Icons.poll,
                color: Colors.green,
                size: 30,
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                currentStep > 1
                    ? IconButton(
                        onPressed: () {
                          if (currentStep != 1) {
                            setState(() {
                              currentStep--;
                            });
                          }
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                        color: Colors.white,
                      )
                    : SizedBox(
                        width: 40,
                      ),
                Expanded(
                  child: _buildAnswers(questionNumber: currentStep),
                ),
                currentStep < totalSteps
                    ? IconButton(
                        onPressed: () {
                          if (currentStep < totalSteps) {
                            setState(() {
                              currentStep++;
                            });
                          }
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined),
                        color: Colors.white,
                      )
                    : SizedBox(
                        width: 40,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswers({required int questionNumber}) {
    var question = loadQuestion(questionNumber);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            question.question,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.center,
            maxLines: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
            totalSteps: totalSteps,
            currentStep: currentStep,
            selectedColor: Colors.white,
            unselectedColor: Colors.red,
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        ...(List<Widget>.generate(
          question.answers.length,
          (int index) {
            var answer = question.answers[index];
            var isSelected = selectedAnswerMap[question.id] == index;
            return GestureDetector(
              child: answerCard(answer, context, isSelected),
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedAnswerMap[question.id] = null;
                  } else {
                    selectedAnswerMap[question.id] = index;
                    Future.delayed(Duration(milliseconds: 500), () {
                      loadNewQuestion(questionNumber + 1);
                    });
                  }
                });
              },
            );
          },
        )),
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
        ),
      ],
    );
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: new Text('Sie haben die Umfrage bereits abgeschickt!'),
          backgroundColor: Colors.red,
        )
    );
  }

  void loadNewQuestion(int questionNumber) {
    setState(() {
      if (questionNumber <= totalSteps) {
        currentStep = questionNumber;
      }
    });
  }

  void sendAnswers() {
    selectedAnswerMap.clear();
  }
}
