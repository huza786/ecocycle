import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/View/map_screen/viewmodel/loadingprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final recyclePlacesProvider =
    NotifierProvider<RecyclePlaceProvider, List<RecyclePlace>>(
  () {
    return RecyclePlaceProvider();
  },
);
// final recyclelatlng

class RecyclePlaceProvider extends Notifier<List<RecyclePlace>> {
  @override
  build() {
    return [];
  }

  TextEditingController textEditingController = TextEditingController();

  Future<List<RecyclePlace>> getPlacesAndData(
      String postcode, WidgetRef refa) async {
    final loadingbool = refa.read(loadingRecyclePlaces.notifier);
    loadingbool.toggleBool(false);
    List<RecyclePlace> recycleList = [];

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final ref = await firestore
        .collection('RecyclePlaces')
        .doc(postcode.replaceAll(" ", "").toUpperCase())
        .get();
    Map<String, dynamic>? dataMap = ref.data();
    if (dataMap != null) {
      List<MapEntry<String, dynamic>> dataList = dataMap.entries.toList();
      for (int i = 0; i < dataList.length; i++) {
        String name = dataList[i].key;
        Map<String, dynamic> placeData = dataList[i].value;

        String address = placeData['address'];
        String distance = placeData['distance'];
        String materials = placeData['materials'];
        final location = await locationFromAddress(address);
        final latlng = LatLng(location.last.latitude, location.last.longitude);
        debugPrint(latlng.toString());

        final recycleplace = RecyclePlace(
            name: name,
            address: address,
            materials: materials,
            latLng: latlng,
            distance: distance);
        recycleList.add(recycleplace);
        state = recycleList;
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("postcode", postcode);
      state = recycleList;
    }
    loadingbool.toggleBool(true);

    return state;
  }
}

class RecyclePlace {
  final String name;
  final String address;
  final String materials;
  final String distance;
  final LatLng latLng;

  RecyclePlace(
      {required this.name,
      required this.address,
      required this.materials,
      required this.distance,
      required this.latLng});
}
