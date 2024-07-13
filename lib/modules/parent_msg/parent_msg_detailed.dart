import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import '../../models/detailed_parent_msg.dart';

class ParentMsgDetailed extends StatelessWidget {
  ParentMsgDetailed({Key? key}) : super(key: key);
  var detailedMsg = DetailedParentMsg(
      senderIamge: 'assets/photos/Teachers.7466149e.png',
      senderName: 'Sender Name',
      timeForSend: 'time for send',
      myImage: 'assets/photos/Teachers.7466149e.png',
      myChildName: 'child Name',
      subject: 'Subject',
      msgBody: 'Msg Body',
      fileDetails: 'files',
      temp: 'temp',
      attachment: 'attachment');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detailed Msg"),
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    )),
                height: 600,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 50,
                            width: 50,
                            child: CircleAvatar(

                              child: Image.asset(
                                detailedMsg.senderIamge.toString(),
                              )
                              ,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  detailedMsg.senderName.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(detailedMsg.timeForSend.toString()),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                               
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(children: [
                              Container(
                                decoration: const BoxDecoration(

                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  child: Image.asset(
                                    detailedMsg.myImage.toString(),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Text(detailedMsg.myChildName.toString()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            detailedMsg.subject.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Subject"),
                          Text(detailedMsg.subject.toString()),
                          const Divider(),
                          const Text("Files"),
                          Text(detailedMsg.fileDetails.toString()),
                          const Divider(),
                          const Text("Templates"),
                          Text(detailedMsg.temp.toString()),
                          const Divider(),
                          const Text("Answer"),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 150,
                              height: 50,
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
                                label: const Text("Click to Upload"),
                                icon: const Icon(Icons.upload_file),
                                onPressed: () {
                                  getImage();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
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
                            label: const Text("Send"),
                            icon: const Icon(Icons.send),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
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