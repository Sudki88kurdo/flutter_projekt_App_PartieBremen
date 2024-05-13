import 'package:flutter/material.dart';
import 'package:flutter_app/api/clients/openplz_client.dart';
import 'package:flutter_app/entities/street.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_cubit.dart';
import 'package:flutter_app/presentation/viewHome-page/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/rounded_bottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = 'home-page';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('PartiBremen Home'),
            centerTitle: true,
            backgroundColor: Colors.green,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<HomePageCubit, HomePageState>(
              buildWhen: (prev, next) =>
                  prev.pointsOfInterest.length != next.pointsOfInterest.length,
              builder: (mapcontext, mapstate) {
                final MapController mapController = MapController();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 1,
                          child: FlutterMap(
                            mapController: mapController,
                            options: const MapOptions(
                              initialCenter: LatLng(53.0793, 8.8017),
                              initialZoom: 12,
                              interactionOptions: InteractionOptions(
                                flags: InteractiveFlag.drag |
                                    InteractiveFlag.flingAnimation |
                                    InteractiveFlag.pinchMove |
                                    InteractiveFlag.pinchZoom |
                                    InteractiveFlag.doubleTapZoom |
                                    InteractiveFlag.doubleTapDragZoom |
                                    InteractiveFlag.scrollWheelZoom,
                              ),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: mapstate.pointsOfInterest.isNotEmpty
                                    ? mapstate.pointsOfInterest
                                        .map(
                                          (poi) => isLatLngValid(
                                            poi.latitude,
                                            poi.longitude,
                                          )
                                              ? Marker(
                                                  point: LatLng(
                                                    double.parse(poi.latitude!),
                                                    double.parse(
                                                        poi.longitude!),
                                                  ),
                                                  width: 150.0,
                                                  height: 150.0,
                                                  child: GestureDetector(
                                                    child: const Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        )
                                        .nonNulls
                                        .toList()
                                    : [],
                              ),
                              RichAttributionWidget(
                                attributions: [
                                  TextSourceAttribution(
                                    'OpenStreetMap contributors',
                                    onTap: () => launchUrl(Uri.parse(
                                        'https://openstreetmap.org/copyright')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 65.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SearchAnchor(
                                  isFullScreen: false,
                                  builder: (BuildContext context,
                                      SearchController controller) {
                                    return SearchBar(
                                      shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  12),
                                        ),
                                      ),
                                      backgroundColor:
                                          const MaterialStatePropertyAll<Color>(
                                              Color.fromRGBO(
                                                  223, 238, 218, 1.0)),
                                      padding: const MaterialStatePropertyAll<
                                              EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              horizontal: 16.0)),
                                      hintText: 'Ort suchen',
                                      onTap: () {
                                        controller.openView();
                                      },
                                      onChanged: (search) async {
                                        controller.openView();
                                        await context
                                            .read<HomePageCubit>()
                                            .getStreets(search);
                                      },
                                      leading: const Icon(Icons.search,
                                          color: Colors.green),
                                      trailing: const <Widget>[],
                                    );
                                  },
                                  suggestionsBuilder: (BuildContext context,
                                      SearchController controller) {
                                    // returns a list of widgets that updates as the user types
                                    print("STATE CHANGED ${mapstate.streetResults.length} ${mapstate.streetResults}");
                                    return mapstate.streetResults.map((e) {
                                      return ListTile(
                                          title: Text(e.name ?? ''),
                                          onTap: () {
                                            controller.text = e.name ?? '';
                                            controller.closeView(e.name);
                                            moveToAddress(
                                              mapController: mapController,
                                              search: e.name ?? '',
                                            );
                                          },
                                        );
                                    }).toList();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 0),
        ));
  }

  bool isLatLngValid(String? lat, String? lng) {
    if (lat == null || lng == null) {
      return false;
    }
    return double.tryParse(lat) != null && double.tryParse(lng) != null;
  }

  Future<void> moveToAddress({
    required MapController mapController,
    required String search,
  }) async {
    GeoCode geoCode = GeoCode();
    Coordinates coordinates =
        await geoCode.forwardGeocoding(address: "Bremen, $search");
    if (coordinates.latitude != null) {
      mapController.move(
          LatLng(coordinates.latitude!, coordinates.longitude!), 16);
    }
  }
}
