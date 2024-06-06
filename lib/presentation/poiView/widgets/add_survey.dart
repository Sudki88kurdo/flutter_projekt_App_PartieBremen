import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSurvey extends StatefulWidget {
  static const String routeName = 'add_survey';

  @override
  State<AddSurvey> createState() => _AddSurveyState();
}

class _AddSurveyState extends State<AddSurvey> {
  List<Widget> answerFields = [];
  List<TextEditingController> controllers = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController expiresAtController = TextEditingController();
  final int maxAnswers = 5;

  @override
  void initState() {
    super.initState();
    var controller = TextEditingController();
    controllers.add(controller);
    answerFields.add(_buildAnswerField(0, controller: controller));
  }

  void _addAnswerField() {
    if (answerFields.length < maxAnswers) {
      setState(() {
        var controller = TextEditingController();
        controllers.add(controller);
        answerFields.add(
            _buildAnswerField(answerFields.length, controller: controller));
      });
    } else {
      showMessage('Maximale Anzahl an Antworten erreicht', color: Colors.red);
    }
  }

  void _removeAnswerField(int index) {
    setState(() {
      answerFields.removeAt(index);
      for (int i = 0; i < answerFields.length; i++) {
        answerFields[i] = _buildAnswerField(i);
      }
    });
  }

  Widget _buildAnswerField(int index, {TextEditingController? controller}) {
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
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      builder: (BuildContext context, PoiViewState state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          maxChildSize: 1,
          snap: true,
          expand: false,
          builder: (context, scrollController) => Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                const Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Neue Umfrage erstellen",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
                Padding(
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
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: "Titel",
                          filled: false,
                        ),
                      ),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: "Beschreibung",
                          filled: false,
                        ),
                      ),
                      TextFormField(
                        controller: expiresAtController,
                        decoration: const InputDecoration(
                          hintText: "Gültigkeit der Umfrage",
                          filled: false,
                        ),
                      ),
                      ...answerFields,
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
                            onPressed: () async => await _postSurvey,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _postSurvey() async {
    bool allFieldsFilled = true;
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        allFieldsFilled = false;
        break;
      }
    }
    if (allFieldsFilled &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        expiresAtController.text.isNotEmpty) {
      showMessage('Umfrage erfolgreich erstellt!');
      try {
        final poiViewCubit = context.read<PoiViewCubit>();
        await poiViewCubit.createSurvey(
          title: titleController.text,
          description: descriptionController.text,
          expiresAt: expiresAtController.text,
          creatorId: context
              .read<AppCubit>()
              .state
              .user!
              .id!, //muss geholt werden, keine Ahnung von wo
        );
        showMessage(
            'Umfrage erfolgreich erstellt!'); //Snackbar wird nicht angezeigt
      } catch (e) {
        showMessage('Fehler beim Erstellen der Umfrage', color: Colors.red);
      }
    } else {
      showMessage(
        'Bitte füllen Sie alle Felder aus, um die Umfrage zu erstellen',
        color: Colors.red,
      ); //Snackbar wird nicht angezeigt
    }
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
