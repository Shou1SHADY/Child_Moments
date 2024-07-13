import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:chat_bubbles/chat_bubbles.dart';

import '../notification/notification.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const BubbleSpecialThree(
                text: 'Added iMassage shape bubbles',
                color: Color(0xFF1B97F3),
                tail: false,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const BubbleSpecialThree(
                text: 'Please try and give some feedback on it!',
                color: Color(0xFF1B97F3),
                tail: true,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const BubbleSpecialThree(
                text: 'Sure',
                color: Color(0xFFE8E8EE),
                tail: false,
                isSender: false,
              ),
              const BubbleSpecialThree(
                text: "I tried. It's awesome!!!",
                color: Color(0xFFE8E8EE),
                tail: false,
                isSender: false,
              ),
              const BubbleSpecialThree(
                text: "Thanks",
                color: Color(0xFFE8E8EE),
                tail: true,
                isSender: false,
              ),
              const Spacer(),
              MessageBar(
                messageBarColor: Colors.white70,
                onSend: (_) => print(_),
                actions: [
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 8, right: 8),
                  //   child: InkWell(
                  //     child: Icon(
                  //       Icons.camera_alt,
                  //       color: Colors.green,
                  //       size: 24,
                  //     ),
                  //     onTap: () {},
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
