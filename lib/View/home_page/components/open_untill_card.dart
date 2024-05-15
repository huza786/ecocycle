import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenUntilCard extends StatelessWidget {
  const OpenUntilCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        height: 101.h,
        width: 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            Text(
              "Recycling park’t recycleerederken",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            //
            Text(
              "Recyclagestraat 38 ,Recycleergem",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            // TIME left until open
            Text(
              "Open Unitil 10:00",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
