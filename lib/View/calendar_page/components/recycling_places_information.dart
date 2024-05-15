import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/collection_type.dart';
import 'package:recycle_app/View/calendar_page/components/open_hours_card.dart';
import 'package:recycle_app/View/calendar_page/components/other_recycle_places_card.dart';
import 'package:recycle_app/View/calendar_page/viewmodel/trashtype_provider.dart';
import 'package:recycle_app/View/home_page/components/collection_card.dart';
import 'package:recycle_app/View/navigation_bar/view_model/bottom_nav_bar_provider.dart';
import 'package:recycle_app/View/postcode_form/recycle_place_provider.dart';
import 'package:recycle_app/View/map_screen/viewmodel/loadingprovider.dart';
import 'package:recycle_app/View/map_screen/viewmodel/map_focus_integer.dart';

class RecyclingPlaceTimingInformationWidget extends StatelessWidget {
  RecyclingPlaceTimingInformationWidget({super.key});
  final List<String> otherPlacesInfo = [
    'Nashville',
    "Houffalize",
    "Vaux-sur-Sure",
    "Ryeparc Bertogne-Sainte-Ode"
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: const Text(
                "Collection of",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ),
            Consumer(builder: (context, ref, _) {
              final trashListProvider =
                  ref.watch(trashTypeCalendarListProvider);
              return Wrap(
                children: trashListProvider
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: CollectionTypeButtonShape(
                          collectionType:
                              CollectionType(e.text, e.assetPath, e.color),
                        ),
                      ),
                    )
                    .toList(),
              );
            }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: const Text(
                "Opening hours of your nearest Ecocycling Park",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            //card that show the location cordinates of nearest  recyling park
            Consumer(builder: (context, ref, _) {
              return ref.watch(loadingRecyclePlaces)
                  ? InkWell(
                      onTap: () {
                        ref.watch(mapFocusProvider.notifier).toggleValue(0);
                        ref.watch(navBarBottomProvider.notifier).getPage(2);
                      },
                      child: OpenHoursCard(
                        recyclePlace: ref.watch(recyclePlacesProvider)[0],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CircularProgressIndicator(),
                    );
            }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Divider()),
            ),
            const Text(
              "Opening hours of other Ecocycling Parks",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Consumer(builder: (context, ref, _) {
              final recycleplaces = ref.watch(recyclePlacesProvider);

              return ref.watch(loadingRecyclePlaces)
                  ? Column(
                      children: otherPlacesInfo
                          .asMap()
                          .entries
                          .map((e) => InkWell(
                                onTap: () {
                                  //navigate to map screen by changing the nav bar
                                  ref
                                      .watch(mapFocusProvider.notifier)
                                      .toggleValue(e.key + 1);
                                  ref
                                      .watch(navBarBottomProvider.notifier)
                                      .getPage(2);
                                },
                                child: OtherRecyclePlaceInformationCard(
                                  name: recycleplaces[e.key + 1].name,
                                  timing: recycleplaces[e.key + 1].address,
                                ),
                              ))
                          .toList(),
                    )
                  : const Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: CircularProgressIndicator(),
                    ));
            })
          ],
        ),
      ),
    );
  }
}
