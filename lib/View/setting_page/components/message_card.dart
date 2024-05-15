import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: SizedBox(
        width: 350.w,
        height: 160.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //colors showing if its a sender or reciever
            Container(
              width: 34.w,
              color: color,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //divider
                Padding(
                  padding: EdgeInsets.only(top: 31.h),
                  child: SizedBox(width: 315.w, child: const Divider()),
                ),
                //row containing date and time of message
                SizedBox(
                  width: 270.w,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "04/07/2024",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Text(
                        "07:00am",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
