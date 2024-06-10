import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddSurvey extends StatefulWidget {
  static const String routeName = 'add_survey';

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
  final List<Map<String, dynamic>> stepsData = List.generate(
      6,
      (index) => {
            'title': TextEditingController(),
            'description': TextEditingController(),
            'expiresAt': TextEditingController(),
            'answers': <TextEditingController>[TextEditingController()],
          });
  final int maxAnswers = 5;
  int currentStep = 1;

  @override
  void initState() {
    super.initState();
  }

  void _addAnswerField() {
    if (stepsData[currentStep - 1]['answers'].length < maxAnswers) {
      setState(() {
        stepsData[currentStep - 1]['answers'].add(TextEditingController());
      });
    } else {
      showMessage('Maximale Anzahl an Antworten erreicht', color: Colors.red);
    }
  }

  void _removeAnswerField(int index) {
    setState(() {
      stepsData[currentStep - 1]['answers'].removeAt(index);
    });
  }

  Widget _buildAnswerField(int index, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Antwort ${index + 1}',
                filled: false,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.green),
            onPressed: () => _removeAnswerField(index),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Neue Umfrage erstellen',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
      ),
      body: BlocBuilder<PoiViewCubit, PoiViewState>(
          builder: (BuildContext context, PoiViewState state) {
        return ListView(
          children: [
            buildCurrentQuestionHeader(currentStep),
            createQuestion(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          icon:
                              Icon(Icons.arrow_back_ios_new_outlined, size: 30),
                          color: Colors.green,
                        )
                      : SizedBox(width: 40),
                  currentStep < stepsData.length
                      ? TextButton(
                          onPressed: () {
                            if (currentStep < stepsData.length) {
                              setState(() {
                                currentStep++;
                              });
                            }
                          },
                          iconAlignment: IconAlignment.end,
                          child: Text(
                            'Frage hinzufügen',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        )
                      : SizedBox(width: 40),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Future<void> _postSurvey() async {
    bool allFieldsFilled = true;
    for (final step in stepsData) {
      if (step['title'].text.isEmpty ||
          step['description'].text.isEmpty ||
          step['expiresAt'].text.isEmpty ||
          step['answers'].any((controller) => controller.text.isEmpty)) {
        allFieldsFilled = false;
        break;
      }
    }

    if (allFieldsFilled) {
      try {
        await createSurvey();
        showMessage('Umfrage erfolgreich erstellt!');
        context.pop();
      } catch (e) {
        showMessage('Fehler beim Erstellen der Umfrage', color: Colors.red);
      }
    } else {
      showMessage(
          'Bitte füllen Sie alle Felder aus, um die Umfrage zu erstellen',
          color: Colors.red);
    }
  }

  Future<void> createSurvey() async {
    final userId = context.read<AppCubit>().state.user!.id!;
    for (final step in stepsData) {
      await context.read<PoiViewCubit>().createSurvey(
            title: step['title'].text,
            description: step['description'].text,
            expiresAt: int.tryParse(step['expiresAt'].text) ?? 90,
            creatorId: userId,
          );
    }
  }

  Widget createQuestion() {
    final stepData = stepsData[currentStep - 1];
    return Padding(
      padding: const EdgeInsets.only(
        left: 100.0,
        right: 100,
        top: 20,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: stepData['title'],
            decoration: const InputDecoration(
              hintText: "Titel",
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          TextFormField(
            controller: stepData['description'],
            decoration: const InputDecoration(
              hintText: "Beschreibung",
            ),
          ),
          TextFormField(
            controller: stepData['expiresAt'],
            decoration: const InputDecoration(
              hintText: "Gültigkeit der Umfrage",
            ),
          ),
          ...stepData['answers'].asMap().entries.map((entry) {
            final index = entry.key;
            final controller = entry.value;
            return _buildAnswerField(index, controller);
          }).toList(),
          Center(
            child: IconButton(
              onPressed: _addAnswerField,
              icon: const Icon(Icons.add, color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  await _postSurvey();
                },
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'Erstellen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: create question to survey (POST request)
  // TODO: create answers to question (POST request)

  Widget buildCurrentQuestionHeader(int currentStep) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          stepsData[currentStep - 1]['title'].text.isEmpty
              ? 'Frage ${currentStep}'
              : stepsData[currentStep - 1]['title'].text,
          style: TextStyle(
            color: Colors.green,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
