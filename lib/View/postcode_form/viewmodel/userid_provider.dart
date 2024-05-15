import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userIdProvider = NotifierProvider<UserId, String>(
  () {
    return UserId();
  },
);

class UserId extends Notifier<String> {
  @override
  build() {
    return '';
  }

  addUserIdBySharedPref(SharedPreferences pref) {
    final userid = pref.getString("userid");
    state = userid!;
  }
}
