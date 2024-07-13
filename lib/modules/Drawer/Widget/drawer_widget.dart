import 'package:flutter/material.dart';

import '../../auth/login_screen.dart';
import '../../profile/profile.dart';
import '../../admin_messages/admin_msg.dart';
import '../../my_bills/my_bills.dart';

class DrawerComponants extends StatelessWidget {
  const DrawerComponants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const Profile();
                  },
                ));
              },
              child: const CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage("assets/images/child.png")),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Child Name",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const AdminMsgBoard();
              }));
            },
            leading: Image.asset('assets/images/admin.png'),
            title: const Text(
              "Admin Messages",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          const SizedBox(height: 10),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const MyBills();
              }));
            },
            leading: Image.asset('assets/images/bills.png'),
            title: const Text(
              "My Bills",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
                child: Column(
                  children: [
                    Image.asset("assets/images/callus.png"),
                    const Text(
                      "Call us",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                child: Column(
                  children: [
                    Image.asset("assets/images/about.png"),
                    const Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
                child: Column(
                  children: [
                    Image.asset("assets/images/help.png"),
                    const Text(
                      "Help",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 30,
                child: Column(
                  children: [
                    InkWell(
                      child: Image.asset("assets/images/logout.png"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ));
                      },
                    ),
                    const Text(
                      "Exit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
