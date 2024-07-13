import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../notification/notification.dart';
import 'detailed_admin_msg_widgets/body.dart';

class DetailedAdminMsg extends StatelessWidget {
  const DetailedAdminMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Msg"),
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
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Image.asset(
                      "assets/images/mail.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: DetailedAdminMsgBody(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
