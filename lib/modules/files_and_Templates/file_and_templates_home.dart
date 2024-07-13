import 'package:badges/badges.dart';
import 'package:child_moments/models/templates_all.dart';
import 'package:child_moments/modules/files_and_Templates/new_template.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/files.dart';

bool page = false;

class FileTemp extends StatefulWidget {
  const FileTemp({Key? key}) : super(key: key);

  @override
  State<FileTemp> createState() => _FileTempState();
}

class _FileTempState extends State<FileTemp> {
  List<String> test = [
    'Test1',
    'Test2',
    'Test3',
    'Test1',
    'Test2',
    'Test3',
  ];

  List<String> files = [
    'file 1',
    'file 2',
    'file 3',
  ];

  List<MyFiles> file = [
    MyFiles("fileName1", Icons.image, "fileSize", "time"),
    MyFiles("fileName2", Icons.image, "fileSize", "time"),
    MyFiles("fileName3", Icons.image, "fileSize", "time"),
  ];

  List<TheTemplates> template = [
    TheTemplates("name", false, "date"),
    TheTemplates("name2", false, "date"),
    TheTemplates("name3", false, "date"),
    TheTemplates("name3", false, "date"),
  ];

  bool swap = false;

  // to edit and delete new

  // end of edit and delete new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Files and Templates"),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                activeBgColor: [
                  Colors.purple.shade300,
                  Colors.purple.shade400,
                  Colors.purple.shade500,
                ],
                activeFgColor: Colors.white,
                customIcons: const [
                  Icon(Icons.file_copy_outlined),
                  Icon(Icons.folder),
                ],
                minWidth: 140,
                initialLabelIndex: swap ? 1 : 0,
                animate: true,
                animationDuration: 2,
                totalSwitches: 2,
                labels: const ['Files', 'Templates'],
                onToggle: (index) {
                  print('switched to: $index');
                  setState(() {
                    if (index == 0) {
                      page = false;
                      index = index;
                      swap = !swap;
                    } else if (index == 1) {
                      page = true;
                      index = index;

                      swap = !swap;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: MediaQuery.of(context).size.height - 300,
                //   child: GridView.count(crossAxisCount: test.length,children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     decoration: BoxDecoration(
                //       color: Colors.purple,
                //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //     ),
                //     child: Center(child: Text("Test")),
                //   ),
                // ),
                //   ]),

                child: page == false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: file.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(file[index].image),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          file[index].time.toString(),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          file[index].fileName.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(file[index].fileSize.toString()),
                                      ],
                                    ),
                                    trailing: SizedBox(
                                      width: 150,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.remove_red_eye)),
                                          IconButton(
                                              onPressed: () {
                                                //rename
                                              },
                                              icon: const Icon(Icons.edit)),
                                          IconButton(
                                              onPressed: () {
                                                // showDialog(
                                                //   context: context,
                                                //   builder:
                                                //       (BuildContext context) {
                                                //     return AlertDialog(
                                                //       title: Column(
                                                //         children: [
                                                //           Row(
                                                //             children: [
                                                //               Icon(Icons.delete),
                                                //               SizedBox(
                                                //                 width: 10,
                                                //               ),
                                                //               Text(
                                                //                   'Confirmation'),
                                                //             ],
                                                //           ),
                                                //           Divider()
                                                //         ],
                                                //       ),
                                                //       content: Text(
                                                //           'Are you sure you want to delete this File?'),
                                                //       actions: [
                                                //         TextButton(
                                                //           // Colors.black,
                                                //           onPressed: () {
                                                //
                                                //             Navigator.pop(
                                                //                 context);
                                                //           },
                                                //           child: Text('CANCEL'),
                                                //         ),
                                                //         TextButton(
                                                //           //   textColor: Colors.black,
                                                //           onPressed: () {
                                                //             setState(() {
                                                //               files.remove(
                                                //                   files[index]);
                                                //
                                                //             });
                                                //
                                                //             Navigator.pop(
                                                //                 context);
                                                //
                                                //           },
                                                //           child: Text('ACCEPT'),
                                                //         ),
                                                //       ],
                                                //     );
                                                //   },
                                                // );
                                                file.removeAt(index);
                                                setState(() {});
                                              },
                                              icon: const Icon(Icons.delete)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              width: 200,
                              height: 100,
                              child: InkWell(
                                onTap: () {
                                  getImage();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.image),
                                    Text("New File",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "Click to this area to upload",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    // templates page
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return const NewTemplate();
                                    }));
                                  },
                                  icon: const Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.purple,
                                  ),
                                  label: const Text("New"),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: template.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
                                    value: template[index].checked,
                                    onChanged: (value) {
                                      template[index].checked =
                                          !template[index].checked!;
                                      setState(() {});
                                    },
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        template[index].name.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(template[index].date.toString()),
                                    ],
                                  ),
                                  trailing: SizedBox(
                                    width: 150,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove_red_eye)),
                                        IconButton(
                                            onPressed: () {
                                              //rename
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Row(
                                                          children: const [
                                                            Icon(Icons.delete),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Confirmation'),
                                                          ],
                                                        ),
                                                        const Divider()
                                                      ],
                                                    ),
                                                    content: const Text('Edit'),
                                                    actions: [
                                                      TextButton(
                                                        // Colors.black,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('CANCEL'),
                                                      ),
                                                      TextButton(
                                                        //   textColor: Colors.black,
                                                        onPressed: () {
                                                          // setState(() {
                                                          //   files.(
                                                          //       files[index]);
                                                          //   //CacheHelper.saveData(
                                                          //   // key: "Kids", value: kids);
                                                          // });

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('ACCEPT'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Row(
                                                          children: const [
                                                            Icon(Icons.delete),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Confirmation'),
                                                          ],
                                                        ),
                                                        const Divider()
                                                      ],
                                                    ),
                                                    content: const Text(
                                                        'Are you sure you want to delete this File?'),
                                                    actions: [
                                                      TextButton(
                                                        // Colors.black,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('CANCEL'),
                                                      ),
                                                      TextButton(
                                                        //   textColor: Colors.black,
                                                        onPressed: () {
                                                          setState(() {
                                                            files.remove(
                                                                files[index]);
                                                            //CacheHelper.saveData(
                                                            // key: "Kids", value: kids);
                                                          });

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('ACCEPT'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.delete)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
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
