import 'package:flutter/material.dart';

import '../../models/child_list.dart';

class ChildList extends StatefulWidget {
  const ChildList({super.key});

  @override
  State<ChildList> createState() => _ChildListState();
}

class _ChildListState extends State<ChildList> {
  List<ChildsList> listOfChilds = <ChildsList>[
    ChildsList("assets/images/child.png", "childName",
        "assets/images/child.png", "schoolName"),
    ChildsList("assets/images/child.png", "child2Name",
        "assets/images/child.png", "school2sName")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listOfChilds.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(listOfChilds[index].childImage.toString(),
                      fit: BoxFit.scaleDown),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(listOfChilds[index].childName.toString()),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Image.asset(listOfChilds[index].schoolImage.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(listOfChilds[index].schoolName.toString(),
                      style: const TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
