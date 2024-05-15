import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarBottomProvider =
    StateNotifierProvider<NavigationBottomBarProvider, int>(
  (ref) {
    return NavigationBottomBarProvider();
  },
);

class NavigationBottomBarProvider extends StateNotifier<int> {
  NavigationBottomBarProvider() : super(0);
  void getPage(int index) {
    state = index;
  }
}
