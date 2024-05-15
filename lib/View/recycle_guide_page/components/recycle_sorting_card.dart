import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecycleSortingCard extends StatelessWidget {
  const RecycleSortingCard({super.key, required this.title, required this.url});
  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Material(
        elevation: 4,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 150.h,
          width: 150.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  url,
                  height: 58.h,
                  width: 58.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
