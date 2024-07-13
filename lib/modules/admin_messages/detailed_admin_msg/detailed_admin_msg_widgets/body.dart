import 'package:flutter/material.dart';

import '../../../../../models/detailed_admin_msg.dart';

class DetailedAdminMsgBody extends StatelessWidget {
  DetailedAdminMsgBody({super.key});

  var theDetailedAdminMsg = DetailedAdminMsg(
      attachment: 'no',
      fileDetails: 'no',
      msgBody: 'msg Body',
      myChildName: 'myChild',
      myImage: 'assets/images/child.png',
      senderIamge: 'assets/images/child.png',
      senderName: 'Sender',
      subject: 'Subject',
      temp: 'no',
      timeForSend: 'Time');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                theDetailedAdminMsg.senderIamge.toString(),
                height: 30,
                width: 30,
              ),
              Column(
                children: [
                  Text(theDetailedAdminMsg.senderName.toString()),
                  Text(theDetailedAdminMsg.timeForSend.toString()),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                theDetailedAdminMsg.senderIamge.toString(),
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(theDetailedAdminMsg.myChildName.toString()),
            ],
          ),
          Align(
              alignment: Alignment.center,
              child: Text(theDetailedAdminMsg.subject.toString())),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Body"),
                      Text(theDetailedAdminMsg.msgBody.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Files"),
                      Text(theDetailedAdminMsg.fileDetails.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Temp"),
                      Text(theDetailedAdminMsg.temp.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("attchment"),
                      Text(theDetailedAdminMsg.attachment.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
