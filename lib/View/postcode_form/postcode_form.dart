import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/Models/Firebase/message_services.dart';
import 'package:recycle_app/View/postcode_form/recycle_place_provider.dart';
import 'package:recycle_app/View/postcode_form/viewmodel/userid_provider.dart';
import 'package:recycle_app/View/utils/colorslist.dart';
import 'package:recycle_app/View/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class PostCodeForm extends ConsumerStatefulWidget {
  const PostCodeForm({super.key});

  @override
  ConsumerState<PostCodeForm> createState() => _PostCodeFormState();
}

class _PostCodeFormState extends ConsumerState<PostCodeForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      asyncMethod();
    });
  }

  asyncMethod() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final userprovider = ref.read(userIdProvider.notifier);
    userprovider.addUserIdBySharedPref(pref);

    final String? postCode = pref.getString('postcode');
    if (postCode != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutes.navigationBar);

      await ref
          .read(recyclePlacesProvider.notifier)
          .getPlacesAndData(postCode, ref);
    }
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarRoundedElipse(),
              Padding(
                  padding: EdgeInsets.only(
                      top: 0.h, bottom: 50.h, left: 50.w, right: 50.w),
                  child: Padding(
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
                                    controller: ref
                                        .watch(recyclePlacesProvider.notifier)
                                        .textEditingController,
                                    style: const TextStyle(fontSize: 15),
                                    decoration: InputDecoration(
                                        hintText: "Postcode",
                                        contentPadding:
                                            const EdgeInsets.only(left: 16),
                                        hintStyle:
                                            const TextStyle(fontSize: 16),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color:
                                                  MyAppColors.primaryColorDark),
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
                  )),
              Consumer(builder: (context, ref, _) {
                final provider = ref.watch(recyclePlacesProvider.notifier);
                return Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(104)),
                  child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      //adding a verification that data exists in firebase
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      final query = await firestore
                          .collection('RecyclePlaces')
                          .doc(
                              provider.textEditingController.text.toUpperCase())
                          .get();
                      Map<String, dynamic>? dataMap = query.data();

                      if (dataMap != null) {
                        Navigator.pushReplacementNamed(
                            // ignore: use_build_context_synchronously
                            context,
                            AppRoutes.initialRoute);

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        List<RecyclePlace> places =
                            await provider.getPlacesAndData(
                                provider.textEditingController.text, ref);
                        //save a collection of meessage in firebase so that message can be shown onthe first time the app
                        //has been installed

                        if (places.isEmpty) {
                          // Show a dialog to inform the user that there are no recycling places in this area
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('No Recycling Places'),
                                content: const Text(
                                    'Sorry, there are no recycling places in this area.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          Uuid uid = const Uuid();
                          final userid = uid.v4();
                          prefs.setString('userid', userid);
                          FirebaseMessaging().sendAdminMessage(userid);

                          prefs.getString('userid');
                          // final userprovider = ref.read(userIdProvider.notifier);
                          // userprovider.addUserIdBySharedPref(prefs);

                          prefs.setString(
                              "postcode", provider.textEditingController.text);
                        }
                      } else {
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('No Recycling Places'),
                              content: const Text(
                                  'Sorry, there are no recycling places in this area.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
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
                            "Enter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text("   "),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
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
