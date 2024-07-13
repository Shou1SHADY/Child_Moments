import 'package:flutter/material.dart';

import '../../../../models/msg_from_admin.dart';

class MsgFromToAdmin extends StatelessWidget {
  List<MsgFromTheAdmin> msgs = [
    MsgFromTheAdmin(
        Icons.arrow_circle_up, "msgTitle", "msgBody", "time", "fromAdminName"),
    MsgFromTheAdmin(
        Icons.arrow_circle_up, "msgTitle", "msgBody", "time", "fromAdminName"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: msgs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(msgs[index].icon, color: Colors.red),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(msgs[index].msgTitle.toString(),
                    style: const TextStyle(fontSize: 18),
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
    );
  }
}
