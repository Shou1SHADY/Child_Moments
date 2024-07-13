import 'package:flutter/material.dart';

import '../../../../Constants/strings.dart';
import '../../../../core/components/Custom_circle.dart';

import '../../chats/AlertDialog/select_techer.dart';
import '../../daily_activity/daily_activity.dart';
import '../../events/events_screen.dart';

class MyDashItems extends StatelessWidget {
  const MyDashItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          GestureDetector(
            child: CustomCircle("Daily Activity", activityImage),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const DailyActivities();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          GestureDetector(
            child: CustomCircle("Events", eventsImage),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const EventsScreen();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          GestureDetector(
            child: CustomCircle("Chat", chatImage),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return SelectTeacher();
                  },
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
