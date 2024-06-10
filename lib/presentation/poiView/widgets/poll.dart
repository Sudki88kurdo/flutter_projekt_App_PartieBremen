import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/poiView/poi_view_cubit.dart';
import 'package:flutter_app/presentation/poiView/poi_view_state.dart';
import 'package:flutter_app/presentation/poiView/widgets/survey_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'add_survey.dart';
import 'package:flutter_app/entities/survey_response.dart';
import 'package:flutter_app/presentation/poiView/questions.dart';
import 'package:flutter_app/presentation/poiView/widgets/add_survey.dart';
import 'package:flutter_app/presentation/poiView/widgets/poll_answer.dart';
import 'package:infinite_scroll_pagination/src/widgets/layouts/paged_sliver_list.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
                onTap: () => context.pushNamed(SurveyPage.routeName),
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
