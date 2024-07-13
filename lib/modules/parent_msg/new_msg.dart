import 'package:badges/badges.dart';
import 'package:child_moments/models/parent.dart';
import 'package:flutter/material.dart';
import "package:images_picker/images_picker.dart";

List<String> temp = <String>[
  "Registeration form",
  "Vaccination form",
];
List<String> attach = <String>[
  "attachment 1",
  "attachment 2",
];

List<String> students = <String>['Student 1', 'Student 2'];

List<Parent> parent = [
// Parent("studentName", false, "parentName"),
//   Parent("studentName", false, "parentName"),
];

class NewMsgParent extends StatefulWidget {
  const NewMsgParent({Key? key}) : super(key: key);

  @override
  State<NewMsgParent> createState() => _NewMsgParentState();
}

class _NewMsgParentState extends State<NewMsgParent> {
  String dropValue = temp.first;
  String dropValueAttachment = attach.first;
  String studentValue = students.first;
  bool showTemp = false;
  bool showattachment = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("New Note"),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: "Note Title",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Note Title",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Note Text",
                    labelText: "Note Text",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              DropdownButton<String>(
                value: dropValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropValue = value!;
                    if (dropValue == "Registeration form") {
                      showTemp = true;
                    } else if (dropValue == "Vaccination form") {
                      showTemp = true;
                    } else {
                      showTemp = false;
                    }
                  });
                },
                items: temp.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              showTemp
                  ? ListTile(
                      trailing: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          setState(() {
                            showTemp = false;
                          });
                        },
                        label: const Text(""),
                      ),
                      title: Text(dropValue.toString()),
                    )
                  : Container(),
              DropdownButton<String>(
                value: dropValueAttachment,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropValueAttachment = value!;
                    if (dropValueAttachment == "attachment 1") {
                      showattachment = true;
                    } else if (dropValueAttachment == "attachment 2") {
                      showattachment = true;
                    } else {
                      showattachment = false;
                    }
                  });
                },
                items: attach.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              showattachment
                  ? ListTile(
                      trailing: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          setState(() {
                            showattachment = false;
                          });
                        },
                        label: const Text(""),
                      ),
                      title: Text(dropValueAttachment.toString()),
                    )
                  : Container(),
              Container(
                width: 200,
                height: 40,
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
                  onPressed: () {
                    getImage();
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text("Click to Upload"),
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
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Send To:"),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      )),
                    ),
                  ),
                ],
              ),

              //here to add the code

              // DropdownButton<String>(
              //   value: studentValue,
              //   icon: const Icon(Icons.arrow_downward),
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.deepPurple),
              //   underline: Container(
              //     height: 2,
              //   ),
              //   onChanged: (String? value) {
              //     // This is called when the user selects an item.
              //     setState(() {
              //       studentValue = value!;
              //     });
              //   },
              //   items: students.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
// to add another code here for table
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: parent.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: parent[index].verified,
                        onChanged: (value) {
                          selected = !value!;
                          parent[index].verified = value;
                          setState(() {});
                        },
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(parent[index].firstName!,
                              style: const TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true),
                          Text(
                            parent[index].sId.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                width: 200,
                height: 40,
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
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text("Add Message"),
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
