// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/collection_type.dart';
import 'package:recycle_app/View/home_page/components/collection_card.dart';
import 'package:recycle_app/View/home_page/components/collection_text.dart';
import 'package:recycle_app/View/home_page/components/picture_header.dart';
import 'package:recycle_app/View/map_screen/viewmodel/marker_icon.dart';
import 'package:recycle_app/View/postcode_form/viewmodel/userid_provider.dart';
import 'package:recycle_app/View/utils/constants_pics.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<CollectionType> testOne = [
    CollectionType(
        "Residual Waste", PicsString().residualWasteCollection, Colors.black),
    CollectionType("Paper", PicsString().paperCollection, Color(0xffFF9900)),
  ];

  final List<CollectionType> testTwo = [
    CollectionType("PMD", PicsString().pmdCollection, Color(0xff7E898C)),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      asyncMethod();
    });
  }

  asyncMethod() async {
    await ref.watch(mapMarkerProvider.notifier).loadIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PictureHeaderHomePage(),
          CollectionText(),
          //the follwing show the next pickup day with timing
          Padding(
            padding: EdgeInsets.only(top: 55.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CollectionCard(
                  dateString: '04-04-2024',
                  dayString: 'Thursday',
                  collectionListType: testOne,
                ),
                CollectionCard(
                  dateString: '04-04-2024',
                  dayString: 'Thursday',
                  collectionListType: testTwo,
                ),
              ],
            ),
          ),
          //card that shows how mus=ch time is left open
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SearchResult()));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Material(
          //       elevation: 4,
          //       child: SizedBox(
          //         height: 50.h,
          //         width: 200.w,
          //         child: Center(child: Text("Search Postcode")),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
    // Padding(
    //         padding: EdgeInsets.only(top: 15.h),
    //         child: OpenUntilCard(),
    //       ),