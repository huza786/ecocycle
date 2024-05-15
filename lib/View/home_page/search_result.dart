// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

class SearchResult extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final TextEditingController _postcodeController = TextEditingController();
  Future<DocumentSnapshot>? _futureSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomAppBar(
                title: "Search",
                context: context,
                navigationEnabled: true,
              ),
              Positioned(
                top: 35.h,
                left: 20.w,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              controller: _postcodeController,
              decoration: InputDecoration(
                  labelText: 'Enter Postcode',
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                  )),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(MyAppColors.primaryColorDark),
            ),
            onPressed: () {
              _futureSnapshot = getPlacesAndData(_postcodeController.text);
              setState(() {});
            },
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<DocumentSnapshot>(
              future: _futureSnapshot,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.exists) {
                  // Process the snapshot data here
                  Map<String, dynamic>? dataMap =
                      snapshot.data!.data() as Map<String, dynamic>?;

                  if (dataMap != null) {
                    // Convert the dataMap to a list of entries for easier iteration
                    List<MapEntry<String, dynamic>> dataList =
                        dataMap.entries.toList();

                    return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        String title = dataList[index].key;
                        Map<String, dynamic> placeData = dataList[index].value;

                        String address = placeData['address'];
                        String distance = placeData['distance'];
                        String materials = placeData['materials'];

                        return Material(
                          elevation: 4,
                          child: Card(
                            child: ListTile(
                              title: Text('$title,'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: Text(
                                      address,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text('$materials materials'),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 140.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: MyAppColors
                                                      .primaryColorDark,
                                                ),
                                                Text('$distance km away'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                } else {
                  return const Center(child: Text('No document found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<DocumentSnapshot> getPlacesAndData(String postcode) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return await firestore
        .collection('RecyclePlaces')
        .doc(postcode.toUpperCase())
        .get();
  }
}
