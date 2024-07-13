import 'package:badges/badges.dart';
import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/models/dashboard_photos.dart';
import 'package:child_moments/modules/Kids/kids.dart';
import 'package:child_moments/modules/Reports/reports.dart';
import 'package:child_moments/modules/Rooms/rooms.dart';
import 'package:child_moments/modules/auth/login_screen.dart';
import 'package:child_moments/modules/invoices/invoices.dart';
import 'package:child_moments/modules/platfrom_subs/platform_subs.dart';
import 'package:child_moments/modules/profile_manager/manager_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../activities/activities.dart';
import '../files_and_Templates/file_and_templates_home.dart';
import '../parent_msg/parent_msg.dart';
import '../teachers/teachers.dart';

class Darshboard extends StatefulWidget {
  const Darshboard({super.key});

  @override
  State<Darshboard> createState() => _DarshboardState();
}

class _DarshboardState extends State<Darshboard> {
  List<DashBoardPhotos> photos = <DashBoardPhotos>[
    DashBoardPhotos(
        image: "assets/photos/Bills-and-plans.510a8cba.png",
        colory: Colors.blue,
        text: 'Platform Subscription'),
    DashBoardPhotos(
        image: "assets/photos/classes.1f8b8228.png",
        colory: Colors.greenAccent,
        text: 'Rooms'),
    DashBoardPhotos(
        image: "assets/photos/Invoice.d2acd90d.png",
        colory: Colors.red,
        text: 'Invoices'),
    DashBoardPhotos(
        image: "assets/photos/Kids.25728618.png",
        colory: Colors.deepPurpleAccent,
        text: 'Kids'),
    DashBoardPhotos(
        image: "assets/photos/Parent Message.f1af5cbe.png",
        colory: Colors.orangeAccent,
        text: 'Parents Messaging'),
    DashBoardPhotos(
        image: "assets/photos/Report.311c78b0.png",
        colory: Colors.pink,
        text: 'Reports'),
    DashBoardPhotos(
        image: "assets/photos/Teachers.7466149e.png",
        colory: Colors.deepOrangeAccent,
        text: 'Teachers'),
    DashBoardPhotos(
        image: "assets/photos/template and files.afe55aac.png",
        colory: Colors.deepPurple,
        text: 'Files & Templates'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          width: 230,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(30),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(70.r)),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Color.fromARGB(255, 11, 68, 114),
                          Colors.redAccent,
                          Colors.red,
                        ],
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Child moments",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 49.w,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_outlined),
                            color: Colors.white,
                          )
                        ],
                      )),
                      InkWell(
                        child: const CircleAvatar(
                            radius: 40,
                            foregroundImage: AssetImage(
                                "assets/photos/6C983E0B-BA17-48B2-A38F-C148CED65EEF.jpeg")),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ManagerProfile()),
                          );
                        },
                      ),
                      const Text(
                        "نورة السبيعي",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Text(
                        "روضة قرية الطفل",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ...photos.map((e) => InkWell(
                      onTap: (() {
                        if (e.text == "Rooms") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Rooms()));
                        } else if (e.text == "Kids") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const Kids()));
                        } else if (e.text == "Teachers") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Teachers()));
                        } else if (e.text == "Invoices") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Invoices()));
                        } else if (e.text == "Platform Subscription") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PlatformS()));
                        } else if (e.text == "Reports") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Reports()));
                        } else if (e.text == "Parents Messaging") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ParentMsg()));
                        } else if (e.text == "Files & Templates") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const FileTemp()));
                        }
                        // else if (photos[index].text == "Reports") {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (_) =>  Attendance()));
                        // }
                        else if (e.text == "Invoices") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Activities()));
                        }

                        // Navigator.push(
                        //     context,
                        //     BouncyPageRoute(
                        //         widget: Categorized(
                        //       catg: cubit.Categories[index].toString(),
                        //     ))

                        //     );
                      }),
                      child: ListTile(
                        title: Text(
                          e.text,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                        leading: Container(
                          height: 40,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(e.image))),
                        ),
                      ),
                    )),
                const Divider(
                  thickness: 0.3,
                  color: Colors.blueGrey,
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.warning),
                    title: Text("About"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.contact_page),
                    title: Text("Contact"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    leading: Icon(Icons.help),
                    title: Text("Help"),
                  ),
                ),
                const Divider(
                  thickness: 0.3,
                  color: Colors.blueGrey,
                ),
                InkWell(
                  onTap: () {
                    CacheHelper.removeData(key: "email");
                    CacheHelper.removeData(key: "password");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
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
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.red, Colors.blue]),
            ),
          ),
          title: const Text("Child moments"),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "روضة قرية الطفل",
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.08,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: photos.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.12,
                        ),
                        itemBuilder: (context, index) => InkWell(
                              onTap: (() {
                                if (photos[index].text == "Rooms") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Rooms()));
                                } else if (photos[index].text == "Kids") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Kids()));
                                } else if (photos[index].text == "Teachers") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Teachers()));
                                } else if (photos[index].text == "Invoices") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Invoices()));
                                } else if (photos[index].text ==
                                    "Platform Subscription") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const PlatformS()));
                                } else if (photos[index].text == "Reports") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Reports()));
                                } else if (photos[index].text ==
                                    "Parents Messaging") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const ParentMsg()));
                                } else if (photos[index].text ==
                                    "Files & Templates") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const FileTemp()));
                                }
                                // else if (photos[index].text == "Reports") {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (_) =>  Attendance()));
                                // }
                                else if (photos[index].text == "Invoices") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Activities()));
                                }

                                // Navigator.push(
                                //     context,
                                //     BouncyPageRoute(
                                //         widget: Categorized(
                                //       catg: cubit.Categories[index].toString(),
                                //     ))

                                //     );
                              }),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 2, right: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: photos[index].colory,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 123.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              AssetImage(photos[index].image),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      photos[index].text,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
