import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/View/postcode_form/recycle_place_provider.dart';
import 'package:recycle_app/View/map_screen/components/navigation_drawer.dart';
import 'package:recycle_app/View/map_screen/viewmodel/loadingprovider.dart';
import 'package:recycle_app/View/map_screen/viewmodel/map_focus_integer.dart';
import 'package:recycle_app/View/map_screen/viewmodel/marker_icon.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
  }

  _async() async {
    await ref.watch(mapMarkerProvider.notifier).loadIcon();
  }

  @override
  Widget build(BuildContext context) {
    final recyclePlaces = ref.watch(recyclePlacesProvider);

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const NavigationDrawerHomePage(),
        body: GoogleMap(
          markers: ref.watch(loadingRecyclePlaces)
              ? recyclePlaces
                  .asMap()
                  .entries
                  .map(
                    (place) => Marker(
                      icon: ref.watch(loadingRecyclePlaces)
                          ? BitmapDescriptor.fromBytes(
                              ref.watch(mapMarkerProvider))
                          : BitmapDescriptor.defaultMarker,
                      position: place.value.latLng,
                      markerId: MarkerId(
                        place.key.toString(),
                      ),
                      infoWindow: InfoWindow(
                          onTap: () {
                            Random random = Random();
                            int random2 = random.nextInt(17 - 15 + 1) + 15;
                            int random3 = random.nextInt(17 - 15 + 1) + 15;
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Opening Hours"),
                                      content: Row(
                                        children: [
                                          const Text(
                                              "Monday:\nTuesday:\nWednesday:\nThursday:\nFriday:\nSaturday:\nSunday:"),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            child: Text(
                                                "9:00-17:00\n9:00-$random2:00\n9:00-$random2:00\n9:00-$random3:00\n9:00-$random3:00\nClosed\nClosed"),
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          title: place.value.name,
                          snippet:
                              "Monday:9:00-17:00\nTuesday:9:00-17:00\nWednesday:9:00-17:00\nThursday:9:00-17:00\nFriday:9:00-17:00\nSaturday:Closed\nSunday:Closed"),
                      onTap: () async {
                        // final _sessionToken = UuidV4();
                        // final kPLACES_API_KEY =
                        //     "AIzaSyDGlxgLX22RS2-lMpPFa9BDDvIASuO2jQ0";
                        // String baseURL =
                        //     'https://maps.googleapis.com/maps/api/place/autocomplete/json';
                        // String request =
                        //     '$baseURL?input=${place.value.address}&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
                        // final response = await http.get(Uri.parse(request));
                        // if (response.statusCode == 200) {
                        //   print(response.body.toString());

                        //   final placeId =
                        //       jsonDecode(response.body)['predictions'][0]
                        //           ['place_id'];
                        //   print(placeId);
                        // }
                      },
                    ),
                  )
                  .toSet()
              : {},
          initialCameraPosition: CameraPosition(
            target: recyclePlaces[ref.watch(mapFocusProvider)].latLng,
            zoom: 16,
          ),
          onMapCreated: (GoogleMapController controller) {
            controller.showMarkerInfoWindow(
                MarkerId(ref.watch(mapFocusProvider).toString()));
            _controller.complete(controller);
          },
        ));
  }
}
//ChIJE0wuiKcddkgR1_ujc7kaStw
//ChIJ40SMErIcdkgRkyTfhzqauEg
//ChIJk34I9LIcdkgRfAz3KzXA8bU
//ChIJH7dQs7IcdkgRwVe1BrBwXFk
//ChIJE0wuiKcddkgR1_ujc7kaStw
//EigxNTgtMTY0IEJpc2hvcHNnYXRlLCBMb25kb24gRUMyTSA0TE4sIFVLIjESLwoUChIJC9zt9LIcdkgRqIo0QsdF38EQngEqFAoSCTVqH5CyHHZIEaTZ-8RFqC3k
//ChIJ-7R5WrMcdkgRqHEJDqHdNgc