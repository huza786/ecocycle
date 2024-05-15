import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/calendar_highlighted_dates.dart';
import 'package:recycle_app/View/postcode_form/recycle_place_provider.dart';

class OpenHoursCard extends StatelessWidget {
  final RecyclePlace recyclePlace;
  const OpenHoursCard({super.key, required this.recyclePlace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.h),
      child: Material(
        elevation: 4,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Name of the Place
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    recyclePlace.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                //Location Coordinates of the Place
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    recyclePlace.address,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                //Timing  of the Place
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    recyclePlace.distance.toString() + " Km away",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
