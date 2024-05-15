import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStoragenotifier = NotifierProviderFamily<LocalStoragenotifier,
    SharedPreferences, SharedPreferences>(
  () {
    return LocalStoragenotifier();
  },
);

class LocalStoragenotifier
    extends FamilyNotifier<SharedPreferences, SharedPreferences> {
  @override
  SharedPreferences build(arg) {
    return arg;
  }
}
