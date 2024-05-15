import 'package:flutter/widgets.dart';

class CalendarHighlightedDate {
  final DateTime dateTime;
  final List<TrashType> trashTypes;

  CalendarHighlightedDate({required this.dateTime, required this.trashTypes});
}

class TrashType {
  final Color color;
  final String text;
  final String assetPath;

  TrashType({required this.color, required this.text, required this.assetPath});
}
