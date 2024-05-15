import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/Models/Firebase/recycle_guide_firebase.dart';
import 'package:recycle_app/View/recycle_guide_page/components/recycle_sorting_card.dart';
import 'package:recycle_app/View/recycle_guide_page/pages/recycle_guide.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/routes.dart';

class RecyclingInformation extends StatelessWidget {
  RecyclingInformation({super.key});

  final List<RecyclingSort> recyclingInfomation = [
    RecyclingSort(name: 'Battery', imgPath: ''),
    RecyclingSort(name: 'Electronic', imgPath: ''),
    RecyclingSort(name: 'Tree', imgPath: ''),
    RecyclingSort(name: 'Construction', imgPath: ''),
    RecyclingSort(name: 'Food', imgPath: ''),
    RecyclingSort(name: 'Glass', imgPath: ''),
    RecyclingSort(name: 'Household', imgPath: ''),
    RecyclingSort(name: 'Organic Waste', imgPath: ''),
    RecyclingSort(name: 'KGA', imgPath: ''),
    RecyclingSort(name: 'Metals', imgPath: ''),
    RecyclingSort(name: 'Not Allowed', imgPath: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              navigationEnabled: false,
              title: 'Ecocycling',
              context: context,
            ),
            Wrap(
              children: recyclingInfomation
                  .map(
                    (e) => FutureBuilder(
                        future: imageUrlGetter(e.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox.shrink();
                          } else {
                            return GestureDetector(
                              onTap: () async {
                                try {
                                  final category = await RecycleGuideFunctions()
                                      .fetchCategoryFromFirestore(e.name);
                                  Navigator.pushNamed(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    AppRoutes.recycleGuide,
                                    arguments: RecycleGuideArgumntsClass(
                                      e.name,
                                      snapshot.data!,
                                      category,
                                    ),
                                  );
                                } catch (e) {
                                  // Show a snack bar indicating the error message
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Error: Data not available'),
                                    ),
                                  );
                                }
                              },
                              child: RecycleSortingCard(
                                  title: e.name, url: snapshot.data!),
                            );
                          }
                        }),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class RecyclingSort {
  final String name;
  final String imgPath;

  RecyclingSort({required this.name, required this.imgPath});
}

Future<String> imageUrlGetter(String name) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final imageMapData =
      await firestore.collection('RecycleImages').doc(name).get();

  final url = imageMapData.data()!['image'];
  return url;
}
/**FutureBuilder(
                          future: imageUrlGetter(e.name),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox.shrink();
                            } else {
                              return */