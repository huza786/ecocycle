import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapFocusProvider = NotifierProvider<FocusInt, int>(() {
  return FocusInt();
});

class FocusInt extends Notifier<int> {
  @override
  int build() {
    state = 0;
    return 0;
  }

  void toggleValue(int value) {
    state = value;
  }
}
