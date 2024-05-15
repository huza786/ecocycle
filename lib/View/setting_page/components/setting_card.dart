import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingCard extends StatelessWidget {
  const SettingCard(
      {super.key, required this.title, required this.iconImagePath});
  final String title;
  final String iconImagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      iconImagePath,
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

/*** 
 * ListTile(
          leading: ,
          title: ,
          subtitle: Divider(),
          trailing:,
        )*/