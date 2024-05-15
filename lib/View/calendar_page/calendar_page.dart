import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle_app/View/calendar_page/components/calendar.dart';
import 'package:recycle_app/View/calendar_page/components/recycling_places_information.dart';
import 'package:recycle_app/View/calendar_page/viewmodel/calendar_dates_provider.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Calendar widget
            Consumer(builder: (context, ref, __) {
              return CalendarWidget(
                toHighLight: ref.watch(randomDatesProvider),
              );
            }),
            //This is the collection places timimg and date and the type of recycle
            //items they accept for recycling
            RecyclingPlaceTimingInformationWidget()
          ],
        ),
      ),
    );
  }
}
