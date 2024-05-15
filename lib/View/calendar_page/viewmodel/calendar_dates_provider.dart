import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/Models/calendar_highlighted_dates.dart';
import 'package:recycle_app/View/utils/constants_pics.dart';

final randomDatesProvider =
    NotifierProvider<CalendarNotifier, List<CalendarHighlightedDate>>(
  () {
    return CalendarNotifier();
  },
);

class CalendarNotifier extends Notifier<List<CalendarHighlightedDate>> {
  final paperTrash = TrashType(
      color: const Color(0xffFF9900),
      text: "Paper",
      assetPath: PicsString().paperCollection);
  final residualTrash = TrashType(
      color: const Color(0xff7E898C),
      text: "Residual Waste",
      assetPath: PicsString().residualWasteCollection);
  final pmdTrash = TrashType(
      color: const Color(0xff1C2E35),
      text: "PMD",
      assetPath: PicsString().paperCollection);
  @override
  build() {
    final random = Random();
    final currentDate = DateTime.now();
    final startDate = DateTime(currentDate.year, currentDate.month,
        1); // Start date is the first day of the current month
    final endDate = DateTime(currentDate.year, currentDate.month + 1,
        0); // End date is the last day of the current month
    List<CalendarHighlightedDate> randomDates = [];

    for (int i = 0; i < 4; i++) {
      final randomDate = DateTime.fromMillisecondsSinceEpoch(
          startDate.millisecondsSinceEpoch +
              random.nextInt(endDate.difference(startDate).inMilliseconds));
      if (i == 0) {
        randomDates.add(CalendarHighlightedDate(
            dateTime: randomDate,
            trashTypes: [paperTrash, pmdTrash, residualTrash]));
      } else if (i == 1) {
        randomDates.add(CalendarHighlightedDate(
            dateTime: randomDate, trashTypes: [pmdTrash, residualTrash]));
      } else if (i == 2) {
        randomDates.add(CalendarHighlightedDate(
            dateTime: randomDate, trashTypes: [paperTrash]));
      } else if (i == 3) {
        randomDates.add(CalendarHighlightedDate(
            dateTime: randomDate, trashTypes: [pmdTrash, paperTrash]));
      }
    }

    return randomDates;
  }
}
