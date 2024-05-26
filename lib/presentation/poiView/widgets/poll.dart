import 'package:flutter/material.dart';
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
                  "Umfragen",
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
            height: 450,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                IconButton(
                  onPressed: () {
                    if (currentStep != 1) {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Hier steht unsere Umfrage:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Aktueller Schritt:",
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
                    answerCard("Antwort 1", context),
                    answerCard("Antwort 2", context),
                    answerCard("Antwort 3", context),
                    answerCard("Antwort 4", context),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    if (currentStep < totalSteps) {
                      setState(() {
                        currentStep++;
                      });
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
