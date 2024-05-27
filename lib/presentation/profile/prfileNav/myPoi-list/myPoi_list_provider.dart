import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/profile/prfileNav/myPoi-list/myPoi_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repositories/poi_repository.dart';
import 'myPoi_list_cubit.dart';


/// Main entry point of the application if the user is authenticated.
class MyPoiViewProvider extends StatelessWidget {
  static const String routeName = 'poi-view-page';
  final String poiId;

  const MyPoiViewProvider({super.key, required this.poiId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPoiListCubit(context.read<PoiRepository>()),
      child: const MyPoiListPage(),
    );
  }
}
