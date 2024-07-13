import 'package:flutter/material.dart';

import '../../models/teacher.dart';

class TeacherInfo extends StatelessWidget {
  Teacher teacher;
  TeacherInfo({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Child moments")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              height: 150,
              child: Column(children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundImage: AssetImage(teacher.avatar.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(teacher.firstName.toString()),
              ]),
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.numbers),
              title: teacher.phone != null
                  ? Text("mobile: ${teacher.phone}")
                  : const Text(
                      "Mobile number information is not available",
                      style: TextStyle(
                          color: Color.fromARGB(255, 118, 118, 118),
                          fontSize: 14),
                    ),
            ),
            const Divider(),
            ListTile(
              trailing: teacher.gender == 'Male'
                  ? const Icon(Icons.male_rounded)
                  : const Icon(Icons.female_rounded),
              title: teacher.gender != null
                  ? Text("gender: ${teacher.gender}")
                  : const Text(
                      "gender information is not available",
                      style: TextStyle(
                          color: Color.fromARGB(255, 118, 118, 118),
                          fontSize: 14),
                    ),
            ),
            const Divider(),
            ListTile(
              trailing: const Icon(Icons.location_on),
              title: teacher.address != null
                  ? Text("address: ${teacher.address}")
                  : const Text(
                      "address information is not available",
                      style: TextStyle(
                          color: Color.fromARGB(255, 118, 118, 118),
                          fontSize: 14),
                    ),
            ),
          ]),
        ),
      ),
    );
  }
}
