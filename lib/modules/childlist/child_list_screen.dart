import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../../../core/components/Custom_child_list.dart';

import '../login_dashboard/dash_board.dart';
import '../notification/notification.dart';

class ChildListScreen extends StatelessWidget {
  const ChildListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Child on Board"),
          centerTitle: false,
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: const Text("1"),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return NotificationScreen();
                  }));
                },
                icon: const Icon(Icons.add_alert_outlined),
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[Colors.purple, Colors.blue]),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "My Children",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              GestureDetector(
                child: const ChildList(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const DashBoardScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
