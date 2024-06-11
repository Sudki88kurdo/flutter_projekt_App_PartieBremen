import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../survey-page/survey_view_provider.dart';

class Poll extends StatefulWidget {
  static const String routeName = 'poll';

  const Poll({super.key});

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiViewCubit, PoiViewState>(
      builder: (context, state) {
        return Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: ListView.builder(
            itemCount: state.surveys.length,
            itemBuilder: (context, index) {
              final survey = state.surveys[index];
              return ListTile(
                title: Text(survey.titel ?? ''),
                subtitle: Text(survey.beschreibung ?? ''),
                onTap: () => context.pushNamed(
                  SurveyPagePageProvider.routeName,
                  pathParameters: {'surveyId': ''},
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> fetchSurveys() async {
    await context.read<PoiViewCubit>().findAllSurveysFromPoI();
  }
}
