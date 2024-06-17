import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/comment_repository.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../appStyle.dart';
import '../../../../entities/user.dart';
import 'myComments_list_cubit.dart';
import 'myComments_list_state.dart';

class MyCommentsListPage extends StatelessWidget {
  const MyCommentsListPage({super.key});

  static User? user;

  setUser(User loginUser) {
    user = loginUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyCommentsListCubit(context.read<CommentRepository>())
            ..findUserComments(
                userId: context.read<AppCubit>().state.user?.id! ?? ''),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My all comments',
            style: AppStyles.appBarTitleStyle,
          ),
          backgroundColor: AppStyles.buttonColor,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<MyCommentsListCubit, MyCommentsListState>(
          builder: (context, state) {
            if (state.status == MyCommentsListStatus.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == MyCommentsListStatus.failure) {
              return Center(child: Text('No Comments found'));
            } else if (state.status == MyCommentsListStatus.success) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: Text(
                          state.comments[index].actualcomment ?? 'No comment',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          //todo ............................

                          state.comments[index].commenter?.surname ??
                              'No Description',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        onTap: () {
                          print(
                              'Clicked comment: ${state.comments[index].toJson()}');
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
