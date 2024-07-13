import 'package:badges/badges.dart';
import 'package:child_moments/models/teacher.dart';

import 'package:flutter/material.dart';

import '../../../models/login_teacher.dart';
import '../chat_screen.dart';

class SelectTeacher extends StatelessWidget {
  SelectTeacher({super.key});

  List<LoginTeacher> teachers = <LoginTeacher>[
    LoginTeacher("assets/photos/classes.1f8b8228.png", "teacherName"),
    LoginTeacher("assets/photos/Invoice.d2acd90d.png", "teacher2Name"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Board"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: const Text("1"),
            child: IconButton(
              onPressed: () {},
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
          child: Center(
            child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        width: 250,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: <Color>[Colors.purple, Colors.blue]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                    teachers[index].teacherImage.toString()),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                teachers[index].teacherName.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const ChatScreen();
                      }));
                    },
                  );
                })),
          )),
    );
  }
}
