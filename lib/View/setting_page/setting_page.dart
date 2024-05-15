import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/Models/Firebase/message_services.dart';
import 'package:recycle_app/View/postcode_form/viewmodel/userid_provider.dart';
import 'package:recycle_app/View/setting_page/components/setting_card.dart';
import 'package:recycle_app/View/setting_page/postcode_change.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  final List<SettingButtonClass> settingList = [
    SettingButtonClass(
        title: "Messages", iconPath: "assets/icons/settings/messages.png"),
    SettingButtonClass(
        title: "About Us", iconPath: "assets/icons/settings/about.png"),
    SettingButtonClass(
        title: "Contact Us", iconPath: "assets/icons/settings/contact.png"),
    SettingButtonClass(
        title: "FAQs", iconPath: "assets/icons/settings/faq.png"),
    SettingButtonClass(
        title: "Setting", iconPath: "assets/icons/settings/settings.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
          title: "Setting",
          context: context,
          navigationEnabled: false,
        ),
        Column(children: [
          //Messages card
          Consumer(builder: (context, ref, _) {
            return InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                final userprovider = ref.read(userIdProvider.notifier);
                userprovider.addUserIdBySharedPref(prefs);
                Navigator.pushNamed(context, AppRoutes.messagePage);
              },
              child: SettingCard(
                  title: settingList[0].title,
                  iconImagePath: settingList[0].iconPath),
            );
          }),
          //About Us
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.aboutUs);
            },
            child: SettingCard(
                title: settingList[1].title,
                iconImagePath: settingList[1].iconPath),
          ),
          //Contact Us
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.contactUs);
            },
            child: SettingCard(
                title: settingList[2].title,
                iconImagePath: settingList[2].iconPath),
          ),
          //Faqs
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.faqs);
            },
            child: SettingCard(
                title: settingList[3].title,
                iconImagePath: settingList[3].iconPath),
          ),
          //Setting
          Consumer(builder: (context, ref, _) {
            return InkWell(
              onTap: () async {
                await ref
                    .watch(postcodeProvider.notifier)
                    .getPostCodeInstance();
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, AppRoutes.postCodeChange);
              },
              child: SettingCard(
                  title: settingList[4].title,
                  iconImagePath: settingList[4].iconPath),
            );
          }),
        ])
      ]),
    );
  }
}

class SettingButtonClass {
  final String title;
  final String iconPath;

  SettingButtonClass({required this.title, required this.iconPath});
}
