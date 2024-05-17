import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/app/app_cubit.dart';
import 'package:flutter_app/presentation/home-screen/home_screen_cubit.dart';
import 'package:flutter_app/presentation/home-screen/home_screen_state.dart';
import 'package:flutter_app/presentation/profile/prfileNav/profile-page/profile_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:go_router/go_router.dart';

import '../appStyle.dart';
import '../presentation/home-screen/home_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int initialIndex;

  const BottomNavigationBarWidget({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (homePageContext, state) {
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
          onTap: (index) async =>
              await _onItemTapped(index, homePageContext, context),
        );
      },
    );
  }

  Widget makeDismissible(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
            onTap: () {},
            child: child,
          ));

  Future? _onItemTapped(
      int index, BuildContext context, BuildContext buildContext) async {
    context.read<HomePageCubit>().updateIndex(index);
    if (index == 3) {
      context.pushNamed(
        ProfilePageProvider.routeName,
      );
    }
    if (index == 1) {
      return showModalBottomSheet(
          enableDrag: true,
          showDragHandle: true,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext bc) {
            return BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: makeDismissible(
                    context: context,
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.65,
                      maxChildSize: 0.65,
                      builder: (context, scrollController) => Container(
                        height: 500,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
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
                                  "Neuen Interessenpunkt erstellen",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 100.0, right: 100, top: 20, bottom: 40),
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
                                          .updateNewPoiDescription(
                                              description)),
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
                                          .updateNewPoiStreet(street)),
                                ],
                              ),
                            ),
                            Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 220,
                                  height: 60,
                                  child: FilledButton(
                                      onPressed: () async {
                                        if (state.newPoiTitle == null ||
                                            state.newPoiDescription == null ||
                                            state.newPoiOrt == null ||
                                            state.newPoiStreet == null) {
                                          ScaffoldMessenger.of(bc).showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Fehler beim Erstellen des Interessenpunktes')));
                                          Navigator.of(context).pop();
                                        } else {
                                          GeoCode geoCode = GeoCode();
                                          Coordinates coords = await geoCode
                                              .forwardGeocoding(
                                                  address:
                                                      "${state.newPoiStreet}, Bremen ${state.newPoiOrt}")
                                              .then((value) async {
                                            if (value.latitude == null) {
                                              ScaffoldMessenger.of(bc)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Fehler beim Erstellen des Interessenpunktes')));
                                              Navigator.of(context).pop();
                                            } else {
                                              await context
                                                  .read<HomePageCubit>()
                                                  .create(
                                                      title: state.newPoiTitle!,
                                                      description: state
                                                          .newPoiDescription!,
                                                      active: true,
                                                      creatorId: context
                                                          .read<AppCubit>()
                                                          .state
                                                          .user!
                                                          .id!,
                                                      latitude: value.latitude!,
                                                      longitude:
                                                          value.longitude!)
                                                  .then((value) => context
                                                      .read<HomePageCubit>()
                                                      .loadPointsOfInterest())
                                                  .then((value) {
                                                ScaffoldMessenger.of(bc)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Interessenpunkt erfolgreich erstellt')));
                                                Navigator.of(context).pop();
                                              });
                                            }
                                            return value;
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "Erstellen",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          });
    }
    if (index == 0) {
      await context
          .read<HomePageCubit>()
          .loadPointsOfInterest()
          .then((value) => context.goNamed(
                HomeScreen.routeName,
              ));
    }
    return null;
  }
}
