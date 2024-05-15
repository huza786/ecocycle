import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingRecyclePlaces = NotifierProvider<LoadRecyclePlaceBool, bool>(
  () => LoadRecyclePlaceBool(),
);

class LoadRecyclePlaceBool extends Notifier<bool> {
  @override
  bool build() {
    //
    state = false;
    return false;
  }

  void toggleBool(bool value) {
    state = value;
  }
}
