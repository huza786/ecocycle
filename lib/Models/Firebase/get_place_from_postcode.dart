import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final String title;
  final String address;
  final double distance;
  final int materials;

  Place({
    required this.title,
    required this.address,
    required this.distance,
    required this.materials,
  });

  @override
  String toString() {
    return 'Title: $title\nAddress: $address\nDistance: $distance\nMaterials: $materials\n';
  }
}

Future<List<Place>?> getPlacesAndData(String postcode) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the document snapshot for the specified postcode
    DocumentSnapshot snapshot =
        await firestore.collection('RecyclePlaces').doc(postcode).get();

    if (snapshot.exists) {
      // Get the data map for the specified postcode
      Map<String, dynamic>? dataMap = snapshot.data() as Map<String, dynamic>?;

      if (dataMap != null) {
        // Process each place in the data map
        List<Place> placesList = dataMap.entries.map((entry) {
          Map<String, dynamic> placeData = entry.value as Map<String, dynamic>;
          return Place(
            title: entry.key,
            address: placeData['address'] ?? '',
            distance: double.tryParse(placeData['distance'] ?? '0') ?? 0.0,
            materials: int.tryParse(placeData['materials'] ?? '0') ?? 0,
          );
        }).toList();

        // Print or process the retrieved data for each place
        // ignore: unused_local_variable
        for (var place in placesList) {}
        return placesList;
      } else {
        return null;
      }
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
