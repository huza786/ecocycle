import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/utils/colorslist.dart';
import 'package:recycle_app/View/utils/constants_pics.dart';

class PictureHeaderHomePage extends StatelessWidget {
  const PictureHeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 433.h,
      width: 430.w,
      child: Stack(
        children: [
          Container(
            height: 433.h,
            width: 430.w,
            decoration: BoxDecoration(
                color: MyAppColors.primaryColorDark,
                borderRadius: BorderRadius.circular(30.h)),
            child: Center(
              child: Image.asset(
                PicsString().recycleBins,
                height: 346.h,
                width: 315.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //   top: 40.h,
          //   left: 30.w,
          //   child: IconButton(
          //       onPressed: () async {}, icon: const Icon(Icons.edit)),
          // )
        ],
      ),
    );
  }
}
