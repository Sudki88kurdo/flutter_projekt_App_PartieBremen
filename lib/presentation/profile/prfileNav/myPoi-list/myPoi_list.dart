import 'package:flutter/material.dart';
import 'package:flutter_app/api/repositories/poi_repository.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list_cubit.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../appStyle.dart';
import '../../../../entities/user.dart';
import '../../../app/app_cubit.dart';
import '../../../poiView/poi_view_provider.dart';

class MyPoiListPage extends StatelessWidget {
  const MyPoiListPage({super.key});

  static User? user;

  //final BuildContext mapcontext;

  setUser(User loginUser) {
    user = loginUser;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPoiListCubit(context.read<PoiRepository>())
        ..findUserPOIs(userId: context.read<AppCubit>().state.user?.id! ?? ''),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My POIs',
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
        body: BlocBuilder<MyPoiListCubit, MyPoiListState>(
          builder: (context, state) {
            if (state.status == MyPoiListStatus.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == MyPoiListStatus.failure) {
              return Center(child: Text('No Points of Interests found'));
            } else if (state.status == MyPoiListStatus.success) {
              return ListView.builder(
                itemCount: state.pois.length,
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
                          state.pois[index].titel ?? 'No Title',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          state.pois[index].description ?? 'No Description',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        onTap: () {
                          context.pushNamed(
                            PoiViewProvider.routeName,
                            pathParameters: {
                              'poiId': state.pois[index].id ?? ''
                            },
                          );
                          //print('Clicked POI: ${state.pois[index].id}');
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
