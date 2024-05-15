import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationDrawerHomePage extends StatelessWidget {
  const NavigationDrawerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      backgroundColor: Colors.white,
      indicatorColor: Colors.white,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 90.w),
          child: const Text(
            'List View',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/battery.png',
                  height: 39,
                  width: 39,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Glassbin",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/battery.png',
                  height: 39,
                  width: 39,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Glassbin",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        )
      ],
    );
  }
}
