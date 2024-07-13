import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ActivityCalender extends StatefulWidget {
  const ActivityCalender({super.key});

  @override
  State<ActivityCalender> createState() => _ActivityCalenderState();
}

class _ActivityCalenderState extends State<ActivityCalender> {
  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      maxDate: today,
      firstDayOfWeek: 7,
      headerDateFormat: "d",
      initialDisplayDate: today,
      minDate: today.subtract(
        const Duration(days: 5),
      ),
    );
  }
}
