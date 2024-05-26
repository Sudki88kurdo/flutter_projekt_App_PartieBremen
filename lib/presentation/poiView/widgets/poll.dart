import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/poiView/widgets/poll_answer.dart';

class Poll extends StatelessWidget {
  const Poll({super.key});

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
            height: 350,
            color: Colors.green,
              child: Column(
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
                  answerCard("Antwort 1", context),
                  answerCard("Antwort 2", context),
                  answerCard("Antwort 3", context),
                  answerCard("Antwort 4", context),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
