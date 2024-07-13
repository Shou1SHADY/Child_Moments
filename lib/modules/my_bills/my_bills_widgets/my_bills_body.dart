import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../notification/notification.dart';
import '../my_bills_actions/my_bills_actions.dart';
import 'my_bills_search.dart';

class MyBillsDetailedScreen extends StatelessWidget {
  const MyBillsDetailedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bills"),
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
            const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(width: 200, child: MyBillsSearch())),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "My Bill",
                  style: TextStyle(fontSize: 32, color: Colors.blue),
                ),
                Image.asset(
                  "assets/images/billsImage.png",
                  height: 70,
                  width: 70,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Container(
              height: 350,
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Name"),
                      Text("Due Date"),
                      Text("Amount"),
                      Text("Total"),
                      Text("Type"),
                      Text("Payment Method"),
                      Text("Actions"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Student Name"),
                      const Text("20-10-2021"),
                      const Text("1500"),
                      const Text("1500"),
                      const Text("On-Time payment"),
                      const Text("Bank Account"),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const ActionsBills();
                            }));
                          },
                          icon: const Icon(Icons.upload_file))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
