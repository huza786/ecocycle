import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

class ContactAppBar extends StatelessWidget {
  const ContactAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 305.h,
          decoration: const BoxDecoration(
              color: MyAppColors.primaryColorDark,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500))),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 150.h,
          left: 175.h - 42.h,
          child: const Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
