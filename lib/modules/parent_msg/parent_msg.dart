import 'package:badges/badges.dart';
import 'package:child_moments/modules/parent_msg/parent_msg_detailed.dart';
import 'package:flutter/material.dart';

import '../../models/msg_from_parent.dart';
import 'new_msg.dart';

class ParentMsg extends StatefulWidget {
  const ParentMsg({Key? key}) : super(key: key);

  @override
  State<ParentMsg> createState() => _ParentMsgState();
}

class _ParentMsgState extends State<ParentMsg> {
  final controller = TextEditingController();
  late List<MsgFromTheParent> searchMsg;
  String query = '';
  List<MsgFromTheParent> msgs = [
    MsgFromTheParent(
        Icons.arrow_circle_up, "msgTitle", "msgBody", "time", "fromAdminName"),
    MsgFromTheParent(
        Icons.arrow_circle_up, "msgTitle", "msgBody", "time", "fromAdminName"),
    MsgFromTheParent(
        Icons.arrow_circle_up, "msgTitle", "msgBody", "time", "fromAdminName"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent Msg"),
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
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "My Notes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.0, 1.0],
                        colors: [
                          Colors.deepPurple.shade400,
                          Colors.deepPurple.shade200,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ElevatedButton.icon(
                      label: const Text("New"),
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return const NewMsgParent();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: TextFormField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ParentMsgDetailed();
                          },
                        ));
                      },
                      child: ListTile(
                        leading: Icon(msgs[index].icon),
                        title: Column(
                          children: [
                            Text(msgs[index].msgTitle.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true),
                            Text(
                              msgs[index].msgBody.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              msgs[index].time.toString(),
                              style: const TextStyle(fontSize: 10),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              msgs[index].fromAdminName.toString(),
                              style: const TextStyle(fontSize: 10),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),

    );

  }
}
