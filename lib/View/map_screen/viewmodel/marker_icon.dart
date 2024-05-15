import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

final markerfuture = FutureProvider((ref) => MarkerIcon().loadIcon());

final mapMarkerProvider = NotifierProvider<MarkerIcon, Uint8List>(
  () {
    return MarkerIcon();
  },
);

class MarkerIcon extends Notifier<Uint8List> {
  @override
  Uint8List build() {
    //
    return Uint8List(0);
  }

  Future<Uint8List> loadIcon() async {
    state = await getBytesFromAsset("assets/icons/marker_icon.png", 80);
    return state;
  }
}
