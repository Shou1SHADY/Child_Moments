import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../Drawer/drawer.dart';
import '../notification/notification.dart';
import 'dash_board_widgets/dash_board_items.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("Dash Board"),
          centerTitle: true,
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
        body: const MyDashItems(),
      ),
    );
  }
}
