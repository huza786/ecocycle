import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherRecyclePlaceInformationCard extends StatelessWidget {
  const OtherRecyclePlaceInformationCard(
      {super.key, required this.name, required this.timing});
  final String name;
  final String timing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Container(
          constraints: BoxConstraints(minHeight: 71.h),
          width: 370.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 242, 237, 237),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff0671AD),
                      borderRadius: BorderRadius.circular(8)),
                  height: 45.h,
                  width: 45.w,
                  child: const Icon(
                    Icons.location_on_sharp,
                    color: Colors.white,
                  )),
              //column incuding name and timing
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 290.w,
                      child: Text(
                        softWrap: true,
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: 290.w,
                      child: Text(
                        timing,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_sharp,
              )
            ],
          )),
    );
  }
}
