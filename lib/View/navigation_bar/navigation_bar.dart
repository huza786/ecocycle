import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/View/calendar_page/calendar_page.dart';

import 'package:recycle_app/View/home_page/home_page.dart';
import 'package:recycle_app/View/map_screen/map_screen.dart';
import 'package:recycle_app/View/navigation_bar/view_model/bottom_nav_bar_provider.dart';
import 'package:recycle_app/View/recycle_guide_page/recycling_guide_menu.dart';
import 'package:recycle_app/View/setting_page/setting_page.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final navBarProvider = ref.watch(navBarBottomProvider);
      final navBarProviderClass = ref.watch(navBarBottomProvider.notifier);
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          unselectedLabelStyle: const TextStyle(fontSize: 0),
          backgroundColor: MyAppColors.primaryColorLight,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.grey,
          currentIndex: navBarProvider,
          onTap: (n) => navBarProviderClass.getPage(n),
          items: const <BottomNavigationBarItem>[
            //Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            //Calendar
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
              label: 'Calendar',
            ),
            //Location
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
            //Recycle
            BottomNavigationBarItem(
              icon: Icon(Icons.recycling),
              label: 'Recycling',
            ),
            //Setting
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
        body: _buildBody(
            navBarProvider), // Added method to build body based on selected index
      );
    });
  }
}

Widget _buildBody(int index) {
  switch (index) {
    //Location Page
    case 0:
      return HomePage();
    //Calendar
    case 1:
      return const CalendarPage();
    //Location
    case 2:
      return const LocationScreen();
    //Recycle
    case 3:
      return RecyclingInformation();
    //Setting
    case 4:
      return SettingPage();
    default:
      return const SizedBox.shrink(); // Empty widget if index is out of range
  }
}
