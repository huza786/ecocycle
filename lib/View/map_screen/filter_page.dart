import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

class FilterationPage extends StatelessWidget {
  const FilterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: MyAppColors.primaryColorDark,
            alignment: Alignment.topCenter,
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Filter',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 70,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      const Text(
                        "Type",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      const Text(
                        "Open On",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [FilterButton(), FilterButton()],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 37.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              color: MyAppColors.primaryColorDark),
                          child: const Center(
                              child: Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(27)),
      elevation: 4,
      child: Container(
        height: 37.h,
        width: 180.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(27)),
        child: const Center(child: Text("Recycling Park")),
      ),
    );
  }
}
