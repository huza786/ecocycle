import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/Models/calendar_highlighted_dates.dart';

final trashTypeCalendarListProvider =
    NotifierProvider<TrashtypeProvider, List<TrashType>>(
  () => TrashtypeProvider(),
);

class TrashtypeProvider extends Notifier<List<TrashType>> {
  @override
  List<TrashType> build() {
    return [];
  }

  void setTrashTypeList(List<TrashType> list) {
    state = list;
  }
}
