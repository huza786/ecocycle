import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/collection_type.dart';

class CollectionCard extends StatelessWidget {
  final String dateString;
  final String dayString;
  final List<CollectionType> collectionListType;

  const CollectionCard(
      {super.key,
      required this.dateString,
      required this.dayString,
      required this.collectionListType});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 175.h,
        width: 175.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //DATE
            Text(
              dateString,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            //DAY
            Text(
              dayString,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
            ),
            Column(
              children: collectionListType
                  .map((type) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: CollectionTypeButtonShape(collectionType: type),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionTypeButtonShape extends StatelessWidget {
  final CollectionType collectionType;
  const CollectionTypeButtonShape({super.key, required this.collectionType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26), color: collectionType.color),
      child: Row(
        children: [
          Image.asset(collectionType.stringImagePath),
          SizedBox(
            child: Text(
              collectionType.name,
              softWrap: true,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
