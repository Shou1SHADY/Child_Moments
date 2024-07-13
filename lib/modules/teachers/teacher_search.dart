import 'package:child_moments/cubits/teacher/teacher_cubit.dart';
import 'package:child_moments/models/teacher.dart';
import 'package:child_moments/modules/teachers/info.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchDelegate2 extends SearchDelegate {
  // Demo list to show querying
  String ascending = "Ascending";
  String descending = "Descending";
  bool isAscending = false;
  List<Teacher> teachers;
  CustomSearchDelegate2({required this.teachers});

  Widget buttonAsc(int index) {
    if (index == 0) {
      return BlocConsumer<TeacherCubit, TeacherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                isAscending = !isAscending;
                List<Teacher> reversed = teachers.reversed.toList();
                teachers = reversed;
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isAscending ? Text(descending) : Text(ascending),
                  SizedBox(width: 10.w),
                  Image.asset(
                    "assets/logos/sort.png",
                    height: 25.h,
                    width: 15.w,
                  )
                ],
              ));
        },
      );
    } else {
      return SizedBox(
        height: 0.1.h,
      );
    }
  }

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Teacher> matchQuery = [];
    for (var fruit in teachers) {
      if (fruit.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.email!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return BlocConsumer<TeacherCubit, TeacherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photos/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (<Teacher>(context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    buttonAsc(index),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListTile(
                      title: Text(teachers[index].firstName.toString()),
                      subtitle: Column(children: [
                        Text("Email: ${teachers[index].email}",
                            style: TextStyle(fontSize: 12.sp)),
                        Text(
                          "Status: ${teachers[index].status}",
                          style: TextStyle(fontSize: 12.sp),
                        )
                      ]),
                      //leading: CircleAvatar(
                      // backgroundImage:
                      //  AssetImage(teachers[index].avatar.toString())),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TeacherInfo(
                                                teacher: teachers[index],
                                              )));
                                },
                                icon: const Icon(Icons.more_horiz_outlined)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.delete),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                const Text('Confirmation'),
                                              ],
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                        content: const Text(
                                            'Are you sure you want to delete this Teacher?'),
                                        actions: [
                                          TextButton(
                                            // Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('CANCEL'),
                                          ),
                                          TextButton(
                                            //   textColor: Colors.black,
                                            onPressed: () {
                                              // setState(() {
                                              //   rooms.remove(rooms[index]);
                                              //   CacheHelper.saveData(
                                              //       key: "Rooms", value: rooms);
                                              // });

                                              Navigator.pop(context);
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
                    ),
                    const Divider(),
                  ],
                );
              }),
            ));
      },
    );

//////////////////////////////////////
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Teacher> matchQuery = [];
    Widget buttonAsc(int index) {
      if (index == 0) {
        return BlocConsumer<TeacherCubit, TeacherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  isAscending = !isAscending;
                  List<Teacher> reversed = teachers.reversed.toList();
                  teachers = reversed;
                  for (var fruit in teachers) {
                    print(fruit.firstName);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isAscending ? Text(descending) : Text(ascending),
                    SizedBox(width: 10.w),
                    Image.asset(
                      "assets/logos/sort.png",
                      height: 25.h,
                      width: 15.w,
                    )
                  ],
                ));
          },
        );
      } else {
        return SizedBox(
          height: 0.1.h,
        );
      }
    }

    for (var fruit in teachers) {
      if (fruit.firstName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      } else if (fruit.email!.toString().contains(query)) {
        matchQuery.add(fruit);
      } else if (fruit.status!.toString().contains(query)) {
        matchQuery.add(fruit);
      }
    }

/////////////////////////////////////
    return BlocConsumer<TeacherCubit, TeacherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/photos/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (<Teacher>(context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    buttonAsc(index),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListTile(
                      title: Text(teachers[index].firstName.toString()),
                      subtitle: Column(children: [
                        Text("Email: ${teachers[index].email.toString()}",
                            style: TextStyle(fontSize: 12.sp)),
                        Text(
                          "Status: ${teachers[index].status.toString()}",
                          style: TextStyle(fontSize: 12.sp),
                        )
                      ]),
                      // leading: CircleAvatar(
                      //   backgroundImage:
                      //     AssetImage(teachers[index].avatar.toString())),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TeacherInfo(
                                              teacher: teachers[index])));
                                },
                                icon: const Icon(Icons.more_horiz_outlined)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.delete),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                const Text('Confirmation'),
                                              ],
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                        content: const Text(
                                            'Are you sure you want to delete this teacher?'),
                                        actions: [
                                          TextButton(
                                            // Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('CANCEL'),
                                          ),
                                          TextButton(
                                            //   textColor: Colors.black,
                                            onPressed: () {
                                              // setState(() {
                                              //   rooms.remove(rooms[index]);
                                              //   CacheHelper.saveData(
                                              //       key: "Rooms", value: rooms);
                                              // });

                                              Navigator.pop(context);
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
                    ),
                    const Divider(),
                  ],
                );
              }),
            ));
      },
    );
  }
}
