import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionText extends StatelessWidget {
  const CollectionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, top: 20.h),
      child: Text(
        'Next Collection',
        style: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
