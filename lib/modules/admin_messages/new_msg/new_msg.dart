import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../notification/notification.dart';
import 'new_msg_widgets/drop_down_child_list.dart';
import 'new_msg_widgets/text_field.dart';
import 'package:images_picker/images_picker.dart';

class SendNewMsgToAdmin extends StatefulWidget {
  const SendNewMsgToAdmin({super.key});

  @override
  State<SendNewMsgToAdmin> createState() => _SendNewMsgToAdminState();
}

class _SendNewMsgToAdminState extends State<SendNewMsgToAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Message"),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DropListChild(),
              MsgTextField(
                hitText: "Note Title",
                boxHeight: 60,
                tobeDone: () {},
                onComplete: () {},
              ),
              MsgTextField(
                hitText: "Note Text",
                boxHeight: 200,
                tobeDone: () {},
                onComplete: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var image = await getImage();
                      },
                      icon: const Icon(Icons.upload),
                    ),
                    const Text("Upload"),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future getImage() async {
  List<Media>? res = await ImagesPicker.pick(
    count: 3,
    pickType: PickType.image,
  );
// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)
}
