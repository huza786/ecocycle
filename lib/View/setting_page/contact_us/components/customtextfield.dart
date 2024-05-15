import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, required this.isLarge});
  final String hintText;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: isLarge ? 186.h : 56.h,
        width: 326.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: isLarge ? Border.all() : Border.all(width: 0)),
        child: Padding(
          padding: EdgeInsets.all(isLarge ? 8 : 0),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: isLarge
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
          ),
        ),
      ),
    );
  }
}
