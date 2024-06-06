import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repositories/comment_repository.dart';
import 'myComments_list.dart';
import 'myComments_list_cubit.dart';


/// Main entry point of the application if the user is authenticated.
class MyCommentsViewProvider extends StatelessWidget {
  //static const String routeName = '-view-page';
  final String commentId;

  const MyCommentsViewProvider({super.key, required this.commentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCommentsListCubit(context.read<CommentRepository>()),
      child: const MyCommentsListPage(),
    );
  }
}
