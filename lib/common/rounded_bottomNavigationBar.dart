import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_cubit.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:go_router/go_router.dart';

import '../appStyle.dart';
import '../presentation/viewHome-page/home_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int initialIndex;

  const BottomNavigationBarWidget({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppStyles.buttonColor,
            ),
            // BottomNavigationBarItem für Favoriten entfernt
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add point',
              backgroundColor: AppStyles.buttonColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Benachrichtigungen',
              backgroundColor: AppStyles.buttonColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              backgroundColor: AppStyles.buttonColor,
            ),
          ],
          currentIndex: state.selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index) => _onItemTapped(index, context),
        );
      },
    );
  }

  Future? _onItemTapped(int index, BuildContext context) {
    context.read<HomePageCubit>().updateIndex(index);
    if (index == 3) {
      //context.pushNamed(
      //  context,
      //  MaterialPageRoute(builder: (context) => ProfileWidget()),
      //);
    }
    if (index == 1) {
      return showModalBottomSheet(
          enableDrag: true,
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext bc) {
            return BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return Container(
                  height: 500,
                  child: Column(
                    children: [
                      const Text("Neuen Interessenpunkt erstellen"),
                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Titel",
                                  filled: false,
                                ),
                                onChanged: (title) => context
                                    .read<HomePageCubit>()
                                    .updateNewPoiTitle(title)),
                            TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Beschreibung",
                                  filled: false,
                                ),
                                onChanged: (description) => context
                                    .read<HomePageCubit>()
                                    .updateNewPoiDescription(description)),
                            TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Ort",
                                  filled: false,
                                ),
                                onChanged: (ort) => context
                                    .read<HomePageCubit>()
                                    .updateNewPoiOrt(ort)),
                            TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Strasse",
                                  filled: false,
                                ),
                                onChanged: (street) => context
                                    .read<HomePageCubit>()
                                    .updateNewPoiStreet(street))
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () async {
                            if (state.newPoiTitle == null ||
                                state.newPoiDescription == null ||
                                state.newPoiOrt == null ||
                                state.newPoiStreet == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Fehler beim Erstellen des Interessenpunktes')));
                            } else {
                              GeoCode geoCode = GeoCode();
                              Coordinates coords = await geoCode
                                  .forwardGeocoding(
                                      address:
                                          "Bremen, ${state.newPoiOrt}, ${state.newPoiStreet}")
                                  .then((value) {
                                if (value.latitude == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Fehler beim Erstellen des Interessenpunktes')));
                                } else {
                                  context.read<HomePageCubit>().create(
                                      title: state.newPoiTitle!,
                                      description: state.newPoiDescription!,
                                      active: true,
                                      creatorId: context
                                          .read<AppCubit>()
                                          .state
                                          .user!
                                          .id!,
                                      latitude: value.latitude.toString(),
                                      longitude: value.longitude.toString());
                                }
                                return value;
                              });
                            }
                          },
                          child: const Text("Erstellen"))
                    ],
                  ),
                );
              },
            );
          });
    }
    if (index == 0) {
      context.pushNamed(
        HomeScreen.routeName,
      );
    }
    return null;
  }
}
