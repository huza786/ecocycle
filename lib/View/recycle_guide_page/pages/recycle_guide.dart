import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/recycle_guide_category.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/routes.dart';

class RecycleGuideScreen extends StatelessWidget {
  const RecycleGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RecycleGuideArgumntsClass;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //App Bar
            SizedBox(
              height: 510.h,
              child: Stack(
                children: [
                  CustomAppBar(
                    navigationEnabled: true,
                    title: args.category.name,
                    context: context,
                  ),
                  Positioned(
                    top: 85,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 4,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 390.h,
                        width: 430.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Image.network(
                          args.imgPath,
                          height: 170.h,
                          width: 170.w,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // args.category.subCategories.map((e) => )
            //allowedornot
            args.category.subCategories.isEmpty
                ? Column(
                    children: [
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" "),
                              Text(
                                "Allowed",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                children:
                                    splitAndReplace(args.category.allowedItems)
                                        .map((e) => Text(e))
                                        .toList()),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" "),
                              Text(
                                "Not Allowed",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                children: splitAndReplace(
                                        args.category.disAllowedItems)
                                    .map((e) => Text(e))
                                    .toList()),
                          ),
                        ],
                      )
                    ],
                  )
                :
                //SubCategories
                Column(
                    children: args.category.subCategories
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.recycleGuide,
                                          arguments: RecycleGuideArgumntsClass(
                                              args.name, args.imgPath, e));
                                    },
                                    child: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.name,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Icon(Icons.arrow_forward_ios)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider()
                                ],
                              ),
                            ))
                        .toList())
          ],
        ),
      ),
    );
  }
}

class RecycleGuideArgumntsClass {
  final String name;
  final String imgPath;
  final RecycleGuideCategory category;

  RecycleGuideArgumntsClass(this.name, this.imgPath, this.category);
}

List<String> splitAndReplace(String input) {
  List<String> items = input.split(" * ");
  for (int i = 0; i < items.length; i++) {
    items[i] = items[i].replaceAll("*", " ");
  }
  return items;
}
