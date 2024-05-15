import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/postcode_form/recycle_place_provider.dart';
import 'package:recycle_app/View/map_screen/viewmodel/loadingprovider.dart';
import 'package:recycle_app/View/utils/colorslist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePostCode extends ConsumerStatefulWidget {
  const ChangePostCode({super.key});

  @override
  ConsumerState<ChangePostCode> createState() => _ChangePostCodeState();
}

class _ChangePostCodeState extends ConsumerState<ChangePostCode> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final string = ref.read(postcodeProvider);
    if (string != null) {
      controller.text = string.toUpperCase();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const AppbarRoundedElipse(),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    ref.watch(postcodeProvider);
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Edit Postcode",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Material(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: SizedBox(
                              width: 314.w,
                              height: 45,
                              child: Center(
                                child: Consumer(
                                  builder: (_, ref, __) {
                                    return TextFormField(
                                      controller: controller,
                                      style: const TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 16),
                                          hintStyle:
                                              const TextStyle(fontSize: 16),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                                color: MyAppColors
                                                    .primaryColorDark),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Consumer(builder: (context, ref, _) {
                  final postCodeProvider = ref.watch(postcodeProvider.notifier);
                  final recycleplaces =
                      ref.watch(recyclePlacesProvider.notifier);
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Material(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(104)),
                      child: InkWell(
                        onTap: () async {
                          //firstly place will be fetch from json in firebase
                          final placeList =
                              await recycleplaces.getPlacesAndData(
                                  controller.text.toUpperCase(), ref);
                          //check the value if empty
                          if (placeList.isNotEmpty) {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.getString('postcode');
                            postCodeProvider
                                .setPostCode(controller.text.toUpperCase());
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data not found"),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 206.w,
                          height: 42.h,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/icons/editbuttonpencil.png'),
                              const Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const Text("   "),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        !ref.watch(loadingRecyclePlaces)
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.black.withOpacity(.3)),
                child: const Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Center(child: CircularProgressIndicator())),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}

class AppbarRoundedElipse extends StatelessWidget {
  const AppbarRoundedElipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        child: Container(
          height: 433.h,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: MyAppColors.primaryColorDark,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              children: [
                const Text(
                  "Postcode",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Image.asset(
                  "assets/images/postcode.png",
                  height: 330.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class PostCodeNotifier extends AsyncNotifier<String> {
//   @override
//   FutureOr<String> build() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String? postcode = pref.getString('postcode');
//     if (postcode != null) {
//       state = postcode as AsyncValue<String>;
//       return postcode;
//     } else
//       state = '' as AsyncValue<String>;
//     return state;
//   }
// }
//postcode provider
final postcodeProvider = NotifierProvider<PostCodeNotifier, String?>(
  () {
    return PostCodeNotifier();
  },
);

class PostCodeNotifier extends Notifier<String?> {
  @override
  build() {
    state = '';
    return "";
  }

  Future<void> getPostCodeInstance() async {
    final pref = await SharedPreferences.getInstance();
    state = pref.getString("postcode");
  }

  void setPostCode(String value) {
    state = value;
  }
}
