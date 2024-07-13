import 'package:child_moments/cubits/teacher/teacher_cubit.dart';
import 'package:child_moments/models/teacher.dart';
import 'package:child_moments/modules/teachers/add_teacher.dart';
import 'package:child_moments/modules/teachers/info.dart';
import 'package:child_moments/modules/teachers/teacher_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/Local/shared_pref.dart';
import '../../cubits/teacher/getteacher/getteacher_cubit.dart';

class Teachers extends StatefulWidget {
  const Teachers({super.key});

  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  String id = "";
  //List<Teacher> teachers = <Teacher>[];
  @override
  void initState() {
//GetTeacherCubit cubit = GetTeacherCubit.get(context);

    if (CacheHelper.getData(key: "schoolid") != null) {
      id = CacheHelper.getData(key: "schoolid");
    } else {
      id = "6364f3b8ed482e001638ab90";
    }

    GetTeacherCubit.get(context).getTeachers(id);
    // teachers = GetTeacherCubit.get(context).teachers;
    super.initState();
  }

  //   Teacher(
  //       //avatar: "assets/photos/classes.1f8b8228.png",
  //       email: "shadyosama@gmail.com",
  //       firstName: "shady",
  //       status: "INVITED"),
  //   Teacher(
  //       //avatar: "assets/photos/classes.1f8b8228.png",
  //       email: "shadyosamxca@gmail.com",
  //       firstName: "name2",
  //       status: "ACTIVE"),
  //   Teacher(
  //       // avatar: "assets/photos/classes.1f8b8228.png",
  //       email: "shaama@gmail.com",
  //       firstName: "name3",
  //       status: "INVITED"),
  //   Teacher(
  //       // avatar: "assets/photos/classes.1f8b8228.png",
  //       email: "shaja@gmail.com",
  //       firstName: "name4",
  //       status: "INACTIVE")
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTeacherCubit, GetTeacherState>(
      listener: (context, state) {
        if (state is SuccessfulDataUsers) {
          Fluttertoast.showToast(
              msg: "data loaded successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          //  return const Darshboard();
          //}));
        }
        if (state is ErrorDataUsers) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        GetTeacherCubit cubit = GetTeacherCubit.get(context);
        //   if (CacheHelper.getData(key: "schoolid") != null) {
        //     id = CacheHelper.getData(key: "schoolid");
        //   } else {
        //     id = "6364f3b8ed482e001638ab90";
        //   }

        //  /// teachers = cubit.teachers;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(125.h),
            child: AppBar(
              elevation: 4,
              title: const Text(
                "Child Moments",
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
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 18, top: 28),
                        child: InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                //  delegate to customize the search bar
                                delegate: CustomSearchDelegate2(
                                    teachers: cubit.allteachers!.data!));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 190.w),
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
                    Padding(
                      padding: EdgeInsets.only(top: 25.h, right: 10.w),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => addTeacher()));
                          },
                          child: const Text(
                            "+ Add new Teacher",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              //actions: [],
            ),
          ),
          /////////////////////
          body: state is LoadingDataUsers
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/photos/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: cubit.allteachers!.data!.length,
                    //cubit.allteachers!.data!.length,
                    itemBuilder: (<Teacher>(context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(cubit
                                .allteachers!.data![index].firstName
                                .toString()),
                            subtitle: Column(children: [
                              Text(
                                  //cubit.allteachers!.data!
                                  "Email: ${cubit.allteachers!.data![index].email.toString()}",
                                  style: TextStyle(fontSize: 12.sp)),
                              Text(
                                "Status: ${cubit.allteachers!.data![index].status.toString()}",
                                style: TextStyle(fontSize: 12.sp),
                              )
                            ]),
                            //leading: CircleAvatar(
                            //backgroundImage:
                            //   AssetImage(teachers[index].avatar.toString())),
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
                                                    teacher: cubit.allteachers!
                                                        .data![index])));
                                      },
                                      icon: const Icon(Icons.info)),
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
                                                      const Text(
                                                          'Confirmation'),
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
                                                    setState(() {
                                                      ///////////////////////
                                                      cubit.allteachers!.data!
                                                          .remove(cubit
                                                              .allteachers!
                                                              .data![index]);
                                                      //////////////////////
                                                      //CacheHelper.saveData(
                                                      // key: "Kids", value: kids);
                                                    });

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
                  ),
                ),

          /////////////
        );
      },
    );
  }
}
