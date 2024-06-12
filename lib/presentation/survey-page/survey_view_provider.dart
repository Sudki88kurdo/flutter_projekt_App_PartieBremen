import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/question_repository.dart';
import 'package:flutter_app/api/repositories/survey_repository.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/survey-page/survey_page.dart';
import 'package:flutter_app/presentation/survey-page/survey_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/repositories/answer_repository.dart';

/// Main entry point of the application if the user is authenticated.
class SurveyPagePageProvider extends StatelessWidget {
  static const String routeName = 'survey-page';

  final String surveyId;

  const SurveyPagePageProvider({required this.surveyId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyPageCubit(
        surveyId,
        context.read<AppCubit>().state.user!.id!,
        context.read<QuestionRepository>(),
        context.read<SurveyRepository>(),
        context.read<AnswerRepository>(),
      ),
      child: const SurveyPage(),
    );
  }
}
