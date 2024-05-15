import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/Models/recycle_guide_category.dart';

class RecycleGuideFunctions {
  Future<RecycleGuideCategory> fetchCategoryFromFirestore(
      String documentId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot =
        await firestore.collection('recycledata').doc(documentId).get();
    debugPrint(snapshot.data().toString());
    RecycleGuideCategory category =
        RecycleGuideCategory.fromMap(snapshot.data()!);
    return category;
  }
}
