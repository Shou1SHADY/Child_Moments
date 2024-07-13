import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../../../core/components/color_cutom_button.dart';
import '../notification/notification.dart';
import 'admin_msg_widgets/admin_msg_list.dart';
import 'admin_msg_widgets/admin_msg_search.dart';
import 'new_msg/new_msg.dart';

class AdminMsgBoard extends StatelessWidget {
  const AdminMsgBoard({super.key});

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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 160, child: AdminMsgSearch()),
                ColorCustomButton(
                  myColor: const MaterialStatePropertyAll(Colors.purple),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const SendNewMsgToAdmin();
                        },
                      ),
                    );
                  },
                  buttomText: "New",
                  buttonSize: 80,
                  heightSize: 60,
                  borderSize: 20,
                ),
              ],
            ),
            const AdminMsgList(),
          ],
        ),
      ),
    );
  }
}
