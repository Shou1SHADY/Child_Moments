import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import '../../../models/child_info.dart';
import '../childlist/widgets/circle_avatar.dart';
import 'daily_activity_widgets/items.dart';

class DailyActivities extends StatefulWidget {
  const DailyActivities({super.key});

  @override
  State<DailyActivities> createState() => _DailyActivitiesState();
}

class _DailyActivitiesState extends State<DailyActivities> {
  var myChild = ChildInfo(
      name: "name",
      age: " years",
      birthDay: "birthDay",
      gender: "gender",
      allegries: "allegries",
      medications: "medications",
      parent: "parent",
      email: "email",
      mobile: "mobile",
      address: "address");
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    PersonalInfo(),
    const DailyReport(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Activities"),
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 191,
              width: 331,
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                      width: 100,
                      child: Avatar(),
                    ),
                    Text(myChild.name.toString()),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(myChild.age.toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 350,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white38,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care), label: "Personal Info"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: "Activity"),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
