import 'package:child_moments/modules/Reports/status_details.dart';
import 'package:child_moments/modules/Reports/status_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../models/kid.dart';

class StudentStatus extends StatefulWidget {
  const StudentStatus({super.key});

  @override
  State<StudentStatus> createState() => _StudentStatusState();
}

class _StudentStatusState extends State<StudentStatus> {
  @override
  void initState() {
    //CacheHelper.saveData(key: "Kids", value: kids);
    //rooms = CacheHelper.getData(key: "Kids");
    super.initState();
  }

  List<Kid> kids = <Kid>[
    Kid(
        avatar: "assets/photos/classes.1f8b8228.png",
        //roomName: "2",
        firstName: "shady",
        status: "invited"),
    Kid(
        avatar: "assets/photos/classes.1f8b8228.png",
        //  roomName: "2",
        firstName: "name2",
        status: "active"),
    Kid(
        avatar: "assets/photos/classes.1f8b8228.png",
        //roomName: "2",
        firstName: "name3",
        status: "invited"),
    Kid(
        avatar: "assets/photos/classes.1f8b8228.png",
        // roomName: "2",
        firstName: "name4",
        status: "inactive")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: NewGradientAppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
          elevation: 4,
          title: const Text(
            "Student Status",
            style: TextStyle(color: Colors.white),
          ),
          // bottom: ,
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 65.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 70.h,
                    padding:
                        const EdgeInsets.only(right: 18.0, left: 18, top: 28),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                            context: context,
                            //  delegate to customize the search bar
                            delegate: CustomSearchDelegate4(kids: kids));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 290.w),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////
                        // onTap: () {
                        //   // method to show the search bar
                        //   showSearch(
                        //       context: context,
                        //       // delegate to customize the search bar
                        //       delegate: CustomSearchDelegate());
                        // },
                        ///////////////////////////////////////
                        // decoration: InputDecoration(
                        //     fillColor: Colors.white,
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(25.0),
                        //       borderSide: BorderSide(
                        //         color: Colors.white,
                        //         width: 2.0,
                        //       ),
                        //     ),
                        //     prefixIcon: Icon(
                        //       Icons.search,
                        //       color: Colors.white,
                        //     )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //actions: [],
        ),
      ),
      /////////////////////
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/photos/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.builder(
          itemCount: kids.length,
          itemBuilder: (<Kid>(context, index) {
            return Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(kids[index].firstName.toString()),
                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  ),
                  subtitle: Column(children: [
                    Text("Room Name: ${kids[index].lastName.toString()}",
                        style: TextStyle(fontSize: 12.sp)),
                    Text(
                      "Status: ${kids[index].status.toString()}",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ]),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(kids[index].avatar.toString())),
                  trailing: SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => StatusDetails(
                                            kidView: kids[index],
                                          )));
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            );
          }),
        ),
      ),

      /////////////
    );
  }
}
