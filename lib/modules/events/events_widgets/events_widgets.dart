import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class EventsCalender extends StatelessWidget {
  const EventsCalender({super.key});
  DateTime get now => DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: const Scaffold(
        body: WeekView(),
      ),
    );
  }
}
