import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/Models/calendar_highlighted_dates.dart';
import 'package:recycle_app/View/calendar_page/viewmodel/trashtype_provider.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/colorslist.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key, required this.toHighLight});
  final List<CalendarHighlightedDate> toHighLight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "Calendar",
          context: context,
          navigationEnabled: false,
        ),
        TableCalendar(
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              for (int i = 0; i < toHighLight.length; i++) {
                final d = toHighLight[i].dateTime;
                if (day.day == d.day &&
                    day.month == d.month &&
                    day.year == d.year) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Consumer(builder: (context, ref, _) {
                      return InkWell(
                        onTap: () {
                          //tap to change the bottom widget under calendar
                          ref
                              .watch(
                                trashTypeCalendarListProvider.notifier,
                              )
                              .setTrashTypeList(
                                toHighLight[i].trashTypes,
                              );
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '${day.day}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: toHighLight[i]
                                      .trashTypes
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                                color: e.color,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      )
                                      .toList())
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }
              }
              return null;
            },
          ),
          weekendDays: const [DateTime.sunday],
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          startingDayOfWeek: StartingDayOfWeek.monday,
          daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey, fontSize: 15),
              weekendStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          headerStyle: const HeaderStyle(
              titleCentered: true,
              titleTextStyle:
                  TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          calendarStyle: const CalendarStyle(
              defaultTextStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              markerDecoration: BoxDecoration(
                color: MyAppColors.primaryColorDark,
                shape: BoxShape.circle,
              ),
              todayDecoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
        ),
      ],
    );
  }
}
